-- Import MySQL connector
import mysql.connector

-- Create a connection object
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Langat@2025!!!",
)

USE alx_book_store;

-- Create a cursor object
mycursor = mydb.cursor()

-- Write SQL query to fetch table structure

sql = f"""
SELECT COLUMN_NAME, COLUMN_TYPE, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE, COLUMN_KEY 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = "TABLE_NAME = 'Books'"
ORDER BY ORDINAL_POSITION
"""
-- Execute the SQL QUERY
mycursor.execute(sql)

-- Print the table structure
print(f"Structure of table `{TABLE_NAME}`:")
print("----------------------------------------------------------------------------")
print(f"{'Column Name':<20}{'Column Type':<20}{'Data Type':<15}{'Max Length':<15}{'Nullable':<10}{'Key':<10}")
print("----------------------------------------------------------------------------")

-- Fetch and display the results
for row in mycursor.fetchall():
    column_name, column_type, data_type, char_max_length, is_nullable, column_key = row
    print(f"{column_name:<20}{column_type:<20}{data_type:<15}{str(char_max_length):<15}{is_nullable:<10}{column_key:<10}")

-- Close the cursor and database connection
mycursor.close()
mydb.close()

