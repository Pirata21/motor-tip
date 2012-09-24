"""add credits log 

Revision ID: 3034c0c3c398
Revises: 17d59c4385b6
Create Date: 2012-09-12 15:48:44.092371

"""

# revision identifiers, used by Alembic.
revision = '3034c0c3c398'
down_revision = '17d59c4385b6'

from alembic import op
import sqlalchemy as sa



def upgrade():
	op.create_table(
	'Credits_log',
	sa.Column('Id', sa.Integer, primary_key=True), 
	sa.Column('Type', sa.String(length=80)),
	sa.Column('User', sa.String(length=20)),
	sa.Column('Date', sa.DateTime)),
	sa.Column('Quantity', sa.Integer)
	pass
	
def downgrade():
	op.drop_table('Credits_log')
	pass