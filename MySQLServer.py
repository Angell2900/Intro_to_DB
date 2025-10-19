import mysql.connector

def create_database():
    connection = None
    try:
        print("Connecting to MySQL server...")
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="livinlarge"  # Replace with your MySQL password
        )

        if connection.is_connected():
            print("Connection successful!")
            cursor = connection.cursor()
         
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:
        print(f"Error: {e}")

    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

if __name__ == "__main__":
    create_database()
