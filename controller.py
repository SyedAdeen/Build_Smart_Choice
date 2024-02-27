# controllers.py
from flask import jsonify, request
from model import CheckPassModel, CheckPassModel2, FeedbackModel, ForgotModel, GreyMaterialsModel, ImageModel, UserModel, UserAuthModel, SignupModel, VerifyUserModel,GetUserModel
from view import CheckPassView, FeedbackView, ForgotView, GetFeedView, GetUserView, GreyView1, GreyView2, ImageView, LoginView, SignupView, VerifyUserView
import bcrypt
from grey_scrap import main

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

                return LoginView.success_response(username,role)
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


# class GreyController:
#     def __init__(self) -> None:
#         pass
#     def fetch_grey_data(self):
#         {
#             try:
            

#         }



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
    