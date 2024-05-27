# controllers.py
from flask import jsonify, request
from model import CheckPassModel, CheckPassModel2, FeedbackModel, FinishMaterialsModel, ForgotModel, GreyMaterialsModel, ImageModel, LabourDetailsModel, UserModel, UserAuthModel, SignupModel, VerifyUserModel,GetUserModel
from view import CheckPassView, FeedbackView, FinishView1, FinishView2, ForgotView, GetFeedView, GetGreyMaterialCost, GetLabourCost, GetRecommendation, GetUserView, GreyView1, GreyView2, ImageView, Labour_View, LabourView2, LoginView, SignupView, VerifyUserView
import bcrypt
from grey_scrap import main
import locale
from bsc_train_test import main2
import numpy as np
import json




class LoginController:
    def __init__(self):
        self.user_model = UserModel()
        self.user_auth_model = UserAuthModel()

    def login(self):
        try:
            data = request.json
            username = data.get('username')
            password = data.get('password')

            if not username or not password:
                return jsonify({"message": "Username and password are required"}), 400

            user = self.user_model.get_user_by_username(username)

            if user and self.user_auth_model.check_password(password, user[3]):
                role=user[6]
                user_type=user[5]

                return LoginView.success_response(username,role,user_type)
            else:
                return LoginView.failure_response()

        except Exception as e:
            return jsonify({"error": str(e)}), 500

class SignupController:
    def __init__(self):
        self.user_model = UserModel()
        self.signup_model = SignupModel()

    def signup(self):
        try:
            data = request.json
            username = data.get('username')
            password = data.get('password')
            emailaddr = data.get('emailaddr')
            SECRET_ANSWER = data.get('SECRET_ANSWER')

            if not username or not password or not emailaddr or not SECRET_ANSWER:
                return SignupView.failure_response("All fields are required"), 400

            existing_user = self.user_model.get_user_by_username(username)
            if existing_user:
                return SignupView.duplicate_username_response()
            
            existing_email = self.user_model.check_user_email(emailaddr) 
            if existing_email:   
                return SignupView.duplicate_email_response()           
            
            else:
                return SignupView.success_response(username, password, emailaddr, SECRET_ANSWER)

        except Exception as e:
            return SignupView.failure_response(str(e))
    
    def adduser(self):
        try:
            data = request.json
            username = data.get('username')
            password = data.get('password')
            emailaddr = data.get('emailaddr')
            SECRET_ANSWER = data.get('SECRET_ANSWER')
            
            salt = bcrypt.gensalt()
            hashed_password = bcrypt.hashpw(password.encode('utf-8'), salt)

            self.signup_model.create_user(username, hashed_password, emailaddr, SECRET_ANSWER)
            
            return SignupView.success_response(username, password, emailaddr, SECRET_ANSWER)

        except Exception as e:
            return SignupView.failure_response(str(e))


class FeedbackController:
    def __init__(self):
        self.feedback_model = FeedbackModel()

    def update_feedback(self):
        try:
            data = request.json
            username = data.get('username')
            feedback = data.get('feedback')

            if not username or not feedback:
                return jsonify(FeedbackView.failure_response()), 400

            self.feedback_model.update_feedback(username, feedback)

            return jsonify(FeedbackView.success_response(username, feedback)), 200

        except Exception as e:
            return jsonify(FeedbackView.error_response(str(e))), 500
        
    def getFeedbacks(self):
        try:
            # Assuming you have a method in your model to fetch Feedbacks
            feedbacks=self.feedback_model.get_all_feeds()
            
            return GetFeedView.success_response(feedbacks)

        except Exception as e:
            print(f"Error: {e}")

    def update_action(self):
        try:
            # Assuming you have a method in your model to update the rate
            data = request.get_json()
            

            action = data.get('action')
            id = data.get('feedback_id')
            print(action)
            print(id)
            # Update the rate in the model
            success = self.feedback_model.action_update(action,id)

            if success:
                return FeedbackView.success_update_action()
            else:
                return FeedbackView.error_response()

        except Exception as e:
            print(f"Error: {e}")
            return ImageView.error_response()



