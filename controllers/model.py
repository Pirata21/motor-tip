from sqlalchemy import *
from sqlalchemy.orm import *

db_engine = create_engine('sqlite:///controllers/autotip.db', pool_recycle=3600)

metadata = MetaData()
metadata.bind = db_engine

#User
user_table = Table('User', metadata,
							Column('Id', Integer, primary_key=True),
							autoload=True)						
class User(object):
	pass


#Lead
lead_table = Table('Lead', metadata,
							Column('Id', Integer, primary_key=True),
							autoload=True)
class Lead(object):
	pass


#Transaction
transaction_table = Table('Transaction', metadata,
							Column('Id', Integer, primary_key=True),
							Column('User_Id', Integer, ForeignKey('User.Id')),
							Column('Lead_Id', Integer, ForeignKey('Lead.Id')),
							autoload=True)
class Transaction(object):
	pass
	
	
#Credits Logs
credits_logs = Table('Credits_log', metadata,
									Column('Id', Integer, primary_key=True),
									Column('User', Integer, ForeignKey('User.Id')),
									autoload=True
					)

class CreditsLogs(object):
	pass

mapper(CreditsLogs, credits_logs)

mapper(Transaction, transaction_table )
					
mapper(User, user_table, properties= { 'Leads' :relationship(Lead, secondary=transaction_table) , 'Transactions' : relationship(Transaction, backref='User')} )

mapper(Lead, lead_table, properties={ 'Users' :relationship(User, secondary=transaction_table)})