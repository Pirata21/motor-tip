"""create lead table

Revision ID: 493df190795b
Revises: 20b2081e3730
Create Date: 2012-08-28 13:09:36.984436

"""

# revision identifiers, used by Alembic.
revision = '493df190795b'
down_revision = '20b2081e3730'

from alembic import op
import sqlalchemy as sa


def upgrade():
	op.create_table(
	'Lead',
	sa.Column('Id', sa.Integer, primary_key=True), 
	sa.Column('Name', sa.String(length=80)),
	sa.Column('Phone', sa.String(length=20)),
	sa.Column('Email', sa.String(length=100)),
	sa.Column('Source', sa.String(length=80)),
	sa.Column('Emarketer', sa.String(length=80)),
	sa.Column('Search', sa.String(length=80)),
	sa.Column('Campaign', sa.String(length=80)),
	sa.Column('AdGroup', sa.String(length=80)),
	sa.Column('Keyword', sa.String(length=80)),
	sa.Column('Price', sa.String(length=80)),
	sa.Column('Year', sa.String(length=80)),
	sa.Column('Fuel', sa.String(length=80)),
	sa.Column('Brand', sa.String(length=80)),
	sa.Column('Model', sa.String(length=80)),
	sa.Column('Comments', sa.String(length=80)),
	sa.Column('Type',  sa.String(length=80)))
	pass
def downgrade():
	op.drop_table('Lead')
	pass


