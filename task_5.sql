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

-- Creating Customers table
mycursor.execute("""CREATE TABLE IF NOT EXISTS customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT NOT NULL
)""");

-- INSERT data into Customers table
sql = "INSERT INTO customer (customer_name, email, address) VALUES (%s, %s, %s)"
val = ("Cole Baidoo", "cbaidoo@sandtech.com", "123 Happiness Ave.")
mycursor.execute(sql, val)
mydb.commit();

print(mycursor.rowcount, "record inserted.")

-- Close the cursor and database connection
mycursor.close()
mydb.close()