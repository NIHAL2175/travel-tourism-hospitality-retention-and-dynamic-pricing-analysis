import pandas as pd
from sqlalchemy import create_engine

# read csv
df = pd.read_csv("cleaned_hotel_bookings.csv")

# take only 1000 rows
df = df.head(1000)

# mysql connection
engine = create_engine(
    "mysql+pymysql://root:DB_Password@localhost/tourism_analytics" 
) 

# import
df.to_sql(
    name="hotel_data",
    con=engine,
    if_exists="replace",
    index=False
)

print("Imported Successfully")
