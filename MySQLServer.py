import mysql.connector
try:
    # Create a connection object (without specifying the database)
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="Langat@2025!!!",
    )
except mysql.connector.Error as err:
    print(err)

# Create a cursor object
mycursor = mydb.cursor()

# Create alx_book_store database
sql = "CREATE DATABASE IF NOT EXISTS alx_book_store"
mycursor.execute(sql)

print(f'Database "alx_book_store" created successfully!')

# Close the connections
mycursor.close()
mydb.close()


