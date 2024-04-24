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
                print("Connection closed for get_all_feeds")

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

    def get_singlestory_materials(self,area,id):
        try:
            connection = connection_pool.get_connection()
            layout="LAYOUT_3_ID"

            if(area=="3 MARLA"):
                layout="LAYOUT_3_ID"
            elif(area=="5 MARLA"):
                layout="LAYOUT_5_ID"
            elif(area=="7 MARLA"):
                layout="LAYOUT_7_ID"
            elif(area=="10 MARLA"):
                layout="LAYOUT_10_ID"
            elif(area=="20 MARLA"):
                layout="LAYOUT_20_ID"
            else:
                print("Issue on Layout Id")
                layout="LAYOUT_3_ID"




            if connection.is_connected():
                print("Connection established for get_singlestory_materials")

                get_query ="""
                    SELECT 
                        A.MATERIAL_NAME,
                        A.BRAND,
                        A.FACTOR,
                        ROUND((A.RATE),0),
                        (B.GROUND_QTY + B.ROOFTOP_QTY) AS total_quantity,
                        ROUND((A.RATE * (B.GROUND_QTY + B.ROOFTOP_QTY)),0) AS total_cost
                    FROM 
                        grey_materials AS A
                    JOIN 
                        FILTER_GREY_MATERIALS AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                    WHERE 
                        B.AREA_QTY = %s 
                        AND B.LAYOUT_3_ID = %s;

                    """
                get_query = get_query.replace("B.LAYOUT_3_ID", layout)


                with connection.cursor() as cursor:
                    cursor.execute(get_query, (area, id))
                    grey_materials = cursor.fetchall()

                return grey_materials

        except Exception as e:
            print(f"Error Occured: {e}")
            return False

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for get_singlestory_materials")


    def get_singlestory_greycost(self,area,id):

        try:

            connection = connection_pool.get_connection()
            layout="LAYOUT_3_ID"

            if(area=="3 MARLA"):
                layout="LAYOUT_3_ID"
            elif(area=="5 MARLA"):
                layout="LAYOUT_5_ID"
            elif(area=="7 MARLA"):
                layout="LAYOUT_7_ID"
            elif(area=="10 MARLA"):
                layout="LAYOUT_10_ID"
            elif(area=="20 MARLA"):
                layout="LAYOUT_20_ID"
            else:
                print("Issue on Layout Id")
                layout="LAYOUT_3_ID"

            if connection.is_connected():
                print("Connection established for get_singlestory_greycost")

                get_cost ="""
                    
                        SELECT 
                            SUM(GROUND_material_cost) AS 1_total_cost,
                            SUM(ROOFTOP_material_cost) AS 3_total_cost


                        FROM (
                            SELECT 
                                (B.GROUND_QTY * A.RATE) AS GROUND_material_cost,
                                (B.ROOFTOP_QTY * A.RATE) AS ROOFTOP_material_cost
                                        
                            FROM 
                                grey_materials AS A
                            JOIN 
                                FILTER_GREY_MATERIALS AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                            WHERE 
                                B.AREA_QTY = %s 
                                AND B.LAYOUT_3_ID = %s
                        ) AS subquery;


                    """
                get_cost = get_cost.replace("B.LAYOUT_3_ID", layout)

                with connection.cursor() as cursor:
                    cursor.execute(get_cost, (area, id))
                    grey_materials_cost = cursor.fetchall()


                return grey_materials_cost

        except Exception as e:
            print(f"Error Occured: {e}")
            return False

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for get_singlestory_greycost")


    def get_singlebasement_materials(self,area,id):
        try:
            connection = connection_pool.get_connection()
            layout="LAYOUT_3_ID"

            if(area=="3 MARLA"):
                layout="LAYOUT_3_ID"
            elif(area=="5 MARLA"):
                layout="LAYOUT_5_ID"
            elif(area=="7 MARLA"):
                layout="LAYOUT_7_ID"
            elif(area=="10 MARLA"):
                layout="LAYOUT_10_ID"
            elif(area=="20 MARLA"):
                layout="LAYOUT_20_ID"
            else:
                print("Issue on Layout Id")
                layout="LAYOUT_3_ID"




            if connection.is_connected():
                print("Connection established for get_singlebasement_materials")

                get_query ="""
                    SELECT 
                        A.MATERIAL_NAME,
                        A.BRAND,
                        A.FACTOR,
                        ROUND((A.RATE),0),
                        (B.GROUND_QTY + B.ROOFTOP_QTY + B.BASEMENT_QTY) AS total_quantity,
                        ROUND((A.RATE * (B.GROUND_QTY + B.ROOFTOP_QTY + B.BASEMENT_QTY)),0) AS total_cost
                    FROM 
                        grey_materials AS A
                    JOIN 
                        FILTER_GREY_MATERIALS AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                    WHERE 
                        B.AREA_QTY = %s 
                        AND B.LAYOUT_3_ID = %s;

                    """
                get_query = get_query.replace("B.LAYOUT_3_ID", layout)


                with connection.cursor() as cursor:
                    cursor.execute(get_query, (area, id))
                    grey_materials = cursor.fetchall()

                return grey_materials

        except Exception as e:
            print(f"Error Occured: {e}")
            return False

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for get_singlebasement_materials")


    def get_singlebasement_greycost(self,area,id):

        try:

            connection = connection_pool.get_connection()
            layout="LAYOUT_3_ID"

            if(area=="3 MARLA"):
                layout="LAYOUT_3_ID"
            elif(area=="5 MARLA"):
                layout="LAYOUT_5_ID"
            elif(area=="7 MARLA"):
                layout="LAYOUT_7_ID"
            elif(area=="10 MARLA"):
                layout="LAYOUT_10_ID"
            elif(area=="20 MARLA"):
                layout="LAYOUT_20_ID"
            else:
                print("Issue on Layout Id")
                layout="LAYOUT_3_ID"

            if connection.is_connected():
                print("Connection established for get_singlebasement_greycost")

                get_cost ="""
                    
                        SELECT 
                            SUM(GROUND_material_cost) AS 1_total_cost,
                            SUM(ROOFTOP_material_cost) AS 3_total_cost,
                            SUM(BASEMENT_material_cost) AS 2_total_cost



                        FROM (
                            SELECT 
                                (B.GROUND_QTY * A.RATE) AS GROUND_material_cost,
                                (B.ROOFTOP_QTY * A.RATE) AS ROOFTOP_material_cost,
                                (B.BASEMENT_QTY * A.RATE) AS BASEMENT_material_cost                                        
                            FROM 
                                grey_materials AS A
                            JOIN 
                                FILTER_GREY_MATERIALS AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                            WHERE 
                                B.AREA_QTY = %s 
                                AND B.LAYOUT_3_ID = %s
                        ) AS subquery;


                    """
                get_cost = get_cost.replace("B.LAYOUT_3_ID", layout)

                with connection.cursor() as cursor:
                    cursor.execute(get_cost, (area, id))
                    grey_materials_cost = cursor.fetchall()


                return grey_materials_cost

        except Exception as e:
            print(f"Error Occured: {e}")
            return False

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for get_singlebasement_greycost")



    def get_doublestory_materials(self,area,id):
        try:
            connection = connection_pool.get_connection()
            layout="LAYOUT_3_ID"

            if(area=="3 MARLA"):
                layout="LAYOUT_3_ID"
            elif(area=="5 MARLA"):
                layout="LAYOUT_5_ID"
            elif(area=="7 MARLA"):
                layout="LAYOUT_7_ID"
            elif(area=="10 MARLA"):
                layout="LAYOUT_10_ID"
            elif(area=="20 MARLA"):
                layout="LAYOUT_20_ID"
            else:
                print("Issue on Layout Id")
                layout="LAYOUT_3_ID"




            if connection.is_connected():
                print("Connection established for get_doublestory_materials")

                get_query ="""
                    SELECT 
                        A.MATERIAL_NAME,
                        A.BRAND,
                        A.FACTOR,
                        ROUND((A.RATE),0),
                        (B.GROUND_QTY + B.FIRST_FLOOR_QTY + B.ROOFTOP_QTY) AS total_quantity,
                        ROUND((A.RATE * (B.GROUND_QTY + B.FIRST_FLOOR_QTY + B.ROOFTOP_QTY)),0) AS total_cost
                    FROM 
                        grey_materials AS A
                    JOIN 
                        FILTER_GREY_MATERIALS AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                    WHERE 
                        B.AREA_QTY = %s 
                        AND B.LAYOUT_3_ID = %s;

                    """
                get_query = get_query.replace("B.LAYOUT_3_ID", layout)


                with connection.cursor() as cursor:
                    cursor.execute(get_query, (area, id))
                    grey_materials = cursor.fetchall()

                return grey_materials

        except Exception as e:
            print(f"Error Occured: {e}")
            return False

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for get_doublestory_materials")


    def get_doublestory_greycost(self,area,id):

        try:

            connection = connection_pool.get_connection()
            layout="LAYOUT_3_ID"

            if(area=="3 MARLA"):
                layout="LAYOUT_3_ID"
            elif(area=="5 MARLA"):
                layout="LAYOUT_5_ID"
            elif(area=="7 MARLA"):
                layout="LAYOUT_7_ID"
            elif(area=="10 MARLA"):
                layout="LAYOUT_10_ID"
            elif(area=="20 MARLA"):
                layout="LAYOUT_20_ID"
            else:
                print("Issue on Layout Id")
                layout="LAYOUT_3_ID"

            if connection.is_connected():
                print("Connection established for get_doublestory_greycost")

                get_cost ="""
                                            
                        SELECT 
                            SUM(GROUND_material_cost) AS 1_total_cost,
                            SUM(FIRST_FLOOR_material_cost) as 2_total_cost,
                            SUM(ROOFTOP_material_cost) AS 3_total_cost
                        FROM (
                            SELECT 
                                (B.GROUND_QTY * A.RATE) AS GROUND_material_cost,
                                (B.ROOFTOP_QTY * A.RATE) AS ROOFTOP_material_cost, -- Added comma here
                                (B.FIRST_FLOOR_QTY * A.RATE) AS FIRST_FLOOR_material_cost
                            FROM 
                                grey_materials AS A
                            JOIN 
                                FILTER_GREY_MATERIALS AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                            WHERE 
                                B.AREA_QTY = %s
                                AND B.LAYOUT_3_ID =%s
                        ) AS subquery;


                    """
                get_cost = get_cost.replace("B.LAYOUT_3_ID", layout)

                with connection.cursor() as cursor:
                    cursor.execute(get_cost, (area, id))
                    grey_materials_cost = cursor.fetchall()


                return grey_materials_cost

        except Exception as e:
            print(f"Error Occured: {e}")
            return False

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for get_doublestory_greycost")


    def get_doublebasement_materials(self,area,id):
        try:
            connection = connection_pool.get_connection()
            layout="LAYOUT_3_ID"

            if(area=="3 MARLA"):
                layout="LAYOUT_3_ID"
            elif(area=="5 MARLA"):
                layout="LAYOUT_5_ID"
            elif(area=="7 MARLA"):
                layout="LAYOUT_7_ID"
            elif(area=="10 MARLA"):
                layout="LAYOUT_10_ID"
            elif(area=="20 MARLA"):
                layout="LAYOUT_20_ID"
            else:
                print("Issue on Layout Id")
                layout="LAYOUT_3_ID"




            if connection.is_connected():
                print("Connection established for get_doublebasement_materials")

                get_query ="""
                    SELECT 
                        A.MATERIAL_NAME,
                        A.BRAND,
                        A.FACTOR,
                        ROUND((A.RATE),0),
                        (B.BASEMENT_QTY + B.GROUND_QTY + B.FIRST_FLOOR_QTY + B.ROOFTOP_QTY) AS total_quantity,
                        ROUND((A.RATE * (B.BASEMENT_QTY + B.GROUND_QTY + B.FIRST_FLOOR_QTY + B.ROOFTOP_QTY)),0) AS total_cost
                    FROM 
                        grey_materials AS A
                    JOIN 
                        FILTER_GREY_MATERIALS AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                    WHERE 
                        B.AREA_QTY = %s 
                        AND B.LAYOUT_3_ID = %s;

                    """
                get_query = get_query.replace("B.LAYOUT_3_ID", layout)


                with connection.cursor() as cursor:
                    cursor.execute(get_query, (area, id))
                    grey_materials = cursor.fetchall()

                return grey_materials

        except Exception as e:
            print(f"Error Occured: {e}")
            return False

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for get_doublebasement_materials")


    def get_doublebasement_greycost(self,area,id):

        try:

            connection = connection_pool.get_connection()
            layout="LAYOUT_3_ID"

            if(area=="3 MARLA"):
                layout="LAYOUT_3_ID"
            elif(area=="5 MARLA"):
                layout="LAYOUT_5_ID"
            elif(area=="7 MARLA"):
                layout="LAYOUT_7_ID"
            elif(area=="10 MARLA"):
                layout="LAYOUT_10_ID"
            elif(area=="20 MARLA"):
                layout="LAYOUT_20_ID"
            else:
                print("Issue on Layout Id")
                layout="LAYOUT_3_ID"

            if connection.is_connected():
                print("Connection established for get_doublebasement_greycost")

                get_cost ="""
                                            
                        SELECT 
                            SUM(GROUND_material_cost) AS 1_total_cost,
                            SUM(FIRST_FLOOR_material_cost) as 2_total_cost,
                            SUM(ROOFTOP_material_cost) AS 3_total_cost,
                            SUM(BASEMENT_material_cost) AS 4_total_cost
                            
                        FROM (
                            SELECT 
                                (B.GROUND_QTY * A.RATE) AS GROUND_material_cost,
                                (B.ROOFTOP_QTY * A.RATE) AS ROOFTOP_material_cost, -- Added comma here
                                (B.FIRST_FLOOR_QTY * A.RATE) AS FIRST_FLOOR_material_cost,
                                (B.BASEMENT_QTY * A.RATE) AS BASEMENT_material_cost

                            FROM 
                                grey_materials AS A
                            JOIN 
                                FILTER_GREY_MATERIALS AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                            WHERE 
                                B.AREA_QTY = %s
                                AND B.LAYOUT_3_ID =%s
                        ) AS subquery;


                    """
                get_cost = get_cost.replace("B.LAYOUT_3_ID", layout)

                with connection.cursor() as cursor:
                    cursor.execute(get_cost, (area, id))
                    grey_materials_cost = cursor.fetchall()


                return grey_materials_cost

        except Exception as e:
            print(f"Error Occured: {e}")
            return False

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for get_doublebasement_greycost")