class GetUserController:
        
    def __init__(self):
        self.getuser_model=GetUserModel()


    def getusers(self):
        try:
            # Assuming you have a method in your model to fetch Feedbacks
            fetched_users=self.getuser_model.get_all_users()
            
            return GetUserView.success_response(fetched_users)

        except Exception as e:
            print(f"Error: {e}")

    def remove_users(self):
        try:
            # Assuming you have a method in your model to update the rate
            data = request.get_json()
            
            id = data.get('username')
            print(id)
            # Update the rate in the model
            success = self.getuser_model.remove_users(id)
            print(success)

            if success:
                return GetUserView.success_update_action()
            else:
                return GetUserView.error_response()

        except Exception as e:
            print(f"Error: {e}")
            return ImageView.error_response()






class VerifyUserController:
    def __init__(self):
        self.verify_user_model = VerifyUserModel()

    def verify_user(self):
        try:
            data = request.json
            username = data.get('username')
            SECRET_ANSWER = data.get('secret')
            print(SECRET_ANSWER)
            print(username)


            if not username or not SECRET_ANSWER:
                return VerifyUserView.failure_response(), 400

            user = self.verify_user_model.verify_user(username, SECRET_ANSWER)


            if user:
                return VerifyUserView.success_response(username, SECRET_ANSWER)
            else:
                return VerifyUserView.failure_response()

        except Exception as e:
            return VerifyUserView.error_response(str(e))
        

class ForgotController:
    def __init__(self):
        self.forgot_model = ForgotModel()

    def forgot(self):
        try:
            data = request.json
            username = data.get('username')
            password = data.get('password')
                    
            salt = bcrypt.gensalt()
            hashed_password = bcrypt.hashpw(password.encode('utf-8'), salt)

            self.forgot_model.update_password(username, hashed_password)

            return jsonify(ForgotView.success_response(username, password))


        except Exception as e:
            return jsonify(ForgotView.error_response(str(e))), 500
        


        

class CheckPassController:
    def __init__(self):
        self.check_pass_model = CheckPassModel()

    def check_pass1(self):
        try:
            data = request.json
            username = data.get('username')
            password = data.get('password')
            newpass=data.get('newpassword')
            if not username or not password:
                return jsonify(CheckPassView.failure_response()), 400

            salt = bcrypt.gensalt()
            hashed_password = bcrypt.hashpw(newpass.encode('utf-8'), salt)

            user = self.check_pass_model.verify_password(username,password,hashed_password)

            if user:
                return jsonify(CheckPassView.success_response(username, newpass))
            else:
                return jsonify(CheckPassView.failure_response()), 401

        except Exception as e:
            return jsonify(CheckPassView.error_response(str(e))), 500
        

class CheckPassController2:
    def __init__(self):
        self.check_pass_model = CheckPassModel2()

    def check_pass2(self):
        try:
            data = request.json
            username = data.get('username')
            password = data.get('password')
            new_SECRET_ANSWER = data.get('newSECRET_ANSWER')

            if not username or not password:
                return jsonify(CheckPassView.failure_response()), 400
            
            user = self.check_pass_model.update_SECRET_ANSWER(username, new_SECRET_ANSWER, password)
            if user != "Incorrect password":
                return jsonify(CheckPassView.success_response(username, new_SECRET_ANSWER))
            else:
                return jsonify(CheckPassView.failure_response()), 401

        except Exception as e:
            return jsonify(CheckPassView.error_response(str(e))), 500


class ImageController:
    def __init__(self):
        self.image_model = ImageModel()

    def get_images(self):
        try:
            table_name = request.args.get('table_name', 'layout_3')  # Default to layout_3 if not provided
            floor_plans = self.image_model.get_floor_plans(table_name)
            return ImageView.success_response(floor_plans)

        except Exception as e:
            print(f"Error: {e}")
            return ImageView.error_response()
        
    def get_imagesb1(self):
        try:
            table_name = request.args.get('table_name', 'layout_3')  # Default to layout_3 if not provided
            floor_plans = self.image_model.get_floor_plansb1(table_name)
            return ImageView.success_response(floor_plans)

        except Exception as e:
            print(f"Error: {e}")
            return ImageView.error_response()
            
    def get_images2(self):
            try:
                table_name = request.args.get('table_name', 'layout_3')  # Default to layout_3 if not provided
                floor_plans = self.image_model.get_floor_plans2(table_name)
                return ImageView.success_response(floor_plans)

            except Exception as e:
                print(f"Error: {e}")
                return ImageView.error_response()
        

    def get_imagesb2(self):
        try:
            table_name = request.args.get('table_name', 'layout_3')  # Default to layout_3 if not provided
            floor_plans = self.image_model.get_floor_plansb2(table_name)
            return ImageView.success_response(floor_plans)

        except Exception as e:
            print(f"Error: {e}")
            return ImageView.error_response()
        
