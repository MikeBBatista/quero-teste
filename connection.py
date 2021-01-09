from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

load_dotenv()

DB_CRED = os.getenv("DB_CRED")

engine = create_engine(DB_CRED)
conn = engine.connect()