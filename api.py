from flask import Flask, request, jsonify
from flask import Flask, jsonify, request, Response
from flask_cors import CORS
import mysql.connector
import bcrypt
import base64

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes


# Database connection configuration
db_config = {
    "host": "127.0.0.1",
    "user": "root",
    "password": "admin",
    "database": "db_bsc",
}

# Create a database connection
@app.route('/login', methods=['POST'])
def login():
    db_connection = mysql.connector.connect(**db_config)
    print("This is login api")

    try:
        data = request.json
        username = data.get('username')
        password = data.get('password')

        # Check if username and password are provided
        if not username or not password:
            return jsonify({"message": "Username and password are required"}), 400

        # Create a cursor to execute SQL queries
        cursor = db_connection.cursor()

        # Query the database to check if the user exists
        cursor.execute('SELECT * FROM USERS WHERE username = %s', (username,))
        user = cursor.fetchone()

        # Close the cursor
        cursor.close()
        db_connection.commit()
        db_connection.close()

        if user:
            # Check if the entered password matches the stored hash
            if bcrypt.checkpw(password.encode('utf-8'), user[1].encode('utf-8')):
                return jsonify({"message": "Login successful", 'username': username}), 200
            else:
                return jsonify({"message": "Invalid Username or password"}), 401
        else:
            return jsonify({"message": "Invalid Username or password"}), 401

    except Exception as e:
        return jsonify({"error": str(e)}), 500

#verify_user
@app.route('/verify_user', methods=['POST'])
def verify_user():
    db_connection = mysql.connector.connect(**db_config)

    try:
        data = request.json
        username = data.get('username')
        SECRET_ANSWER = data.get('SECRET_ANSWER')

        # Create a cursor to execute SQL queries
        cursor = db_connection.cursor()

        # Query the database to check if the user exists and the password matches
        cursor.execute('SELECT * FROM USERS WHERE username = %s AND SECRET_ANSWER = %s', (username,SECRET_ANSWER))
        user = cursor.fetchone()

        # Close the cursor
        cursor.close()
        db_connection.commit()
        db_connection.close()

        if user:
            
            
            return jsonify({"username": username, "SECRET_ANSWER": SECRET_ANSWER}),200
        else:
            return jsonify({"message": "Username not found"}),401

    except Exception as e:
        # return jsonify({"username":username,"password":password, "SECRET_ANSWER":SECRET_ANSWER})
       print(f"Error occurred: {str(e)}")
       return jsonify({"message": "Error occurred"}), 500



#Forgot Password
@app.route('/forgot', methods=['POST'])
def forgot():
    db_connection = mysql.connector.connect(**db_config)

    try:
        data = request.json
        username = data.get('username')
        password = data.get('password')
        SECRET_ANSWER = data.get('SECRET_ANSWER')

        salt = bcrypt.gensalt()
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), salt)


        # Create a cursor to execute SQL queries
        cursor = db_connection.cursor()

        # Query the database to check if the user exists and the password matches
        cursor.execute('SELECT * FROM USERS WHERE username = %s AND SECRET_ANSWER = %s', (username,SECRET_ANSWER))
        user = cursor.fetchone()

        # Close the cursor

        if user:
            query = "UPDATE USERS SET PASSWORD = %s WHERE USERNAME = %s"
            cursor.execute(query, (hashed_password, username))
            
            cursor.close()
            db_connection.commit()
            db_connection.close()
            return jsonify({"username": username, "password": password})
        else:
            return jsonify({"message": "Username not found", "username": username,"password":password, "SECRET_ANSWER":SECRET_ANSWER}),401

    except Exception as e:
        # return jsonify({"username":username,"password":password, "SECRET_ANSWER":SECRET_ANSWER})
       print(f"Error occurred: {str(e)}")
       return jsonify({"message": "Error occurred"}), 500


# Sign Up
@app.route('/signup', methods=['POST'])
def signup():
    db_connection = mysql.connector.connect(**db_config)

    data = request.json
    username = data.get('username')
    password = data.get('password')
    emailaddr = data.get('emailaddr')
    SECRET_ANSWER = data.get('SECRET_ANSWER')

    try:
        salt = bcrypt.gensalt()
        hashed_password = bcrypt.hashpw(password.encode('utf-8'), salt)


        insert_query = ("INSERT INTO USERS (username,PASSWORD,EMAIL_ADDRESS,SECRET_ANSWER) VALUES (%s, %s,%s,%s)")
        cursor = db_connection.cursor()

        cursor.execute(insert_query,(username,hashed_password.decode('utf-8'),emailaddr,SECRET_ANSWER))
        
        db_connection.commit()
        db_connection.close()
        cursor.close()

        return jsonify({
        'username': username,
        'password': password,
        'emailaddr': emailaddr,
        'SECRET_ANSWER': SECRET_ANSWER
      }),200
    
    except mysql.connector.IntegrityError as e:
        if e.errno == 1062:  # MySQL error code for duplicate entry
            return jsonify({"error": "Duplicate username"}), 409  # Use 409 Conflict status code for duplicate entry

    except Exception as e:
        return jsonify({"error": str(e)}), 500  # Use 500 Internal Server Error for other errors