class GreyMaterialsController:
    def __init__(self):
        self.grey_materials_model = GreyMaterialsModel()

    def scrap_data(self):
        try:
            prices = main()
            # print (prices)

            ans=self.grey_materials_model.update_scraped(prices)
            if(ans==1):

                return GreyView2.success_response("Data has been updated successfully")
            else:
                return GreyView2.error_response("Unable to update Data")


        except Exception as e:
            print(f"Error: {e}")

        

    def fetch_grey_materials(self):
        try:
            # Assuming you have a method in your model to fetch grey materials
            grey_materials = self.grey_materials_model.fetch_grey_materials()
            return GreyView1.success_response(grey_materials)

        except Exception as e:
            print(f"Error: {e}")
            return GreyView1.error_response()
          


    def update_rate(self):
        try:
            # Assuming you have a method in your model to update the rate
            data = request.get_json()
            

            material_name = data.get('material_name')
            new_rate = data.get('new_rate')
            print(material_name)
            print(new_rate)
            # Update the rate in the model
            success = self.grey_materials_model.update_rate(material_name, new_rate)

            if success:
                return GreyView2.success_response(message="Rate updated successfully")
            else:
                return GreyView2.error_response(message="Failed to update rate")

        except Exception as e:
            print(f"Error: {e}")
            return ImageView.error_response()
    
    def getsinglestory(self):
        try:
            area=request.args['area']
            id=request.args['set']
            print(area)
            print(id)

            grey_materials = self.grey_materials_model.get_singlestory_materials(area, id)

            grey_cost = self.grey_materials_model.get_singlestory_greycost(area, id)

            print(grey_materials)
            print(grey_cost)

            # Initialize the sum
            total_cost = 0

            # Iterate over the list and add each value to the sum
            for cost_tuple in grey_cost:
                for cost_value in cost_tuple:
                    total_cost += cost_value
            total_cost=round(total_cost,0)


            # Set the locale to Indian English
            locale.setlocale(locale.LC_NUMERIC, 'en_IN')

            # Define the number

            # Format the number
            formatted_number = locale.format_string("%.2f", total_cost, grouping=True)


            print(formatted_number)

            if(formatted_number!="" and grey_materials!=[]):
                return GetGreyMaterialCost.success_response(grey_materials, formatted_number)
            else:
                return GetGreyMaterialCost.error_response()


        except Exception as e:
                    print(f"Error: {e}")
                    return GetGreyMaterialCost.error_response()


    def getsinglebasement(self):
        try:
            area=request.args['area']
            id=request.args['set']
            print(area)
            print(id)

            grey_materials = self.grey_materials_model.get_singlebasement_materials(area, id)

            grey_cost = self.grey_materials_model.get_singlebasement_greycost(area, id)

            print(grey_materials)
            print(grey_cost)

            # Initialize the sum
            total_cost = 0

            # Iterate over the list and add each value to the sum
            for cost_tuple in grey_cost:
                for cost_value in cost_tuple:
                    total_cost += cost_value
            total_cost=round(total_cost,0)


            # Set the locale to Indian English
            locale.setlocale(locale.LC_NUMERIC, 'en_IN')

            # Define the number

            # Format the number
            formatted_number = locale.format_string("%.2f", total_cost, grouping=True)


            print(formatted_number)

            if(formatted_number!="" and grey_materials!=[]):
                return GetGreyMaterialCost.success_response(grey_materials, formatted_number)
            else:
                return GetGreyMaterialCost.error_response()


        except Exception as e:
                    print(f"Error: {e}")
                    return GetGreyMaterialCost.error_response()



    def getdoublestory(self):
        try:
            area=request.args['area']
            id=request.args['set']
            print(area)
            print(id)

            grey_materials = self.grey_materials_model.get_doublestory_materials(area, id)

            grey_cost = self.grey_materials_model.get_doublestory_greycost(area, id)

            print(grey_materials)
            print(grey_cost)

            # Initialize the sum
            total_cost = 0

            # Iterate over the list and add each value to the sum
            for cost_tuple in grey_cost:
                for cost_value in cost_tuple:
                    total_cost += cost_value
            total_cost=round(total_cost,0)


            # Set the locale to Indian English
            locale.setlocale(locale.LC_NUMERIC, 'en_IN')

            # Define the number

            # Format the number
            formatted_number = locale.format_string("%.2f", total_cost, grouping=True)


            print(formatted_number)

            if(formatted_number!="" and grey_materials!=[]):
                return GetGreyMaterialCost.success_response(grey_materials, formatted_number)
            else:
                return GetGreyMaterialCost.error_response()


        except Exception as e:
                    print(f"Error: {e}")
                    return GetGreyMaterialCost.error_response() 

   
    def getdoublebasement(self):
        try:
            area=request.args['area']
            id=request.args['set']
            print(area)
            print(id)

            grey_materials = self.grey_materials_model.get_doublebasement_materials(area, id)

            grey_cost = self.grey_materials_model.get_doublebasement_greycost(area, id)

            print(grey_materials)
            print(grey_cost)

            # Initialize the sum
            total_cost = 0

            # Iterate over the list and add each value to the sum
            for cost_tuple in grey_cost:
                for cost_value in cost_tuple:
                    total_cost += cost_value
            total_cost=round(total_cost,0)


            # Set the locale to Indian English
            locale.setlocale(locale.LC_NUMERIC, 'en_IN')

            # Define the number

            # Format the number
            formatted_number = locale.format_string("%.2f", total_cost, grouping=True)


            print(formatted_number)

            if(formatted_number!="" and grey_materials!=[]):
                return GetGreyMaterialCost.success_response(grey_materials, formatted_number)
            else:
                return GetGreyMaterialCost.error_response()


        except Exception as e:
                    print(f"Error: {e}")
                    return GetGreyMaterialCost.error_response() 


