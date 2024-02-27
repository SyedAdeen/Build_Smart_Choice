# models.py
import base64
import mysql.connector
import bcrypt
from mysql.connector import pooling
from db_config import create_db_handler, poolname,poolsize, db_config


connection_pool = create_db_handler()
class UserModel:
    # def __init__(self):
    #     self.db_config = db_config
 
    def get_user_by_username(self, username):
        connection=connection_pool.get_connection()
        cursor=connection.cursor()
        if connection:
            print("Connection built for get_by_username")
        
        try:
            # db_connection = mysql.connector.connect(**self.db_config)
            # cursor = db_connection.cursor()
           
            cursor.execute('SELECT * FROM USERS WHERE username = %s and is_active="Y"', (username,))
            user = cursor.fetchone()
            cursor.close()
            return user

        except Exception as e:
            print(f"An error occurred during get_user_by_username: {str(e)}")

        finally:
            if connection or connection.is_connected():
                cursor.close()
                connection.close()

                print("Connection is closed")

    def check_user_email(self, emailaddr):
        connection = connection_pool.get_connection()
        cursor = connection.cursor()
    
        if connection:
            print("Connection built for check_user_email")
        
        try:
            # print(emailaddr)
            cursor.execute('SELECT * FROM USERS WHERE EMAIL_ADDRESS = %s', (emailaddr,))
            user = cursor.fetchone()
            #print(user)

            # Consume the result set
            for _ in cursor.fetchall():
                pass

            cursor.close()
            return user

        except Exception as e:
            print(f"An error occurred during check_user_email: {str(e)}")
        
        finally:
            if connection and connection.is_connected():
                cursor.close()
                connection.close()
                print("Connection is closed")


class UserAuthModel:
    def check_password(self, entered_password, stored_hashed_password):
        
        return bcrypt.checkpw(entered_password.encode('utf-8'), stored_hashed_password.encode('utf-8'))

class SignupModel:
    # def __init__(self, ):

    def create_user(self, username, hashed_password, emailaddr, SECRET_ANSWER):
        # db_connection = mysql.connector.connect(**self.db_config)
        connection=connection_pool.get_connection()
        cursor=connection.cursor()
        try:

            if connection:
                
                print("Connection built for create_user")


            insert_query = ("INSERT INTO USERS (username, PASSWORD, EMAIL_ADDRESS, SECRET_ANSWER) VALUES (%s, %s, %s, %s)")
            cursor.execute(insert_query, (username, hashed_password, emailaddr, SECRET_ANSWER))
            connection.commit()
            cursor.close()
            
        except Exception as e:
            print(f"An error occurred during create_user: {str(e)}")

        finally:
            if connection or connection.is_connected():
                cursor.close()
                connection.close()

                print("Connection is closed")

class VerifyUserModel:
    # def __init__(self):

    def verify_user(self, username, SECRET_ANSWER):
        # db_connection = mysql.connector.connect(**self.db_config)
        connection=connection_pool.get_connection()
        cursor=connection.cursor()
        try:
            if connection:
                print("Connection built for verify_user")

                
            cursor.execute('SELECT * FROM USERS WHERE username = %s AND SECRET_ANSWER = %s', (username, SECRET_ANSWER))
            user = cursor.fetchone()

            cursor.close()

            return user
        
        except Exception as e:
            print(f"An error occurred during verify_user: {str(e)}")

        finally:
            if connection or connection.is_connected():
                cursor.close()
                connection.close()

                print("Connection is closed")

class ForgotModel:
    # def __init__(self):

    def update_password(self, username, hashed_password):
        # db_connection = mysql.connector.connect(**self.db_config)
        connection=connection_pool.get_connection()
        cursor=connection.cursor()
        try:
            if connection:
                print("Connection built for update_password")


            query = "UPDATE USERS SET PASSWORD = %s WHERE USERNAME = %s"
            cursor.execute(query, (hashed_password, username))
            connection.commit()
            cursor.close()
            
        except Exception as e:
            print(f"An error occurred during update_password: {str(e)}")

        finally:
            if connection or connection.is_connected():
                cursor.close()
                connection.close()
                print("Connection is closed")

