"""create user table

Revision ID: 20b2081e3730
Revises: None
Create Date: 2012-08-28 12:45:17.367598

"""

# revision identifiers, used by Alembic.
revision = '20b2081e3730'
down_revision = None

from alembic import op
import sqlalchemy as sa


def upgrade():
	op.create_table(
	'User',
	sa.Column('Id', sa.Integer, primary_key=True), 
	sa.Column('Username', sa.String(length=80)),
	sa.Column('Password', sa.String(length=20)),
	sa.Column('Email', sa.String(length=100)),
	sa.Column('Hash', sa.String(length=80)),
	sa.Column('IsAdmin', sa.Boolean),
	sa.Column('Credit', sa.Integer))
	pass
def downgrade():
	op.drop_table('User')
	pass