"""add date to leads

Revision ID: 17d59c4385b6
Revises: 22f29ab70862
Create Date: 2012-09-07 12:31:19.164973

"""

# revision identifiers, used by Alembic.
revision = '17d59c4385b6'
down_revision = '22f29ab70862'

from alembic import op
import sqlalchemy as sa


def upgrade():
    pass


def downgrade():
    pass


def upgrade():
    op.add_column('Lead', sa.Column('Date', sa.DateTime))

def downgrade():
    op.drop_column('Lead', 'Date')