class GetUserModel:
    def get_all_users(self):
        try:
            connection = connection_pool.get_connection()

            if connection.is_connected():
                print("Connection established for get_all_users")

                select_query = """select username, email_address, IS_PREMIUM_USER 
                                    from users where role="USER" and is_active='Y' """

                with connection.cursor(dictionary=True) as cursor:
                    cursor.execute(select_query)
                    all_users = cursor.fetchall()

                return all_users

        except Exception as e:
            print(f"Error Occured: {e}")

            return []

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for get_all_users")

    def remove_users(self,id):
        try:
            connection = connection_pool.get_connection()

            if connection.is_connected():
                print("Connection established for rmeove_user")

                update_query = "update users set is_active='N' WHERE USERNAME = %s"
                with connection.cursor() as cursor:
                    cursor.execute(update_query, (id,))
                    connection.commit()

                return True

        except Exception as e:
            print(f"Error Occured: {e}")
            return False

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for remove_users")

        


class FeedbackModel:
    # def __init__(self, ):
        # You may initialize your database connection here if needed

    def update_feedback(self, username, feedback):
        # db_connection = mysql.connector.connect(**self.db_config)

        connection=connection_pool.get_connection()
        cursor=connection.cursor()
        try:
            if connection:
                print("Connection built for update_feedback")
                query = "SELECT * FROM USERS WHERE USERNAME = %s"
                cursor.execute(query, (username,))
                user = cursor.fetchone()
                if user:
                    feed_user = user[0]
                    insert_query = "INSERT INTO FEEDBACKS (DETAIL,USER_ID_FK) VALUES (%s,%s)"
                    DATA = (feedback,feed_user)
                    cursor.execute(insert_query, DATA)                

            # Create a cursor to execute SQL queries

            # Update the feedback in the database
            # update_query = "UPDATE USERS SET FEEDBACK = %s WHERE USERNAME = %s"
            # cursor.execute(update_query, (feedback, username))

            # Commit the changes and close the cursor
            connection.commit()
            cursor.close()
 
        except Exception as e:
            print(f"An error occurred during update_feedback: {str(e)}")

        finally:
            if connection or connection.is_connected():
                cursor.close()
                connection.close()
                print("Connection is closed")


    def get_all_feeds(self):
        try:
            connection = connection_pool.get_connection()

            if connection.is_connected():
                print("Connection established for get_all_feeds")

                select_query = """SELECT users.USERNAME,users.EMAIL_ADDRESS, feedbacks.FEEDBACK_ID,feedbacks.detail, feedbacks.date_time, feedbacks.Action 
                                FROM users
                                INNER JOIN feedbacks ON 
                                users.USER_ID = feedbacks.USER_ID_FK order by feedbacks.DATE_TIME desc"""
                with connection.cursor(dictionary=True) as cursor:
                    cursor.execute(select_query)
                    all_feedbacks = cursor.fetchall()

                return all_feedbacks

        except Exception as e:
            print(f"Error Occured: {e}")

            return []

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for fetch_grey_materials")

    def action_update(self,action,id):
        try:
            connection = connection_pool.get_connection()

            if connection.is_connected():
                print("Connection established for action_update")

                update_query = "UPDATE feedbacks SET action = %s WHERE feedback_id = %s"
                with connection.cursor() as cursor:
                    cursor.execute(update_query, (action, id))
                    connection.commit()

                return True

        except Exception as e:
            print(f"Error Occured: {e}")
            return False

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for action_update")

        

        

