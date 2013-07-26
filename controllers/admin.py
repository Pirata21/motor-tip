from bottle import *
import model
import pdb
import login
import hashlib, uuid

####################### 
# SUPER ADMIN SECTION #
#######################
# TO DO: CHECK THE SUPER ADMIN

# SUPER ADMIN
# userList() - USARIO MAIL O NO- MAIL 2 VECES POR DIA 8 - 14
# Show the list of the active users on the site
@route('/admin/users')
@route('/admin/users/<status>')
def userList(status=None):
	user = login.checkSession()
	login.checkIsAdmin()
	dbs = model.Session()
	userList = dbs.query(model.User).filter(model.User.IsAdmin != True).all()
	dbs.close()
	
	return template('admin_includes/userList', content=userList, stats=status, user=user)


# SUPER ADMIN	
# Add User
# Show the form to save the new Users
@get('/admin/add_user')
def addUser():
	# template con form
	user = login.checkSession()
	login.checkIsAdmin()
	return template('admin_includes/addUser', user=None, text='')


# SUPER ADMIN
# Delete User
# Remove the user by Id
# @param get userId
# @return the status on Json format
@get('/admin/remove_user/<userid>')
def removeUser(userid):
	user = login.checkSession()
	login.checkIsAdmin()
	dbs = model.Session()
	userI = dbs.query(model.User).get(userid)
	dbs.delete(userI)
	dbs.commit()
	dbs.close()
	payload = {}
	payload['success'] = True
	return payload


# SUPER ADMIN
# Load the data of the user and show it on a form 
# @return template with the user data to edit
@get('/admin/edit_user/<userid>')
def editUser(userid):
	user = login.checkSession()
	login.checkIsAdmin()
	dbs = model.Session()
	user = dbs.query(model.User).get(userid)
	dbs.close()
	return template('admin_includes/addUser', user=user, text='Editar')


@route('/admin')
def admin() :
	user = login.checkSession()
	login.checkIsAdmin()
	redirect('/admin/users')
	#return template('admin_includes/home', user=user)


# SUPER ADMIN
#Save User	
@post('/admin/save_user')
def addUser():
	user = login.checkSession()
	login.checkIsAdmin()
	dbs = model.Session()
	renewPass = True
	if request.forms.id :
		userI = dbs.query(model.User).get(request.forms.id)
		if not request.forms.password :
			renewPass = False
	else:
		userI = model.User()
	
	salt = uuid.uuid4().hex
	hashed_password = hashlib.sha1(request.forms.password + salt).hexdigest()
	userI.Username = request.forms.name
	userI.Email = request.forms.email
	
	if renewPass :
		userI.Password = hashed_password
		userI.Hash = salt
	
	userI.Credit = request.forms.credits
	
	userI.IsAdmin = False
	dbs.add(userI)
	dbs.commit()
	dbs.close()
	redirect('/admin/users/ok')




@get('/admin/delete_lead/<leadId>')
def deleteLead(leadId):
	user = login.checkSession()
	login.checkIsAdmin()
	dbs = model.Session()
	Lead = dbs.query(model.Lead).get(leadId)
	dbs.delete(Lead)
	dbs.commit()
	dbs.close()
	redirect('/admin/leads')


@get('/admin/delete_user/<uId>')
def deleteLead(uId):
	user = login.checkSession()
	login.checkIsAdmin()
	dbs = model.Session()
	User = dbs.query(model.User).get(uId)
	dbs.delete(User)
	dbs.commit()
	dbs.close()
	redirect('/admin/users')