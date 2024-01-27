# models.py
import base64
import mysql.connector
import bcrypt

class UserModel:
    def __init__(self, db_config,):
        self.db_config = db_config

    def get_user_by_username(self, username,poolname,poolsize):
        # db_connection = mysql.connector.connect(**self.db_config)
        try:
            db_connection = mysql.connector.pooling.MySQLConnectionPool(pool_name=poolname,pool_size=poolsize,pool_reset_session=True,**self.db_config );
            with db_connection.get_connection() as connection:
                cursor = connection.cursor()
            
                cursor.execute('SELECT * FROM user_data WHERE username = %s', (username,))
                user = cursor.fetchone()

                cursor.close()
                return user
            
        except Exception as e:
            print(f"An error occurred: {str(e)}")

        finally:
            connection.close()


class UserAuthModel:
    def check_password(self, entered_password, stored_hashed_password):
        return bcrypt.checkpw(entered_password.encode('utf-8'), stored_hashed_password.encode('utf-8'))

class SignupModel:
    def __init__(self, db_config):
        self.db_config = db_config

    def create_user(self, username, hashed_password, emailaddr, secret,poolname,poolsize):
        # db_connection = mysql.connector.connect(**self.db_config)
        connection=None
        try:

            db_connection = mysql.connector.pooling.MySQLConnectionPool(pool_name=poolname,pool_size=poolsize,pool_reset_session=True,**self.db_config );
            with db_connection.get_connection() as connection:
        
                cursor = connection.cursor()

                insert_query = ("INSERT INTO user_data (username, user_pass, email_id, secret) VALUES (%s, %s, %s, %s)")
                cursor.execute(insert_query, (username, hashed_password, emailaddr, secret))

                connection.commit()
                cursor.close()
                #db_connection.close()

        except Exception as e:
            print(f"An error occurred: {str(e)}")

        finally:
            
            connection.close()
class VerifyUserModel:
    def __init__(self, db_config):
        self.db_config = db_config

    def verify_user(self, username, secret,poolname,poolsize):
        connection=None

        try:

            # db_connection = mysql.connector.connect(**self.db_config)
            
            db_connection = mysql.connector.pooling.MySQLConnectionPool(pool_name=poolname,pool_size=poolsize,pool_reset_session=True,**self.db_config );
            with db_connection.get_connection() as connection:
                cursor = connection.cursor()

                cursor.execute('SELECT * FROM user_data WHERE username = %s AND SECRET = %s', (username, secret))
                user = cursor.fetchone()

                cursor.close()
                # connection.commit()
                # db_connection.close()

                return user
        except Exception as e:
            print(f"An error occurred: {str(e)}")

        finally:
            if connection:
                connection.close()

class ForgotModel:
    def __init__(self, db_config):
        self.db_config = db_config

    def update_password(self, username, hashed_password,poolname,poolsize):
        connection=None

        try:

            # db_connection = mysql.connector.connect(**self.db_config)
            db_connection = mysql.connector.pooling.MySQLConnectionPool(pool_name=poolname,pool_size=poolsize,pool_reset_session=True,**self.db_config );
            with db_connection.get_connection() as connection:
                cursor = connection.cursor()

                query = "UPDATE USER_DATA SET USER_PASS = %s WHERE USERNAME = %s"
                cursor.execute(query, (hashed_password, username))

                cursor.close()
                connection.commit()

        except Exception as e:
            print(f"An error occurred: {str(e)}")

        finally:
            if connection:
                connection.close()

class FeedbackModel:
    def __init__(self, db_config):
        self.db_config = db_config
        # You may initialize your database connection here if needed

    def update_feedback(self, username, feedback,poolname,poolsize):
        # db_connection = mysql.connector.connect(**self.db_config)
        connection=None


        try:
            # Create a cursor to execute SQL queries
            db_connection = mysql.connector.pooling.MySQLConnectionPool(pool_name=poolname,pool_size=poolsize,pool_reset_session=True,**self.db_config );
            with db_connection.get_connection() as connection:
                cursor = connection.cursor()

                # Update the feedback in the database
                update_query = "UPDATE USER_DATA SET FEEDBACK = %s WHERE USERNAME = %s"
                cursor.execute(update_query, (feedback, username))

                # Commit the changes and close the cursor
                connection.commit()
                cursor.close()

        except Exception as e:
            print(f"An error occurred: {str(e)}")

        finally:
            # Close the database connection
            if connection:
                connection.close()

class CheckPassModel:
    def __init__(self, db_config):
        self.db_config = db_config

    def verify_password(self, username, password,newpass,poolname,poolsize):
        # db_connection = mysql.connector.connect(**self.db_config)
        connection=None

        try:
            # Create a cursor to execute SQL queries
            db_connection = mysql.connector.pooling.MySQLConnectionPool(pool_name=poolname,pool_size=poolsize,pool_reset_session=True,**self.db_config );
            with db_connection.get_connection() as connection:
                cursor = connection.cursor()

                # Query the database to check if the user exists
                query = "SELECT * FROM USER_DATA WHERE USERNAME = %s"
                cursor.execute(query, (username,))
                user = cursor.fetchone()
                if user:
                    # If the user exists, check if the hashed password matches
                    hashed_password_db = user[1]  # Assuming the hashed password is in the second column
                    if bcrypt.checkpw(password.encode('utf-8'), hashed_password_db.encode('utf-8')):
                            

                        query2 = "UPDATE USER_DATA SET USER_PASS = %s WHERE USERNAME = %s"
                        cursor.execute(query2, (newpass, username))
                        cursor.close()
                        connection.commit()
                        return user
            
                return None  # Return None if the user doesn't exist or the password doesn't match

        except Exception as e:
            print(f"An error occurred: {str(e)}")

        finally:
            # Close the database connection
            if connection:
                connection.close()


    