#check password to change SECRET_ANSWER password
@app.route('/check_pass2', methods=['POST'])
def check_pass2():
    db_connection = mysql.connector.connect(**db_config)

    data = request.json
    username = data.get('username')
    password = data.get('password')
    newpass = data.get('newSECRET_ANSWER')
   

    try:
        query1 = ("SELECT * FROM USERS WHERE USERNAME = %s AND PASSWORD = %s")
        cursor = db_connection.cursor()

        cursor.execute(query1,(username,password))
        user = cursor.fetchone()
        if user:
            query = "UPDATE USERS SET SECRET_ANSWER = %s WHERE USERNAME = %s"
            cursor.execute(query, (newpass, username))
            
            cursor.close()
            db_connection.commit()
            db_connection.close()
            return jsonify({"username": username, "newSECRET_ANSWER": newpass})
        else:
            return jsonify({"message": "Username not found"}),401

    except Exception as e:
        # return jsonify({"username":username,"password":password, "SECRET_ANSWER":SECRET_ANSWER})
       print(f"Error occurred: {str(e)}")
       return jsonify({"message": "Error occurred"}), 500


# send feedback
@app.route('/send_feed', methods=['POST'])
def send_feed():
    db_connection = mysql.connector.connect(**db_config)

    data = request.json
    username = data.get('username')
    feedback = data.get('feedback')
   
    try:       
       
        query = "UPDATE USERS SET FEEDBACK = %s WHERE USERNAME = %s"
        cursor = db_connection.cursor() 
        cursor.execute(query, (feedback, username))
        
        cursor.close()
        db_connection.commit()
        db_connection.close()
        return jsonify({"username":username,"feedback":feedback}), 200

        
    except Exception as e:
        # return jsonify({"username":username,"password":password, "SECRET_ANSWER":SECRET_ANSWER})
       print(f"Error occurred: {str(e)}")
       return jsonify({"message": "Error occurred"}), 500



@app.route('/check_pass', methods=['POST'])
def check_pass():
    db_connection = mysql.connector.connect(**db_config)

    data = request.json
    username = data.get('username')
    current_password = data.get('password')  # New field for current password
    new_password = data.get('newpassword')

    try:
        # Create a cursor to execute SQL queries
        cursor = db_connection.cursor()

        # Query the database to check if the user exists
        query = "SELECT PASSWORD FROM USERS WHERE USERNAME = %s"
        cursor.execute(query, (username,))
        USERS = cursor.fetchone()

        if USERS:
            hashed_password = USERS[0]

            # Verify the current password
            if bcrypt.checkpw(current_password.encode('utf-8'), hashed_password.encode('utf-8')):
                # Hash the new password
                salt = bcrypt.gensalt()
                hashed_new_password = bcrypt.hashpw(new_password.encode('utf-8'), salt)

                # Update the password in the database
                update_query = "UPDATE USERS SET PASSWORD = %s WHERE USERNAME = %s"
                cursor.execute(update_query, (hashed_new_password, username))

                cursor.close()
                db_connection.commit()
                db_connection.close()
                return jsonify({"message": "Password updated successfully"}), 200
            else:
                return jsonify({"message": "Incorrect current password"}), 401
        else:
            return jsonify({"message": "Username not found"}), 401

    except Exception as e:
        print(f"Error occurred: {str(e)}")
        return jsonify({"message": "Error occurred"}), 500
    
@app.route('/get_images1', methods=['GET'])
def get_images():

    try:
        table_name = request.args.get('table_name', 'layout_3')  # Default to layout_3 if not provided

        db_connection = mysql.connector.connect(**db_config)

        cursor = db_connection.cursor(dictionary=True)

        cursor.execute(f"SELECT id, ground_floor, first_floor FROM {table_name}")
        floor_plans = cursor.fetchall()

        # Convert images to base64
        for plan in floor_plans:
            for key, value in plan.items():
                if key in ['ground_floor', 'first_floor'] and value:
                    plan[key] = base64.b64encode(bytes(value)).decode('utf-8')
       
        cursor.close()
        db_connection.close()
       
        return jsonify(floor_plans)

    except Exception as e:
        print(f"Error fetching images: {e}")
        return jsonify({"error": "Internal Server Error"}), 500


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)





