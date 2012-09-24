"""create transaction table

Revision ID: 22f29ab70862
Revises: 493df190795b
Create Date: 2012-08-28 13:19:54.813055

"""

# revision identifiers, used by Alembic.
revision = '22f29ab70862'
down_revision = '493df190795b'

from alembic import op
import sqlalchemy as sa


def upgrade():
	op.create_table(
	'Transaction',
	sa.Column('Id', sa.Integer, primary_key=True), 
	sa.Column('Lead_Id',sa.Integer),
	sa.Column('User_Id', sa.Integer))
	pass
def downgrade():
	op.drop_table('Transaction')
	pass