class CheckPassModel2:
    def __init__(self, db_config):
        self.db_config = db_config

    def update_secret(self, username, new_secret, password,poolname,poolsize):
        # db_connection = mysql.connector.connect(**self.db_config)
        connection=None
 
        try:
            db_connection = mysql.connector.pooling.MySQLConnectionPool(pool_name=poolname,pool_size=poolsize,pool_reset_session=True,**self.db_config );
            with db_connection.get_connection() as connection:
                cursor = connection.cursor()
                
                # Query the database to check if the user exists
                query = "SELECT * FROM USER_DATA WHERE USERNAME = %s"
                cursor.execute(query, (username,))
                user = cursor.fetchone()

                if user:
                    # If the user exists, check if the hashed password matches
                    hashed_password_db = user[1] 
                    print(hashed_password_db.encode('utf-8')) # Assuming the hashed password is in the second column
                    if bcrypt.checkpw(password.encode('utf-8'), hashed_password_db.encode('utf-8')):
                        
                        try:
                            print("abc")
                            # Update the secret in the database
                            update_query = "UPDATE USER_DATA SET SECRET = %s WHERE USERNAME = %s"
                            cursor.execute(update_query, (new_secret, username))

                            # Commit the changes and close the cursor
                            connection.commit()
                            cursor.close()

                            return None  # Return None if the update is successful

                        except Exception as e:
                            print(f"An error occurred: {str(e)}")

                        finally:
                            # Close the database connection
                            if connection:
                                connection.close()


                    else:
                        # Return an error message if the password doesn't match
                        
                        return "Incorrect password"

                else:
                    # Return an error message if the user doesn't exist
                    print("true")

                    return "User not found"

        except Exception as e:
            print(f"An error occurred: {str(e)}")

        finally:
            # Close the database connection
            if connection:
                connection.close()


class ImageModel:
    def __init__(self, db_config):
        self.db_config = db_config

    def get_floor_plans(self, table_name,poolname,poolsize):
        # db_connection = mysql.connector.connect(**self.db_config)
        table_name='layout_3'
        db_connection = mysql.connector.pooling.MySQLConnectionPool(pool_name=poolname,pool_size=poolsize,pool_reset_session=True,**self.db_config );
        with db_connection.get_connection() as connection:
        
            try:
                cursor = connection.cursor(dictionary=True)
                cursor.execute(f"SELECT id, ground_floor, rooftop FROM {table_name}")
                floor_plans = cursor.fetchall()

                # Convert images to base64
                for plan in floor_plans:
                    for key, value in plan.items():
                        if key in ['ground_floor', 'rooftop'] and value:
                            plan[key] = base64.b64encode(value).decode('utf-8')
                            #print(key)
                return floor_plans

            except Exception as e:
                print(f"Error fetching images: {e}")

            finally:
                if cursor:
                    cursor.close()
                    connection.close()

            # if db_connection.is_connected():
            #     db_connection.close()

    def get_floor_plansb1(self, table_name='layout_3'):
        db_connection = mysql.connector.connect(**self.db_config)

        try:
            cursor = db_connection.cursor(dictionary=True)
            cursor.execute(f"SELECT id, ground_floor, rooftop , basement FROM {table_name} where basement is not null")
            floor_plans = cursor.fetchall()

            # Convert images to base64
            for plan in floor_plans:
                for key, value in plan.items():
                    if key in ['ground_floor', 'rooftop', 'basement'] and value:
                        plan[key] = base64.b64encode(value).decode('utf-8')
                        #print(key)
            return floor_plans

        except Exception as e:
            print(f"Error fetching images: {e}")
            raise e

        finally:
            if cursor:
                cursor.close()

            if db_connection.is_connected():
                db_connection.close()            


    def get_floor_plans2(self, table_name='layout_3'):
        db_connection = mysql.connector.connect(**self.db_config)

        try:
            cursor = db_connection.cursor(dictionary=True)
            cursor.execute(f"SELECT id, ground_floor, first_floor, rooftop FROM {table_name}")
            floor_plans = cursor.fetchall()

            # Convert images to base64
            for plan in floor_plans:
                for key, value in plan.items():
                    if key in ['ground_floor', 'first_floor', 'rooftop'] and value:
                        plan[key] = base64.b64encode(value).decode('utf-8')
                        #print(key)
            return floor_plans

        except Exception as e:
            print(f"Error fetching images: {e}")
            raise e

        finally:
            if cursor:
                cursor.close()

            if db_connection.is_connected():
                db_connection.close()

    def get_floor_plansb2(self, table_name='layout_3'):
            db_connection = mysql.connector.connect(**self.db_config)

            try:
                cursor = db_connection.cursor(dictionary=True)
                cursor.execute(f"SELECT id, ground_floor, first_floor, rooftop, basement FROM {table_name} where basement is not null")
                floor_plans = cursor.fetchall()

                # Convert images to base64
                for plan in floor_plans:
                    for key, value in plan.items():
                        if key in ['ground_floor', 'first_floor', 'rooftop', 'basement'] and value:
                            plan[key] = base64.b64encode(value).decode('utf-8')
                            #print(key)
                return floor_plans

            except Exception as e:
                print(f"Error fetching images: {e}")
                raise e

            finally:
                if cursor:
                    cursor.close()

                if db_connection.is_connected():
                    db_connection.close()