class CheckPassModel:
    # def __init__(self):
        # self.db_config = db_config

    def verify_password(self, username, password,newpass):
        # db_connection = mysql.connector.connect(**self.db_config)

        connection=connection_pool.get_connection()
        cursor=connection.cursor()
        try:
            if connection:
                print("Connection built for verify_password")
            # Create a cursor to execute SQL queries

            # Query the database to check if the user exists
            query = "SELECT * FROM USERS WHERE USERNAME = %s"
            cursor.execute(query, (username,))
            user = cursor.fetchone()
            if user:
                # If the user exists, check if the hashed password matches
                hashed_password_db = user[3]  # Assuming the hashed password is in the second column
                if bcrypt.checkpw(password.encode('utf-8'), hashed_password_db.encode('utf-8')):
                          
                    query2 = "UPDATE USERS SET PASSWORD = %s WHERE USERNAME = %s"
                    cursor.execute(query2, (newpass, username))
                    cursor.close()
                    connection.commit()
                    return user
           
            return None  # Return None if the user doesn't exist or the password doesn't match

        except Exception as e:
            print(f"An error occurred during verify_password: {str(e)}")

        finally:
            if connection or connection.is_connected():
                cursor.close()
                connection.close()
                print("Connection is closed")


    

class CheckPassModel2:
    # def __init__(self, db_config):
    #     self.db_config = db_config

    def update_SECRET_ANSWER(self, username, new_SECRET_ANSWER, password):
        # db_connection = mysql.connector.connect(**self.db_config)

        connection=connection_pool.get_connection()
        cursor=connection.cursor()
        try:
            if connection:
                print("Connection built for update_SECRET_ANSWER")
            
            # Query the database to check if the user exists
            query = "SELECT * FROM USERS WHERE USERNAME = %s"
            cursor.execute(query, (username,))
            user = cursor.fetchone()

            if user:
                # If the user exists, check if the hashed password matches
                hashed_password_db = user[3] 
                # print(hashed_password_db.encode('utf-8')) # Assuming the hashed password is in the second column
                if bcrypt.checkpw(password.encode('utf-8'), hashed_password_db.encode('utf-8')):
                    
                    

                    try:
                        # print("abc")
                        # Update the SECRET_ANSWER in the database
                        update_query = "UPDATE USERS SET SECRET_ANSWER = %s WHERE USERNAME = %s"
                        cursor.execute(update_query, (new_SECRET_ANSWER, username))

                        # Commit the changes and close the cursor
                        connection.commit()
                        cursor.close()

                        return None  # Return None if the update is successful

                    except Exception as e:
                         print(f"An error occurred during update_SECRET_ANSWER: {str(e)}")

                    # finally:
                    #     if connection or connection.is_connected():
                    #         cursor.close()
                    #         connection.close()
                    #         print("Connection is closed")

                else:
                    # Return an error message if the password doesn't match
                    print("Incorrect Password")
                    return "Incorrect password"


            else:
                # Return an error message if the user doesn't exist
                print("true")

                return "User not found"

        except Exception as e:
            print(f"An error occurred during update_SECRET_ANSWER: {str(e)}")

        finally:
            if connection or connection.is_connected():
                cursor.close()
                connection.close()
                print("Connection is closed")