class FinishMaterialsController:

    def __init__(self):
        self.finshing_materials_model = FinishMaterialsModel()
     
    def fetch_finish_materials(self):
        try:
            # Assuming you have a method in your model to fetch grey materials

            finish_materials = self.finshing_materials_model.fetch_finish_materials()
            return FinishView1.success_response(finish_materials)

        except Exception as e:
            print(f"Error: {e}")
            return GreyView1.error_response()
        

    def update_rate(self):
        try:
            # Assuming you have a method in your model to update the rate
            data = request.get_json()
            

            material_name = data.get('material_name')
            new_rate = data.get('new_rate')
            class_name = data.get('class_name')
            print(material_name)
            print(new_rate)
            print(class_name)
            # Update the rate in the model
            success = self.finshing_materials_model.update_rate(material_name, new_rate,class_name)

            if success:
                return FinishView2.success_response(message="Rate updated successfully")
            else:
                return FinishView2.error_response(message="Failed to update rate")

        except Exception as e:
            print(f"Error: {e}")
            return ImageView.error_response()
    
    
    
    def recommendation(self):

        try:
                
            min = request.args['min']

            max = request.args['max']
            area=request.args['area']
            floor = request.args['floor']
            

            print("Minimum value outside of if condition",min,area,floor,type(area),type(floor),max)
            min=int(min)
            max=int(max)
            

            if(area==3 and floor==1):
                min=min-400000


            if(area=="3" and floor=="2"):
                min=min-700000
                print("Minimum*************************************=", min)

            if(area=="3" and floor=="3"):
                min=min-1000000
                print("Minimum*************************************=", min)

            if(area=="3" and floor=="4"):
                min=min-800000
                print("Minimum*************************************=", min)

            if(area=="5" and floor=="1"):
                min=min-500000
                print("Minimum*************************************=", min)

            if(area=="5" and floor=="2"):
                min=min-1500000
                print("Minimum*************************************=", min)

            if(area=="5" and floor=="3"):
                min=min-1800000
                print("Minimum*************************************=", min)

            if(area=="5" and floor=="4"):
                min=min-1900000
                print("Minimum*************************************=", min)


            if(area=="7" and floor=="3"):
                min=min-1000000
                print("Minimum*************************************=", min)


            if(area=="7" and floor=="4"):
                min=min-200000
                print("Minimum*************************************=", min)

            if(area=="1" and floor=="3"):
                min=min-800000
                print("Minimum*************************************=", min)

            if(area=="1" and floor=="4"):
                min=min-1100000
                print("Minimum*************************************=", min)

            if(area=="2" and floor=="2"):
                min=min-600000
                print("Minimum*************************************=", min)

            if(area=="2" and floor=="3"):
                min=min-1000000
                print("Minimum*************************************=", min)

            if(area=="2" and floor=="4"):
                min=min-2200000
                print("Minimum*************************************=", min)


            val1=min+500000
            print(val1)


            print("Printing Parameters",min,val1,area,floor)
            
            predicted_classes1 = main2(min,val1,area,floor)

            min=min+200000
            val1=val1+200000


            print("Printing Parameters",min,val1,area,floor)

            predicted_classes2 = main2(min,val1,area,floor)
            
            min=min+300000

            val1=val1+300000

            print("Printing Parameters",min,val1,area,floor)


            predicted_classes3 = main2(min,val1,area,floor)

            min=min+800000
            val1=val1+800000

            if(area=="1" and floor=="4"):
                max=max+600000
                print("Max*************************************=", max)

            elif(area=="2" and floor=="1"):
                max=max+300000
                print("Max*************************************=", max)
            else:
                 max=max+1200000


            premium = main2(max,val1,area,floor)


            combined_predictions = np.concatenate([predicted_classes1, predicted_classes2, predicted_classes3,premium], axis=0)

            # print("Combined: ",combined_predictions)
            print(len(combined_predictions))
            prediction_list=combined_predictions.tolist()
            # predictions_json = json.dumps(prediction_list)
            # print("Combined",predictions_json)

            # print(predicted_classes)
            return GetRecommendation.success_response(prediction_list)

        except Exception as e:
            print(f"Error: {e}")
            return GetRecommendation.error_response()

    def fetch_pack1(self):
        try:
            set_id = request.args['set_id']
            area = request.args['area']
            storey=request.args['storey']
            predicted_array=request.args['predicted_array']

            print("Set Id",set_id)
            print("Area",area)
            print("Storey/Floor",storey)
            print("Double Array",predicted_array)

            if storey=='1':

                finishing_materials = self.finshing_materials_model.get_singlestory_finishing(area, set_id,predicted_array)

                # print("At Controller = ",finishing_materials)
            elif(storey=='2'):
                finishing_materials = self.finshing_materials_model.get_singlestorybasement_finishing(area, set_id,predicted_array)

                # print("At Controller = ",finishing_materials)

            elif(storey=='3'):
                finishing_materials = self.finshing_materials_model.get_doublestory_finishing(area, set_id,predicted_array)

                # print("At Controller = ",finishing_materials)

            elif(storey=='4'):
                finishing_materials = self.finshing_materials_model.get_doublestorybasement_finishing(area, set_id,predicted_array)

                # print("At Controller = ",finishing_materials)




            return GetRecommendation.success_response(finishing_materials)
          


        except Exception as e:
            print(f"Error: {e}")
            return GetRecommendation.error_response()