class FinishMaterialsModel:

    def fetch_finish_materials(self):
        try:
            connection = connection_pool.get_connection()

            if connection.is_connected():
                print("Connection established for fetch_finish_materials")

                select_query = "SELECT Material_Name, Factor, Rate_A,Class_A,Rate_B, Class_B, Rate_C, Class_C, Rate_D, Class_D from Finishing_Materials;"
                with connection.cursor(dictionary=True) as cursor:
                    cursor.execute(select_query)
                    finishing_materials = cursor.fetchall()

                return finishing_materials

        except Exception as e:
            print(f"Error Occured: {e}")

            return []

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for fetch_finish_materials")

    def update_rate(self, material_name, new_rate, class_name):
        try:
            connection = connection_pool.get_connection()

            if connection.is_connected():
                print("Connection established for finishing_update_rate of class ", class_name)
                update_query=""
                if(class_name == "A"):
                    update_query = "UPDATE Finishing_Materials SET Rate_A = %s WHERE Material_Name = %s"
                elif(class_name == "B"):
                    update_query = "UPDATE Finishing_Materials SET Rate_B = %s WHERE Material_Name = %s"
                elif(class_name == "C"):
                    update_query = "UPDATE Finishing_Materials SET Rate_C = %s WHERE Material_Name = %s"
                elif(class_name == "D"):
                    update_query = "UPDATE Finishing_Materials SET Rate_D = %s WHERE Material_Name = %s"

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
                print("Connection closed for finishing_update_rate of class ", class_name)






    def get_singlestory_finishing(self,area,id,predicted_array):
            try:
                connection = connection_pool.get_connection()
                layout="LAYOUT_3_ID"

                area_qty=""
                j=0


                if(area=='3'):
                    layout="LAYOUT_3_ID"
                    area_qty="3 MARLA"
                elif(area=='5'):
                    layout="LAYOUT_5_ID"
                    area_qty="5 MARLA"
                elif(area=='7'):
                    layout="LAYOUT_7_ID"
                    area_qty="7 MARLA"
                elif(area=='1'):
                    layout="LAYOUT_10_ID"
                    area_qty="10 MARLA"                    
                elif(area=='2'):
                    layout="LAYOUT_20_ID"
                    area_qty="20 MARLA"

                else:
                    print("Issue on Layout Id")
                    layout="LAYOUT_3_ID"
                    area_qty="3 MARLA"

                finishing_materials_data = []
                print("Got Set Id = ",id)

                if connection.is_connected():
                    print("Connection established for get_singlestory_finishing")

                    get_query ="""
                        SELECT 
                        A.MATERIAL_NAME,
                        A.CLASS_D,
                        A.FACTOR,
                        ROUND((A.RATE_D),0),
                        (B.GROUND_QTY + B.ROOFTOP_QTY) AS total_quantity,
                        ROUND((A.RATE_D * (B.GROUND_QTY + B.ROOFTOP_QTY)),0) AS total_cost
                    FROM 
                        finishing_materials AS A
                    JOIN 
                        filter_finishing_materials AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                    WHERE 
                        B.AREA_QTY = %s
                        AND B.LAYOUT_3_ID = %s;

                        """
                    predicted_array = [float(x) for x in predicted_array.strip("[]").split(", ")]
                    print("Got predicted_array",predicted_array)

                    change_class="A.CLASS_D"
                    change_rate="A.RATE_D"

                    connection = connection_pool.get_connection()

                    for i in range(len(predicted_array)):

                        if(predicted_array[i]>4.0):
                            get_query = get_query.replace(change_class, "A.CLASS_D")
                            get_query = get_query.replace(change_rate, "A.RATE_D")
                            change_class="A.CLASS_D"
                            change_rate="A.RATE_D"

                        
                        elif(predicted_array[i]<1.0):
                            get_query = get_query.replace(change_class, "A.CLASS_C")
                            get_query = get_query.replace(change_rate, "A.RATE_C")
                            change_class="A.CLASS_C"
                            change_rate="A.RATE_C"


                        elif(predicted_array[i]==3.0):        
                            print("Change_class = ",change_class)
                            print("Change Rate  = ", change_rate)               
                            get_query = get_query.replace(change_class, "A.CLASS_C")
                            get_query = get_query.replace(change_rate, "A.RATE_C")
                            change_class="A.CLASS_C"
                            change_rate="A.RATE_C"

                        elif(predicted_array[i]==2.0):
                            get_query = get_query.replace(change_class, "A.CLASS_B")
                            get_query = get_query.replace(change_rate, "A.RATE_B")
                            change_class="A.CLASS_B"
                            change_rate="A.RATE_B"

                        elif(predicted_array[i]==1.0):
                            get_query = get_query.replace(change_class, "A.CLASS_A")
                            get_query = get_query.replace(change_rate, "A.RATE_A")
                            change_class="A.CLASS_A"
                            change_rate="A.RATE_A"


                        get_query = get_query.replace("B.LAYOUT_3_ID", layout)

                        with connection.cursor() as cursor:
                            cursor.execute(get_query, (area_qty, id))
                            results = cursor.fetchall()  # Fetch all rows returned by the query
                            
                            finishing_materials_data.append(results[j])
                            j=j+1


                    finish_cost = 0.0
                    # print(finishing_materials_data)

                    for i in range(len(finishing_materials_data)):
                        finish_cost=finish_cost+float(finishing_materials_data[i][5])
                        # print(finishing_materials_data[i][5])

                    print("Total Cost = ",finish_cost)
                    finishing_materials_data.append(finish_cost)
                    return finishing_materials_data

            except Exception as e:
                print(f"Error Occured: {e}")
                return False

            finally:
                if connection and connection.is_connected():
                    connection.close()
                    print("Connection closed for get_singlestory_finishing")




    def get_singlestorybasement_finishing(self,area,id,predicted_array):
            try:
                connection = connection_pool.get_connection()
                layout="LAYOUT_3_ID"

                area_qty=""
                j=0


                if(area=='3'):
                    layout="LAYOUT_3_ID"
                    area_qty="3 MARLA"
                elif(area=='5'):
                    layout="LAYOUT_5_ID"
                    area_qty="5 MARLA"
                elif(area=='7'):
                    layout="LAYOUT_7_ID"
                    area_qty="7 MARLA"
                elif(area=='1'):
                    layout="LAYOUT_10_ID"
                    area_qty="10 MARLA"                    
                elif(area=='2'):
                    layout="LAYOUT_20_ID"
                    area_qty="20 MARLA"

                else:
                    print("Issue on Layout Id")
                    layout="LAYOUT_3_ID"
                    area_qty="3 MARLA"

                finishing_materials_data = []
                print("Got Set Id = ",id)

                if connection.is_connected():
                    print("Connection established for get_singlestorybasement_finishing")

                    get_query ="""
                        SELECT 
                        A.MATERIAL_NAME,
                        A.CLASS_D,
                        A.FACTOR,
                        ROUND((A.RATE_D),0),
                        (B.GROUND_QTY + B.ROOFTOP_QTY +B.BASEMENT_QTY) AS total_quantity,
                        ROUND((A.RATE_D * (B.GROUND_QTY + B.ROOFTOP_QTY + B.BASEMENT_QTY)),0) AS total_cost
                    FROM 
                        finishing_materials AS A
                    JOIN 
                        filter_finishing_materials AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                    WHERE 
                        B.AREA_QTY = %s
                        AND B.LAYOUT_3_ID = %s;

                        """
                    predicted_array = [float(x) for x in predicted_array.strip("[]").split(", ")]
                    print("Got predicted_array",predicted_array)

                    change_class="A.CLASS_D"
                    change_rate="A.RATE_D"

                    connection = connection_pool.get_connection()

                    for i in range(len(predicted_array)):

                        if(predicted_array[i]>4.0):
                            get_query = get_query.replace(change_class, "A.CLASS_D")
                            get_query = get_query.replace(change_rate, "A.RATE_D")
                            change_class="A.CLASS_D"
                            change_rate="A.RATE_D"

                        
                        elif(predicted_array[i]<1.0):
                            get_query = get_query.replace(change_class, "A.CLASS_C")
                            get_query = get_query.replace(change_rate, "A.RATE_C")
                            change_class="A.CLASS_C"
                            change_rate="A.RATE_C"


                        elif(predicted_array[i]==3.0):        
                            print("Change_class = ",change_class)
                            print("Change Rate  = ", change_rate)               
                            get_query = get_query.replace(change_class, "A.CLASS_C")
                            get_query = get_query.replace(change_rate, "A.RATE_C")
                            change_class="A.CLASS_C"
                            change_rate="A.RATE_C"

                        elif(predicted_array[i]==2.0):
                            get_query = get_query.replace(change_class, "A.CLASS_B")
                            get_query = get_query.replace(change_rate, "A.RATE_B")
                            change_class="A.CLASS_B"
                            change_rate="A.RATE_B"

                        elif(predicted_array[i]==1.0):
                            get_query = get_query.replace(change_class, "A.CLASS_A")
                            get_query = get_query.replace(change_rate, "A.RATE_A")
                            change_class="A.CLASS_A"
                            change_rate="A.RATE_A"


                        get_query = get_query.replace("B.LAYOUT_3_ID", layout)

                        with connection.cursor() as cursor:
                            cursor.execute(get_query, (area_qty, id))
                            results = cursor.fetchall()  # Fetch all rows returned by the query
                            
                            finishing_materials_data.append(results[j])
                            j=j+1


                    finish_cost = 0.0
                    # print(finishing_materials_data)

                    for i in range(len(finishing_materials_data)):
                        finish_cost=finish_cost+float(finishing_materials_data[i][5])
                        # print(finishing_materials_data[i][5])

                    print("Total Cost = ",finish_cost)
                    finishing_materials_data.append(finish_cost)
                    return finishing_materials_data

            except Exception as e:
                print(f"Error Occured: {e}")
                return False

            finally:
                if connection and connection.is_connected():
                    connection.close()
                    print("Connection closed for get_singlestorybasement_finishing")



    def get_doublestory_finishing(self,area,id,predicted_array):
            try:
                connection = connection_pool.get_connection()
                layout="LAYOUT_3_ID"

                area_qty=""
                j=0


                if(area=='3'):
                    layout="LAYOUT_3_ID"
                    area_qty="3 MARLA"
                elif(area=='5'):
                    layout="LAYOUT_5_ID"
                    area_qty="5 MARLA"
                elif(area=='7'):
                    layout="LAYOUT_7_ID"
                    area_qty="7 MARLA"
                elif(area=='1'):
                    layout="LAYOUT_10_ID"
                    area_qty="10 MARLA"                    
                elif(area=='2'):
                    layout="LAYOUT_20_ID"
                    area_qty="20 MARLA"

                else:
                    print("Issue on Layout Id")
                    layout="LAYOUT_3_ID"
                    area_qty="3 MARLA"

                finishing_materials_data = []
                print("Got Set Id = ",id)

                if connection.is_connected():
                    print("Connection established for get_doublestory_finishing")

                    get_query ="""
                        SELECT 
                        A.MATERIAL_NAME,
                        A.CLASS_D,
                        A.FACTOR,
                        ROUND((A.RATE_D),0),
                        (B.GROUND_QTY + B.ROOFTOP_QTY + B.FIRST_FLOOR_QTY) AS total_quantity,
                        ROUND((A.RATE_D * (B.GROUND_QTY + B.ROOFTOP_QTY + B.FIRST_FLOOR_QTY)),0) AS total_cost
                    FROM 
                        finishing_materials AS A
                    JOIN 
                        filter_finishing_materials AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                    WHERE 
                        B.AREA_QTY = %s
                        AND B.LAYOUT_3_ID = %s;

                        """
                    predicted_array = [float(x) for x in predicted_array.strip("[]").split(", ")]
                    print("Got predicted_array",predicted_array)

                    change_class="A.CLASS_D"
                    change_rate="A.RATE_D"

                    connection = connection_pool.get_connection()

                    for i in range(len(predicted_array)):

                        if(predicted_array[i]>4.0):
                            get_query = get_query.replace(change_class, "A.CLASS_D")
                            get_query = get_query.replace(change_rate, "A.RATE_D")
                            change_class="A.CLASS_D"
                            change_rate="A.RATE_D"

                        
                        elif(predicted_array[i]<1.0):
                            get_query = get_query.replace(change_class, "A.CLASS_C")
                            get_query = get_query.replace(change_rate, "A.RATE_C")
                            change_class="A.CLASS_C"
                            change_rate="A.RATE_C"


                        elif(predicted_array[i]==3.0):        
                            print("Change_class = ",change_class)
                            print("Change Rate  = ", change_rate)               
                            get_query = get_query.replace(change_class, "A.CLASS_C")
                            get_query = get_query.replace(change_rate, "A.RATE_C")
                            change_class="A.CLASS_C"
                            change_rate="A.RATE_C"

                        elif(predicted_array[i]==2.0):
                            get_query = get_query.replace(change_class, "A.CLASS_B")
                            get_query = get_query.replace(change_rate, "A.RATE_B")
                            change_class="A.CLASS_B"
                            change_rate="A.RATE_B"

                        elif(predicted_array[i]==1.0):
                            get_query = get_query.replace(change_class, "A.CLASS_A")
                            get_query = get_query.replace(change_rate, "A.RATE_A")
                            change_class="A.CLASS_A"
                            change_rate="A.RATE_A"


                        get_query = get_query.replace("B.LAYOUT_3_ID", layout)

                        with connection.cursor() as cursor:
                            cursor.execute(get_query, (area_qty, id))
                            results = cursor.fetchall()  # Fetch all rows returned by the query
                            
                            finishing_materials_data.append(results[j])
                            j=j+1


                    finish_cost = 0.0
                    # print(finishing_materials_data)

                    for i in range(len(finishing_materials_data)):
                        finish_cost=finish_cost+float(finishing_materials_data[i][5])
                        # print(finishing_materials_data[i][5])

                    print("Total Cost = ",finish_cost)
                    finishing_materials_data.append(finish_cost)
                    return finishing_materials_data

            except Exception as e:
                print(f"Error Occured: {e}")
                return False

            finally:
                if connection and connection.is_connected():
                    connection.close()
                    print("Connection closed for get_doublestory_finishing")




    def get_doublestorybasement_finishing(self,area,id,predicted_array):
            try:
                connection = connection_pool.get_connection()
                layout="LAYOUT_3_ID"

                area_qty=""
                j=0


                if(area=='3'):
                    layout="LAYOUT_3_ID"
                    area_qty="3 MARLA"
                elif(area=='5'):
                    layout="LAYOUT_5_ID"
                    area_qty="5 MARLA"
                elif(area=='7'):
                    layout="LAYOUT_7_ID"
                    area_qty="7 MARLA"
                elif(area=='1'):
                    layout="LAYOUT_10_ID"
                    area_qty="10 MARLA"                    
                elif(area=='2'):
                    layout="LAYOUT_20_ID"
                    area_qty="20 MARLA"

                else:
                    print("Issue on Layout Id")
                    layout="LAYOUT_3_ID"
                    area_qty="3 MARLA"

                finishing_materials_data = []
                print("Got Set Id = ",id)

                if connection.is_connected():
                    print("Connection established for get_doublestorybasement_finishing")

                    get_query ="""
                        SELECT 
                        A.MATERIAL_NAME,
                        A.CLASS_D,
                        A.FACTOR,
                        ROUND((A.RATE_D),0),
                        (B.GROUND_QTY + B.ROOFTOP_QTY + B.FIRST_FLOOR_QTY + B.BASEMENT_QTY) AS total_quantity,
                        ROUND((A.RATE_D * (B.GROUND_QTY + B.ROOFTOP_QTY + B.FIRST_FLOOR_QTY + B.BASEMENT_QTY)),0) AS total_cost
                    FROM 
                        finishing_materials AS A
                    JOIN 
                        filter_finishing_materials AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                    WHERE 
                        B.AREA_QTY = %s
                        AND B.LAYOUT_3_ID = %s;

                        """
                    predicted_array = [float(x) for x in predicted_array.strip("[]").split(", ")]
                    print("Got predicted_array",predicted_array)

                    change_class="A.CLASS_D"
                    change_rate="A.RATE_D"

                    connection = connection_pool.get_connection()

                    for i in range(len(predicted_array)):

                        if(predicted_array[i]>4.0):
                            get_query = get_query.replace(change_class, "A.CLASS_D")
                            get_query = get_query.replace(change_rate, "A.RATE_D")
                            change_class="A.CLASS_D"
                            change_rate="A.RATE_D"

                        
                        elif(predicted_array[i]<1.0):
                            get_query = get_query.replace(change_class, "A.CLASS_C")
                            get_query = get_query.replace(change_rate, "A.RATE_C")
                            change_class="A.CLASS_C"
                            change_rate="A.RATE_C"


                        elif(predicted_array[i]==3.0):        
                            print("Change_class = ",change_class)
                            print("Change Rate  = ", change_rate)               
                            get_query = get_query.replace(change_class, "A.CLASS_C")
                            get_query = get_query.replace(change_rate, "A.RATE_C")
                            change_class="A.CLASS_C"
                            change_rate="A.RATE_C"

                        elif(predicted_array[i]==2.0):
                            get_query = get_query.replace(change_class, "A.CLASS_B")
                            get_query = get_query.replace(change_rate, "A.RATE_B")
                            change_class="A.CLASS_B"
                            change_rate="A.RATE_B"

                        elif(predicted_array[i]==1.0):
                            get_query = get_query.replace(change_class, "A.CLASS_A")
                            get_query = get_query.replace(change_rate, "A.RATE_A")
                            change_class="A.CLASS_A"
                            change_rate="A.RATE_A"


                        get_query = get_query.replace("B.LAYOUT_3_ID", layout)

                        with connection.cursor() as cursor:
                            cursor.execute(get_query, (area_qty, id))
                            results = cursor.fetchall()  # Fetch all rows returned by the query
                            
                            finishing_materials_data.append(results[j])
                            j=j+1


                    finish_cost = 0.0
                    # print(finishing_materials_data)

                    for i in range(len(finishing_materials_data)):
                        finish_cost=finish_cost+float(finishing_materials_data[i][5])
                        # print(finishing_materials_data[i][5])

                    print("Total Cost = ",finish_cost)
                    finishing_materials_data.append(finish_cost)
                    return finishing_materials_data

            except Exception as e:
                print(f"Error Occured: {e}")
                return False

            finally:
                if connection and connection.is_connected():
                    connection.close()
                    print("Connection closed for get_doublestorybasement_finishing")