class ImageModel:
    # def __init__(self, db_config):
    #     self.db_config = db_config

    def get_floor_plans(self, table_name='layout_3'):
        # db_connection = mysql.connector.connect(**self.db_config)

        connection=connection_pool.get_connection()
        cursor = connection.cursor(dictionary=True)
        try:
            if connection:
                print("Connection built for get_floor_plans")
        
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
            print(f"An error occurred during get_floor_plans: {str(e)}")

        finally:
            if connection or connection.is_connected():
                cursor.close()
                connection.close()
                print("Connection is closed")


    def get_floor_plansb1(self, table_name='layout_3'):
        # db_connection = mysql.connector.connect(**self.db_config)

        connection=connection_pool.get_connection()
        cursor = connection.cursor(dictionary=True)
        try:
            if connection:
                print("Connection built for get_floor_plansb1")
        
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
            print(f"An error occurred during get_floor_plansb1: {str(e)}")

        finally:
            if connection or connection.is_connected():
                cursor.close()
                connection.close()
                print("Connection is closed")


    def get_floor_plans2(self, table_name='layout_3'):
        # db_connection = mysql.connector.connect(**self.db_config)

        connection=connection_pool.get_connection()
        cursor = connection.cursor(dictionary=True)
        try:
            if connection:
                print("Connection built for get_floor_plans2")
        
            cursor.execute(f"SELECT id, ground_floor, first_floor, rooftop FROM {table_name}")
            floor_plans = cursor.fetchall()

            # Convert images to base64
            for plan in floor_plans:
                for key, value in plan.items():
                    if key in ['ground_floor','first_floor', 'rooftop'] and value:
                        plan[key] = base64.b64encode(value).decode('utf-8')
                        #print(key)
            return floor_plans

        
        except Exception as e:
            print(f"An error occurred during get_floor_plans2: {str(e)}")

        finally:
            if connection or connection.is_connected():
                cursor.close()
                connection.close()
                print("Connection is closed")

    def get_floor_plansb2(self, table_name='layout_3'):
            # db_connection = mysql.connector.connect(**self.db_config)

        connection=connection_pool.get_connection()
        cursor = connection.cursor(dictionary=True)
        try:
            if connection:
                print("Connection built for get_floor_plansb2")
        
            cursor.execute(f"SELECT id, ground_floor, first_floor, rooftop, basement FROM {table_name} where basement is not null")
            floor_plans = cursor.fetchall()

            # Convert images to base64
            for plan in floor_plans:
                for key, value in plan.items():
                    if key in ['ground_floor','first_floor', 'rooftop','basement'] and value:
                        plan[key] = base64.b64encode(value).decode('utf-8')
                        #print(key)
            return floor_plans

        
        except Exception as e:
            print(f"An error occurred during get_floor_plansb2: {str(e)}")

        finally:
            if connection or connection.is_connected():
                cursor.close()
                connection.close()
                print("Connection is closed")

class GreyMaterialsModel:

    def update_scraped(self,prices):
        try:
            connection = connection_pool.get_connection()
            cursor=connection.cursor()

            if connection.is_connected():
                print("Connection established for update_scraped")
                for i in range(1,32):
                    if(prices[i-1]>0): 
                        update_query = "UPDATE Grey_Materials SET Rate = %s WHERE Material_ID = %s"
                        with connection.cursor() as cursor:
                            cursor.execute(update_query, (prices[i-1],i))
                    
                connection.commit()   
                
                cursor.close()
                print("Data Updated In DB")
                return 1

        except Exception as e:
            print(f"Error Occured: {e}")
            return 0

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for update_scraped")


    def fetch_grey_materials(self):
        try:
            connection = connection_pool.get_connection()

            if connection.is_connected():
                print("Connection established for fetch_grey_materials")

                select_query = "SELECT Material_Name, Factor, Rate,Brand FROM Grey_Materials"
                with connection.cursor(dictionary=True) as cursor:
                    cursor.execute(select_query)
                    grey_materials = cursor.fetchall()

                return grey_materials

        except Exception as e:
            print(f"Error Occured: {e}")

            return []

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for fetch_grey_materials")

    def update_rate(self, material_name, new_rate):
        try:
            connection = connection_pool.get_connection()

            if connection.is_connected():
                print("Connection established for update_rate")

                update_query = "UPDATE Grey_Materials SET Rate = %s WHERE Material_Name = %s"
                with connection.cursor() as cursor:
                    cursor.execute(update_query, (new_rate, material_name))
                    connection.commit()

                return True

        except Exception as e:
            print(f"Error Occured: {e}")
            return False

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for update_rate")

       