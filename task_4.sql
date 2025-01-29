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

-- Write description of table Books without using DESCRIBE or EXPLAIN
-- Write SQL query to fetch table structure
table_name = "Books"
sql = f"""
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, IS_NULLABLE, COLUMN_KEY
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = '{table_name}'
ORDER BY ORDINAL_POSITION
"""
-- Execute the SQL QUERY
mycursor.execute(sql)

-- Print the table structure
print(f"Structure of table `{table_name}`:")
print("------------------------------------------------")
print(f"{'Column Name':<20}{'Data Type':<15}{'Max Length':<15}{'Nullable':<10}{'Key':<10}")
print("------------------------------------------------")

-- Fetch and display the results
for column_name, data_type, max_length, is_nullable, column_key in mycursor:
    print(f"{column_name:<20}{data_type:<15}{max_length:<15}{is_nullable:<10}{column_key:<10}")

-- Close the cursor and database connection
mycursor.close()
mydb.close()

