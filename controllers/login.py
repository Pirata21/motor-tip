from bottle import *
import model
import pdb
import hashlib, uuid


# Check Session()
# Check the session in the cookie, if the user are None: redirect to the login
# else we return the user object 
# @return User
def checkSession():
	username = request.get_cookie("user_logged_in", secret='likeaboss')
	if not username:
		redirect('/login')
	else :
		dbs = model.Session()
		result = dbs.query(model.User).filter(model.User.Email==username)
		user = result.first()
		dbs.close()
		return user




# Login
# Check the status of the session and redirect to the user page 
# or show Show the login form
@route('/login')
def index():
	username = request.get_cookie("user_logged_in", secret='likeaboss')
	
	if username:
		redirect('/leads')
	else:
		return template('login', content='Hello World!', body='default')
		

# Login checker()
# The function retrive the email and the password(POST METHOD) and check on the database
# @return a Json with the status
@post('/user/login_check')
def login():
	dbs = model.Session()
	email = request.forms.email
	password = request.forms.password
	payload = {}
	result = dbs.query(model.User).filter(model.User.Email==email)
	user = result.first()
	if user is None:
		payload['user'] = 'Error'
	else:
		my_hash = ''
		salt = user.Hash
		hashed_password = hashlib.sha1(password + salt).hexdigest()
		if hashed_password == user.Password :
			response.set_cookie("user_logged_in", email, secret='likeaboss', path='/')
			payload['success'] = True
			if user.IsAdmin:
				payload['page_redirect'] = '/admin'
			else:
				payload['page_redirect'] = '/leads'
		else :
			payload['success'] = False
			payload['user'] = 'pass'
			
	return payload

# Exit()
# Clear the session for the user
# @Redirect to the Login Page
@route('/user/exit')
def exit():
	response.set_cookie("user_logged_in", None, secret='likeaboss',  path='/')
	redirect('/login')


# Just to Test
@route('/restricted')
def restricted_area():
	user = checkSession()
 	return template('user_includes/restricted', user=user)
   



def checkIsAdmin():
	
	username = request.get_cookie("user_logged_in", secret='likeaboss')
	if username:
		dbs = model.Session()
		result = dbs.query(model.User).filter(model.User.Email==username)
		user = result.first()
		dbs.close()
		if user.IsAdmin:
			return True
		else:
			redirect('/restricted')
	else:
		redirect('/restricted')