class LabourDetailsController:
    def __init__(self):
        self.labour_details_model = LabourDetailsModel()

    def labour_details(self):
        try:
            # Assuming you have a method in your model to fetch grey materials
            labour_data = self.labour_details_model.fetch_labour_details()
            return Labour_View.success_response(labour_data)

        except Exception as e:
            print(f"Error: {e}")
            return Labour_View.error_response()
        
    def update_rate(self):
        try:
            # Assuming you have a method in your model to update the rate
            data = request.get_json()            

            labour_type = data.get('labour_type')
            new_rate = data.get('new_rate')
            print(labour_type)
            print(new_rate)
            # Update the rate in the model
            success = self.labour_details_model.update_rate(labour_type, new_rate)

            if success:
                return LabourView2.success_response(message="Rate updated successfully")
            else:
                return LabourView2.error_response(message="Failed to update rate")

        except Exception as e:
            print(f"Error: {e}")
            return ImageView.error_response()

    def getsinglestory(self):
            try:
                area=request.args['area']
                id=request.args['set']

                labour_details = self.labour_details_model.get_singlestory_labour(area, id)

                labour_cost = self.labour_details_model.get_singlestory_labour_cost(area, id)

                print(labour_details)
                print(labour_cost)



                # Set the locale to Indian English
                locale.setlocale(locale.LC_NUMERIC, 'en_IN')

                # Define the number
                real_number = labour_cost[0][0]

                # Format the number
                formatted_number = locale.format_string("%.2f", real_number, grouping=True)



                print(formatted_number)

                if(formatted_number!="" and labour_details!=[]):
                    return GetLabourCost.success_response(labour_details, formatted_number)
                else:
                    return GetLabourCost.error_response()


            except Exception as e:
                        print(f"Error: {e}")
                        return GetLabourCost.error_response()


    def getdoublestory(self):
            try:
                area=request.args['area']
                id=request.args['set']
                print("Labour Here",area)
                print(id)

                labour_details = self.labour_details_model.get_singlestory_labour(area, id)

                labour_cost = self.labour_details_model.get_singlestory_labour_cost(area, id)

                print(labour_details)
                print(labour_cost)



                # Set the locale to Indian English
                locale.setlocale(locale.LC_NUMERIC, 'en_IN')

                # Define the number
                real_number = labour_cost[0][0]

                # Format the number
                formatted_number = locale.format_string("%.2f", real_number, grouping=True)



                print(formatted_number)

                if(formatted_number!="" and labour_details!=[]):
                    return GetLabourCost.success_response(labour_details, formatted_number)
                else:
                    return GetLabourCost.error_response()


            except Exception as e:
                        print(f"Error: {e}")
                        return GetLabourCost.error_response()
            

    def getsinglestorybasement(self):
            try:
                area=request.args['area']
                id=request.args['set']
                print("Labour Here",area)
                print(id)

                labour_details = self.labour_details_model.get_singlestory_basement_labour(area, id)

                labour_cost = self.labour_details_model.get_singlestory_basement_labour_cost(area, id)

                print(labour_details)
                print(labour_cost)



                # Set the locale to Indian English
                locale.setlocale(locale.LC_NUMERIC, 'en_IN')

                # Define the number
                real_number = labour_cost[0][0]

                # Format the number
                formatted_number = locale.format_string("%.2f", real_number, grouping=True)



                print(formatted_number)

                if(formatted_number!="" and labour_details!=[]):
                    return GetLabourCost.success_response(labour_details, formatted_number)
                else:
                    return GetLabourCost.error_response()


            except Exception as e:
                        print(f"Error: {e}")
                        return GetLabourCost.error_response()



    def getdoublestorybasement(self):
            try:
                area=request.args['area']
                id=request.args['set']
                print("Labour Here",area)
                print(id)

                labour_details = self.labour_details_model.get_doublestory_basement_labour(area, id)

                labour_cost = self.labour_details_model.get_doublestory_basement_labour_cost(area, id)

                print(labour_details)
                print(labour_cost)



                # Set the locale to Indian English
                locale.setlocale(locale.LC_NUMERIC, 'en_IN')

                # Define the number
                real_number = labour_cost[0][0]

                # Format the number
                formatted_number = locale.format_string("%.2f", real_number, grouping=True)



                print(formatted_number)

                if(formatted_number!="" and labour_details!=[]):
                    return GetLabourCost.success_response(labour_details, formatted_number)
                else:
                    return GetLabourCost.error_response()


            except Exception as e:
                        print(f"Error: {e}")
                        return GetLabourCost.error_response()