class LabourDetailsModel:
    def fetch_labour_details(self):
        try:
            connection = connection_pool.get_connection()

            if connection.is_connected():
                print("Connection established for fetch_labour_details")

                select_query = "SELECT LABOUR_TYPE, Factor, Rate FROM LABOUR"
                with connection.cursor(dictionary=True) as cursor:
                    cursor.execute(select_query)
                    labour_details = cursor.fetchall()

                return labour_details

        except Exception as e:
            print(f"Error Occured: {e}")

            return []

        finally:
            if connection and connection.is_connected():
                connection.close()
                print("Connection closed for fetch_labour_details")

    def update_rate(self, material_name, new_rate):
        try:
            connection = connection_pool.get_connection()

            if connection.is_connected():
                print("Connection established for update_rate for Labour")

                update_query = "UPDATE LABOUR SET Rate = %s WHERE LABOUR_TYPE = %s"
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
                print("Connection closed for update_rate for Labour")



    def get_singlestory_labour(self,area,id):
            try:
                connection = connection_pool.get_connection()
                layout="LAYOUT_3_ID"

                if(area=="3 MARLA"):
                    layout="LAYOUT_3_ID"
                elif(area=="5 MARLA"):
                    layout="LAYOUT_5_ID"
                elif(area=="7 MARLA"):
                    layout="LAYOUT_7_ID"
                elif(area=="10 MARLA"):
                    layout="LAYOUT_10_ID"
                elif(area=="20 MARLA"):
                    layout="LAYOUT_20_ID"
                else:
                    print("Issue on Layout Id")
                    layout="LAYOUT_3_ID"




                if connection.is_connected():
                    print("Connection established for get_singlestory_labour")

                    get_query ="""
                            SELECT 
                                A.LABOUR_TYPE,
                                ROUND((A.RATE * (B.GROUND_SQFTS )),0) AS total_cost
                            FROM 
                                LABOUR AS A
                            JOIN 
                                FILTER_LABOUR AS B ON A.LABOUR_ID = B.LABOUR_ID
                            WHERE 
                                B.AREA_SQFTS= %s
                                AND B.LAYOUT_3_ID = %s;


                        """
                    get_query = get_query.replace("B.LAYOUT_3_ID", layout)


                    with connection.cursor() as cursor:
                        cursor.execute(get_query, (area, id))
                        labour_details = cursor.fetchall()

                    return labour_details

            except Exception as e:
                print(f"Error Occured: {e}")
                return False

            finally:
                if connection and connection.is_connected():
                    connection.close()
                    print("Connection closed for get_singlestory_labour")

    def get_singlestory_labour_cost(self,area,id):

            try:

                connection = connection_pool.get_connection()
                layout="LAYOUT_3_ID"

                if(area=="3 MARLA"):
                    layout="LAYOUT_3_ID"
                elif(area=="5 MARLA"):
                    layout="LAYOUT_5_ID"
                elif(area=="7 MARLA"):
                    layout="LAYOUT_7_ID"
                elif(area=="10 MARLA"):
                    layout="LAYOUT_10_ID"
                elif(area=="20 MARLA"):
                    layout="LAYOUT_20_ID"
                else:
                    print("Issue on Layout Id")
                    layout="LAYOUT_3_ID"

                if connection.is_connected():
                    print("Connection established for get_singlestory_labour_cost")

                    get_cost ="""
                        
                        SELECT 
                            SUM(total_cost) AS total_cost_sum
                        FROM (
                            SELECT 
                                A.LABOUR_TYPE,
                                A.FACTOR,
                                ROUND((A.RATE),0) AS rate_rounded,
                                (B.GROUND_SQFTS) AS total_quantity,
                                ROUND((A.RATE * (B.GROUND_SQFTS)),0) AS total_cost
                            FROM 
                                LABOUR AS A
                            JOIN 
                                FILTER_LABOUR AS B ON A.LABOUR_ID = B.LABOUR_ID
                            WHERE 
                                B.AREA_SQFTS= %s
                                AND B.LAYOUT_3_ID = %s
                        ) AS subquery;	




                        """
                    get_cost = get_cost.replace("B.LAYOUT_3_ID", layout)

                    with connection.cursor() as cursor:
                        cursor.execute(get_cost, (area, id))
                        labour_cost = cursor.fetchall()


                    return labour_cost

            except Exception as e:
                print(f"Error Occured: {e}")
                return False

            finally:
                if connection and connection.is_connected():
                    connection.close()
                    print("Connection closed for get_singlestory_labour_cost")


    def get_singlestory_basement_labour(self,area,id):
            try:
                connection = connection_pool.get_connection()
                layout="LAYOUT_3_ID"

                if(area=="3 MARLA"):
                    layout="LAYOUT_3_ID"
                elif(area=="5 MARLA"):
                    layout="LAYOUT_5_ID"
                elif(area=="7 MARLA"):
                    layout="LAYOUT_7_ID"
                elif(area=="10 MARLA"):
                    layout="LAYOUT_10_ID"
                elif(area=="20 MARLA"):
                    layout="LAYOUT_20_ID"
                else:
                    print("Issue on Layout Id")
                    layout="LAYOUT_3_ID"




                if connection.is_connected():
                    print("Connection established for get_singlestory_basement_labour")

                    get_query ="""
                            SELECT 
                                A.LABOUR_TYPE,
                                ROUND((A.RATE * (B.GROUND_SQFTS + B.BASEMENT_SQFTS )),0) AS total_cost
                            FROM 
                                LABOUR AS A
                            JOIN 
                                FILTER_LABOUR AS B ON A.LABOUR_ID = B.LABOUR_ID
                            WHERE 
                                B.AREA_SQFTS= %s
                                AND B.LAYOUT_3_ID = %s;


                        """
                    get_query = get_query.replace("B.LAYOUT_3_ID", layout)


                    with connection.cursor() as cursor:
                        cursor.execute(get_query, (area, id))
                        labour_details = cursor.fetchall()

                    return labour_details

            except Exception as e:
                print(f"Error Occured: {e}")
                return False

            finally:
                if connection and connection.is_connected():
                    connection.close()
                    print("Connection closed for get_singlestory_basement_labour")

    def get_singlestory_basement_labour_cost(self,area,id):

            try:

                connection = connection_pool.get_connection()
                layout="LAYOUT_3_ID"

                if(area=="3 MARLA"):
                    layout="LAYOUT_3_ID"
                elif(area=="5 MARLA"):
                    layout="LAYOUT_5_ID"
                elif(area=="7 MARLA"):
                    layout="LAYOUT_7_ID"
                elif(area=="10 MARLA"):
                    layout="LAYOUT_10_ID"
                elif(area=="20 MARLA"):
                    layout="LAYOUT_20_ID"
                else:
                    print("Issue on Layout Id")
                    layout="LAYOUT_3_ID"

                if connection.is_connected():
                    print("Connection established for get_singlestory_basement_labour_cost")

                    get_cost ="""
                        
                        SELECT 
                            SUM(total_cost) AS total_cost_sum
                        FROM (
                            SELECT 
                                A.LABOUR_TYPE,
                                A.FACTOR,
                                ROUND((A.RATE),0) AS rate_rounded,
                                (B.GROUND_SQFTS + B.BASEMENT_SQFTS) AS total_quantity,
                                ROUND((A.RATE * (B.GROUND_SQFTS + B.BASEMENT_SQFTS)),0) AS total_cost
                            FROM 
                                LABOUR AS A
                            JOIN 
                                FILTER_LABOUR AS B ON A.LABOUR_ID = B.LABOUR_ID
                            WHERE 
                                B.AREA_SQFTS= %s
                                AND B.LAYOUT_3_ID = %s
                        ) AS subquery;	




                        """
                    get_cost = get_cost.replace("B.LAYOUT_3_ID", layout)

                    with connection.cursor() as cursor:
                        cursor.execute(get_cost, (area, id))
                        labour_cost = cursor.fetchall()


                    return labour_cost

            except Exception as e:
                print(f"Error Occured: {e}")
                return False

            finally:
                if connection and connection.is_connected():
                    connection.close()
                    print("Connection closed for get_singlestory_basement_labour_cost")



    def get_doublestory_labour(self,area,id):
            try:
                connection = connection_pool.get_connection()
                layout="LAYOUT_3_ID"

                if(area=="3 MARLA"):
                    layout="LAYOUT_3_ID"
                elif(area=="5 MARLA"):
                    layout="LAYOUT_5_ID"
                elif(area=="7 MARLA"):
                    layout="LAYOUT_7_ID"
                elif(area=="10 MARLA"):
                    layout="LAYOUT_10_ID"
                elif(area=="20 MARLA"):
                    layout="LAYOUT_20_ID"
                else:
                    print("Issue on Layout Id")
                    layout="LAYOUT_3_ID"




                if connection.is_connected():
                    print("Connection established for get_doublestory_labour")

                    get_query ="""
                            SELECT 
                                A.LABOUR_TYPE,
                                ROUND((A.RATE * (B.GROUND_SQFTS + B.FIRST_FLOOR_SQFTS )),0) AS total_cost
                            FROM 
                                LABOUR AS A
                            JOIN 
                                FILTER_LABOUR AS B ON A.LABOUR_ID = B.LABOUR_ID
                            WHERE 
                                B.AREA_SQFTS= %s
                                AND B.LAYOUT_3_ID = %s;


                        """
                    get_query = get_query.replace("B.LAYOUT_3_ID", layout)


                    with connection.cursor() as cursor:
                        cursor.execute(get_query, (area, id))
                        labour_details = cursor.fetchall()

                    return labour_details

            except Exception as e:
                print(f"Error Occured: {e}")
                return False

            finally:
                if connection and connection.is_connected():
                    connection.close()
                    print("Connection closed for get_doublestory_labour")

    def get_singlestory_labour_cost(self,area,id):

            try:

                connection = connection_pool.get_connection()
                layout="LAYOUT_3_ID"

                if(area=="3 MARLA"):
                    layout="LAYOUT_3_ID"
                elif(area=="5 MARLA"):
                    layout="LAYOUT_5_ID"
                elif(area=="7 MARLA"):
                    layout="LAYOUT_7_ID"
                elif(area=="10 MARLA"):
                    layout="LAYOUT_10_ID"
                elif(area=="20 MARLA"):
                    layout="LAYOUT_20_ID"
                else:
                    print("Issue on Layout Id")
                    layout="LAYOUT_3_ID"

                if connection.is_connected():
                    print("Connection established for get_doublestory_labour_cost")

                    get_cost ="""
                        
                        SELECT 
                            SUM(total_cost) AS total_cost_sum
                        FROM (
                            SELECT 
                                A.LABOUR_TYPE,
                                A.FACTOR,
                                ROUND((A.RATE),0) AS rate_rounded,
                                (B.GROUND_SQFTS + B.FIRST_FLOOR_SQFTS) AS total_quantity,
                                ROUND((A.RATE * (B.GROUND_SQFTS + B.FIRST_FLOOR_SQFTS)),0) AS total_cost
                            FROM 
                                LABOUR AS A
                            JOIN 
                                FILTER_LABOUR AS B ON A.LABOUR_ID = B.LABOUR_ID
                            WHERE 
                                B.AREA_SQFTS= %s
                                AND B.LAYOUT_3_ID = %s
                        ) AS subquery;	




                        """
                    get_cost = get_cost.replace("B.LAYOUT_3_ID", layout)

                    with connection.cursor() as cursor:
                        cursor.execute(get_cost, (area, id))
                        labour_cost = cursor.fetchall()


                    return labour_cost

            except Exception as e:
                print(f"Error Occured: {e}")
                return False

            finally:
                if connection and connection.is_connected():
                    connection.close()
                    print("Connection closed for get_doublestory_labour_cost")



    def get_doublestory_basement_labour(self,area,id):
            try:
                connection = connection_pool.get_connection()
                layout="LAYOUT_3_ID"

                if(area=="3 MARLA"):
                    layout="LAYOUT_3_ID"
                elif(area=="5 MARLA"):
                    layout="LAYOUT_5_ID"
                elif(area=="7 MARLA"):
                    layout="LAYOUT_7_ID"
                elif(area=="10 MARLA"):
                    layout="LAYOUT_10_ID"
                elif(area=="20 MARLA"):
                    layout="LAYOUT_20_ID"
                else:
                    print("Issue on Layout Id")
                    layout="LAYOUT_3_ID"




                if connection.is_connected():
                    print("Connection established for get_doublestory_basement_labour")

                    get_query ="""
                            SELECT 
                                A.LABOUR_TYPE,
                                ROUND((A.RATE * (B.GROUND_SQFTS + FIRST_FLOOR_SQFTS + B.BASEMENT_SQFTS )),0) AS total_cost
                            FROM 
                                LABOUR AS A
                            JOIN 
                                FILTER_LABOUR AS B ON A.LABOUR_ID = B.LABOUR_ID
                            WHERE 
                                B.AREA_SQFTS= %s
                                AND B.LAYOUT_3_ID = %s;


                        """
                    get_query = get_query.replace("B.LAYOUT_3_ID", layout)


                    with connection.cursor() as cursor:
                        cursor.execute(get_query, (area, id))
                        labour_details = cursor.fetchall()

                    return labour_details

            except Exception as e:
                print(f"Error Occured: {e}")
                return False

            finally:
                if connection and connection.is_connected():
                    connection.close()
                    print("Connection closed for get_doublestory_basement_labour")

    def get_doublestory_basement_labour_cost(self,area,id):

            try:

                connection = connection_pool.get_connection()
                layout="LAYOUT_3_ID"

                if(area=="3 MARLA"):
                    layout="LAYOUT_3_ID"
                elif(area=="5 MARLA"):
                    layout="LAYOUT_5_ID"
                elif(area=="7 MARLA"):
                    layout="LAYOUT_7_ID"
                elif(area=="10 MARLA"):
                    layout="LAYOUT_10_ID"
                elif(area=="20 MARLA"):
                    layout="LAYOUT_20_ID"
                else:
                    print("Issue on Layout Id")
                    layout="LAYOUT_3_ID"

                if connection.is_connected():
                    print("Connection established for get_doublestory_basement_labour_cost")

                    get_cost ="""
                        
                        SELECT 
                            SUM(total_cost) AS total_cost_sum
                        FROM (
                            SELECT 
                                A.LABOUR_TYPE,
                                A.FACTOR,
                                ROUND((A.RATE),0) AS rate_rounded,
                                (B.GROUND_SQFTS + FIRST_FLOOR_SQFTS + B.BASEMENT_SQFTS) AS total_quantity,
                                ROUND((A.RATE * (B.GROUND_SQFTS +  FIRST_FLOOR_SQFTS + B.BASEMENT_SQFTS)),0) AS total_cost
                            FROM 
                                LABOUR AS A
                            JOIN 
                                FILTER_LABOUR AS B ON A.LABOUR_ID = B.LABOUR_ID
                            WHERE 
                                B.AREA_SQFTS= %s
                                AND B.LAYOUT_3_ID = %s
                        ) AS subquery;	




                        """
                    get_cost = get_cost.replace("B.LAYOUT_3_ID", layout)

                    with connection.cursor() as cursor:
                        cursor.execute(get_cost, (area, id))
                        labour_cost = cursor.fetchall()


                    return labour_cost

            except Exception as e:
                print(f"Error Occured: {e}")
                return False

            finally:
                if connection and connection.is_connected():
                    connection.close()
                    print("Connection closed for get_doublestory_basement_labour_cost")

