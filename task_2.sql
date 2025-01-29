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

-- Create Books table
mycursor.execute("""CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    price DOUBLE NOT NULL,
    publication_date DATE NOT NULL
)""");

-- Create Authors table
mycursor.execute("""CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL,
)""");

-- Creating Customers table
mycursor.execute("""CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT NOT NULL
)""");

-- Creating Orders table
mycursor.execute("""CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
)""");

-- Creating Order_Details table
mycursor.execute("""CREATE TABLE IF NOT EXISTS Order_Details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
)""");

-- Close the cursor and database connection
mycursor.close()
mydb.close()