from bottle import *
import admin
import login
import model
import json
import pdb
import hashlib, uuid
from sqlalchemy import desc, and_
from datetime import datetime, date


# Home()
# Default Page
@route('/')
def home():
	dbs = model.Session()
	latestLeads = dbs.query(model.Lead).order_by(model.Lead.Date.desc())[0:5]
	ret = ''
	for l in latestLeads:
		firstword = str(l.Name).split(' ',1)
		sol = l.Type or l.Brand
		ret += '<li>'+str(firstword[0]) + ' solicito un '+ sol +'</li>'
	return ret

	
# User()
# The user's home 
@get('/user/')
@get('/user')
def userHome():
	user = login.checkSession()
	return template('user_includes/home_user', user=user)

# Form Lead
#
@get('/precio/')
@get('/precio')
def lead():
	return template('public_site/form2')


# Form Lead
#
@get('/modelo/')
@get('/modelo')
def lead():
	return template('public_site/form')

@route('/addCredits')
@route('/addCredits/')
@post('/addCredits')
def addCredits():
	user = login.checkSession()
	qty = request.forms.quantity
	if qty:
		payload = {}
		payload['success'] = True
		#TO DO send email
		return payload
	else:
		return template('user_includes/addCredits', user=user)
	
	

@route('/lead/detail/<idL>')
def detail(idL):
	dbs = model.Session()
	user = login.checkSession()
	lead = dbs.query(model.Lead).filter(model.Lead.Id == idL).first()
	
	if lead.Users:
		lead.Users[0].Id == user.Id
	else :
		lead=None
	
	dbs.close()
	return template('user_includes/leadDetail', content=lead, user=user )
	

#
@get('/buy/<leadId>')
def buy(leadId):
	user = login.checkSession()
	dbs = model.Session()
	lead = dbs.query(model.Lead).filter(model.Lead.Id == leadId).first()
	
	
	totalTransactions = 0
	maxBuyers = lead.MaxBuyers
	canBuy = False
	
	#Load the transactions for the lead
	if lead.Users:
		totalTransactions = len(lead.Users)
		#lead.Users[0].Id == user.Id
	
	#Check if can I buy the Lead
	if totalTransactions < maxBuyers:
		canBuy = True
	
	#Check if the current user have credits
	if user.Credit > 0:
		user.Credit = user.Credit - 1 
	else :
		return 'No tienes suficientes Creditos para comprar' #TO DO Page: you don't have enought credits
		
	if canBuy:
		#save Transactions
		T = model.Transaction()
		T.User_Id = user.Id
		T.Lead_Id =  leadId
		dbs.add(T)
		
		# Save the log
		cLog = model.CreditsLogs()
		cLog.User = user.Id
		cLog.Type = 'Buy'
		cLog.Date = datetime.now()
		cLog.Quantity = 1
		dbs.add(cLog)
		
		#Save User
		dbs.add(user)
		dbs.commit()
		dbs.close()
		redirect('/lead/detail/'+leadId)
	
	else:
		
		return str(lead.MaxBuyers) + ' Total Compras:' + str(totalTransactions)
	
	
	'''
	
	
	
	
	if user.Credit > 0:
		user.Credit = user.Credit - 1 
	else :
		return 'no'
	
	dbs.add(user)
	dbs.commit()
	
	dbs.close()
	redirect('/leads')
	'''


@post('/save/')
@post('/save')
def save():
	dbs = model.Session()
	renewPass = True
	Lead = model.Lead()
	Lead.Name = request.forms.name
	Lead.Phone = request.forms.phone
	Lead.Email = request.forms.email
	Lead.Date = datetime.now()
	Lead.Price = request.forms.price
	Lead.Year = request.forms.year
	Lead.Fuel = request.forms.fuell
	Lead.Brand = request.forms.brand
	Lead.Model = request.forms.model
	Lead.Comments = request.forms.comments
	Lead.Type = request.forms.typeCar
	Lead.MaxBuyers = request.forms.maxBuyers
	
	
	dbs.add(Lead)
	dbs.commit()
	dbs.close()
	redirect('/confirmacion')


@route('/confirmacion')
def confirmacion():
	
	return 'confirmacion'


@route('/leads')
@route('/leads/<filter>')
def leadList(filter='all'):
	#dbs = model.Session()
	#leadList = dbs.query(model.Lead).all()
	#dbs.close()
	user = login.checkSession()
	return template('user_includes/home_user', content=filter, user=user)


