import os
import pandas as pd
from dotenv import load_dotenv
from sqlalchemy import create_engine
load_dotenv()
engine = create_engine(os.environ["DB_URL"])
df = pd.read_excel("data/resultat_2025.xlsx", sheet_name="Tabell 3", skiprows=6)
df.columns = (
    df.columns.str.strip().str.lower()
    .str.replace("å", "a").str.replace("ä", "a").str.replace("ö", "o")
    .str.replace(r"[^a-z0-9]+", "_", regex=True).str.strip("_")
)
df.to_sql("ansokan_raw", engine, if_exists="replace", index=False)
print("Rader och kolumner:",df.shape)
print(list(df.columns))
