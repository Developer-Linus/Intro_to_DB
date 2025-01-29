import mysql.connector 

-- Create a connection object
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Langat@2025!!!",
    database="alx_book_store"
)

-- Create a cursor object
mycursor = mydb.cursor()

-- List all tables in alx_book_store database by passing mysql command as argument
mycursor.execute("SHOW TABLES")

-- Print the table names
for table_name in mycursor:
    print(table_name)

-- Close the cursor and database connection
mycursor.close()
mydb.close()