@get('/leads/json')
@post('/leads/json')
@get('/leads/json/<filter>')
@post('/leads/json/<filter>')
def leadList(filter=''):
	dbs = model.Session()

	page = request.forms.page
	qtype = request.forms.qtype
	query = request.forms.query
	rp = request.forms.rp
	sortname = request.forms.sortname
	sortorder = request.forms.sortorder
	user = login.checkSession()

	
	if int(page) == 1:
		first = 0
		last = int(rp) * int(page)
	else:
		first = (int(rp) * int(page) ) - int(rp)
		last = int(rp) + (int(rp) * int(page))
		
	# SORT ORDER
	if sortname == 'name':
		sortname = model.Lead.Name
	if sortname == 'model':
		sortname = model.Lead.Model
	elif sortname == 'date':
		sortname = model.Lead.Date
	elif sortname == 'brand':
		sortname = model.Lead.Brand
	elif sortname == 'price':
		sortname = model.Lead.Price
	elif sortname == 'type':
		sortname = model.Lead.Type
	elif sortname == 'fuell':
		sortname = model.Lead.Fuel
	elif sortname == 'id':
		sortname = model.Lead.Id
	else :
		sortname = model.Lead.Date
	
	# SORT ORDER
	if qtype == 'name':
		qtype = model.Lead.Name
	if qtype == 'model':
		qtype = model.Lead.Model
	elif qtype == 'date':
		qtype = model.Lead.Date
	elif qtype == 'brand':
		qtype = model.Lead.Brand
	elif qtype == 'price':
		qtype = model.Lead.Price
	elif qtype == 'type':
		qtype = model.Lead.Type
	elif qtype == 'fuell':
		qtype = model.Lead.Fuel
	elif qtype == 'id':
		qtype = model.Lead.Id
	else :
		qtype = model.Lead.Date

	
	#ORDER BY
	if sortorder == 'asc':	
		if query :
			
			if filter=='my':
				leadList = dbs.query(model.Lead).order_by(sortname.asc()).filter(and_(model.Lead.Users.any(Id=user.Id)),(qtype.like('%'+query+'%')))
			else:
				leadList = dbs.query(model.Lead).order_by(sortname.asc()).filter(qtype.like('%'+query+'%'))
			
			
		else:
			if filter=='my':
				leadList = dbs.query(model.Lead).order_by(sortname.asc()).filter(model.Lead.Users.any(Id=user.Id))
			else:
				leadList = dbs.query(model.Lead).order_by(sortname.asc())
			
	else:
		if query :
			
			if filter=='my':
				leadList = dbs.query(model.Lead).order_by(sortname.desc()).filter(and_(model.Lead.Users.any(Id=user.Id)),(qtype.like('%'+query+'%')))
			else:
				leadList = dbs.query(model.Lead).order_by(sortname.desc()).filter(qtype.like('%'+query+'%'))
			
		else:
			if filter=='my':
				leadList = dbs.query(model.Lead).order_by(sortname.desc()).filter(model.Lead.Users.any(Id=user.Id))
			else:
				leadList = dbs.query(model.Lead).order_by(sortname.desc())
	
	
	total = leadList.count()	
	leadList = leadList.order_by(model.Lead.Id)[first:last]
	leads = []

	for lead in leadList :
		leadItem = {}
		leadItem['cell'] = {}
		leadItem['id']  = lead.Id
		leadItem['cell']['name']  = 'XXXXXX'
		leadItem['cell']['phone']  = 'XXXXXX'
		leadItem['cell']['email']  = 'XXXXXX'
		leadItem['cell']['id']  = lead.Id
		leadItem['cell']['price']  = lead.Price
		leadItem['cell']['brand']  = lead.Brand#MaxBuyers #Brand
		leadItem['cell']['fuell']  = lead.Fuel
		leadItem['cell']['model']  = lead.Model
		leadItem['cell']['comments']  = lead.Comments
		leadItem['cell']['type']  = lead.Type
		
		
		status = ''
		
		if not lead.Users:
		  status = '<a onclick="confirmBuy(\''+str(lead.Id)+'\', \''+str(lead.Brand)+'\')" href="javascript:;" class="btn-mini btn-success btn"><i class="icon-ok icon-white"></i> Obtener</a>'
		else: 
			if(lead.MaxBuyers > len(lead.Users)):
				haveLead = False
				for u in lead.Users:
					if u.Id == user.Id:
						haveLead = True
						break
					
				if haveLead:
					status = '<a href="/lead/detail/'+str(lead.Id)+'" class="btn-mini btn-info btn"><i class="icon-zoom-in icon-white"></i> Ver Info</a>'
					leadItem['cell']['name']  = lead.Name
					leadItem['cell']['phone']  = lead.Phone
					leadItem['cell']['email']  = lead.Email			
				
				else:
					status = '<a onclick="confirmBuy(\''+str(lead.Id)+'\', \''+str(lead.Brand)+'\')" href="javascript:;" class="btn-mini btn-success btn"><i class="icon-ok icon-white"></i> Obtener</a>'
			
				#if lead.Users[0].Id == user.Id:
						
			else :
				haveLead = False
				for u in lead.Users:
					if u.Id == user.Id:
						haveLead = True
						break
				if haveLead:
					status = '<a href="/lead/detail/'+str(lead.Id)+'" class="btn-mini btn-info btn"><i class="icon-zoom-in icon-white"></i> Ver Info</a>'
					leadItem['cell']['name']  = lead.Name
					leadItem['cell']['phone']  = lead.Phone
					leadItem['cell']['email']  = lead.Email			
				
				else:
					status = '<a href="#" class="btn-mini btn-danger disabled btn">No Disponible</a>'
			
		leadItem['cell']['year'] = lead.Year
		if (lead.Date.date() == datetime.today().date()):
			leadItem['cell']['date'] = '<b>Hoy a las '+lead.Date.strftime("%H:%M")+'</b>'
			
		else:
			leadItem['cell']['date'] = lead.Date.strftime("%d-%m-%Y %H:%M")
		
		leadItem['cell']['action'] =  status
		leads.append(leadItem)
		
	json_dict = {
	'page': page,
	'total': total,
	'rows': leads
	}
	dbs.close
	return  json.dumps(json_dict)
	
	'''
	page	2
	qtype	name
	query	
	rp	10
	sortname	name
	sortorder	asc
	'''	

########################## 
# ERROR AND STATIC FILES #
##########################

# error(404)
# Redirect to the 404 template #TO DO
@error(404)
def error404(error):
    return 'Nothing here, sorry'
    
#
# Static Files Route
#
@route('/static/:path#.+#', name='static')
def static(path):
    return static_file(path, root='static')


