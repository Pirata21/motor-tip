"""add max buyers

Revision ID: 1dff83a468a5
Revises: 3034c0c3c398
Create Date: 2012-09-19 13:07:53.931880

"""

# revision identifiers, used by Alembic.
revision = '1dff83a468a5'
down_revision = '3034c0c3c398'

from alembic import op
import sqlalchemy as sa


def upgrade():
    pass


def downgrade():
    pass


def upgrade():
    op.add_column('Lead', sa.Column('MaxBuyers', sa.Integer))

def downgrade():
    op.drop_column('Lead', 'MaxBuyers')