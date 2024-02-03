# # controllers.py
# from flask import jsonify, request
# from model import CheckPassModel, CheckPassModel2, FeedbackModel, ForgotModel, ImageModel, UserModel, UserAuthModel, SignupModel, VerifyUserModel
# from view import CheckPassView, FeedbackView, ForgotView, ImageView, LoginView, SignupView, VerifyUserView
# import bcrypt

# class LoginController:
#     def __init__(self, db_config,):
#         self.user_model = UserModel(db_config)
#         self.user_auth_model = UserAuthModel()

#     def login(self,poolname,poolsize):
#         try:
#             self.poolname=poolname
#             self.poolsize=poolsize
            
#             data = request.json
#             username = data.get('username')
#             password = data.get('password')

#             if not username or not password:
#                 return jsonify({"message": "Username and password are required"}), 400

#             user = self.user_model.get_user_by_username(username,poolname,poolsize)
#             if user and self.user_auth_model.check_password(password, user[1]):
#                 return LoginView.success_response(username)
#             else:
#                 return LoginView.failure_response()

#         except Exception as e:
#             return jsonify({"error": str(e)}), 500

# class SignupController:
#     def __init__(self, db_config):
#         self.user_model = UserModel(db_config)
#         self.signup_model = SignupModel(db_config)

#     def signup(self,poolname,poolsize):
#         self.poolname=poolname
#         self.poolsize=poolsize

#         try:
#             data = request.json
#             username = data.get('username')
#             password = data.get('password')
#             emailaddr = data.get('emailaddr')
#             SECRET_ANSWER = data.get('SECRET_ANSWER')

#             if not username or not password or not emailaddr or not SECRET_ANSWER:
#                 return SignupView.failure_response("All fields are required"), 400

#             existing_user = self.user_model.get_user_by_username(username,poolname,poolsize)
#             if existing_user:
#                 return SignupView.duplicate_username_response()

#             salt = bcrypt.gensalt()
#             hashed_password = bcrypt.hashpw(password.encode('utf-8'), salt)

#             self.signup_model.create_user(username, hashed_password, emailaddr, SECRET_ANSWER,poolname,poolsize)
            
#             return SignupView.success_response(username, password, emailaddr, SECRET_ANSWER)

#         except Exception as e:
#             return SignupView.failure_response(str(e))
        
# class VerifyUserController:
#     def __init__(self, db_config):
#         self.verify_user_model = VerifyUserModel(db_config)

#     def verify_user(self,poolname,poolsize):
#         self.poolname=poolname
#         self.poolsize=poolsize
#         try:
#             data = request.json
#             username = data.get('username')
#             SECRET_ANSWER = data.get('SECRET_ANSWER')

#             if not username or not SECRET_ANSWER:
#                 return VerifyUserView.failure_response(), 400

#             user = self.verify_user_model.verify_user(username, SECRET_ANSWER,poolname,poolsize)

#             if user:
#                 return VerifyUserView.success_response(username, SECRET_ANSWER)
#             else:
#                 return VerifyUserView.failure_response()

#         except Exception as e:
#             return VerifyUserView.error_response(str(e))
        

# class ForgotController:
#     def __init__(self, db_config):
#         self.forgot_model = ForgotModel(db_config)

#     def forgot(self,poolname,poolsize):
#         self.poolname=poolname
#         self.poolsize=poolsize
#         try:
#             data = request.json
#             username = data.get('username')
#             password = data.get('password')
                    
#             salt = bcrypt.gensalt()
#             hashed_password = bcrypt.hashpw(password.encode('utf-8'), salt)

#             self.forgot_model.update_password(username, hashed_password,poolname,poolsize)

#             return jsonify(ForgotView.success_response(username, password))


#         except Exception as e:
#             return jsonify(ForgotView.error_response(str(e))), 500
        

# class FeedbackController:
#     def __init__(self, db_config):
#         self.feedback_model = FeedbackModel(db_config)

#     def update_feedback(self,poolname,poolsize):
#         self.poolname=poolname
#         self.poolsize=poolsize
#         try:
#             data = request.json
#             username = data.get('username')
#             feedback = data.get('feedback')

#             if not username or not feedback:
#                 return jsonify(FeedbackView.failure_response()), 400

#             self.feedback_model.update_feedback(username, feedback,poolname,poolsize)

#             return jsonify(FeedbackView.success_response(username, feedback)), 200

#         except Exception as e:
#             return jsonify(FeedbackView.error_response(str(e))), 500
        

# class CheckPassController:
#     def __init__(self, db_config):
#         self.check_pass_model = CheckPassModel(db_config)

#     def check_pass1(self,poolname,poolsize):
#         self.poolname=poolname
#         self.poolsize=poolsize
#         try:
#             data = request.json
#             username = data.get('username')
#             password = data.get('password')
#             newpass=data.get('newpassword')
#             if not username or not password:
#                 return jsonify(CheckPassView.failure_response()), 400

#             salt = bcrypt.gensalt()
#             hashed_password = bcrypt.hashpw(newpass.encode('utf-8'), salt)

#             user = self.check_pass_model.verify_password(username,password,hashed_password,poolname,poolsize)

#             if user:
#                 return jsonify(CheckPassView.success_response(username, newpass))
#             else:
#                 return jsonify(CheckPassView.failure_response()), 401

#         except Exception as e:
#             return jsonify(CheckPassView.error_response(str(e))), 500
        

# class CheckPassController2:
#     def __init__(self, db_config):
#         self.check_pass_model = CheckPassModel2(db_config)

#     def check_pass2(self,poolname,poolsize):
#         self.poolname=poolname
#         self.poolsize=poolsize
#         try:
#             data = request.json
#             username = data.get('username')
#             password = data.get('password')
#             new_SECRET_ANSWER = data.get('newSECRET_ANSWER')

#             if not username or not password:
#                 return jsonify(CheckPassView.failure_response()), 400
            
#             user = self.check_pass_model.update_SECRET_ANSWER(username, new_SECRET_ANSWER, password,poolname,poolsize)
#             if user != "User not found":
#                 return jsonify(CheckPassView.success_response(username, new_SECRET_ANSWER))
#             else:
#                 return jsonify(CheckPassView.failure_response()), 401

#         except Exception as e:
#             return jsonify(CheckPassView.error_response(str(e))), 500
        
# class ImageController:
#     def __init__(self, db_config):
#         self.image_model = ImageModel(db_config)

#     def get_images(self,poolname,poolsize):
#         self.poolname=poolname
#         self.poolsize=poolsize
#         try:
#             table_name = request.args.get('table_name', 'layout_3')  # Default to layout_3 if not provided
#             floor_plans = self.image_model.get_floor_plans(table_name,poolname,poolsize)
#             return ImageView.success_response(floor_plans)

#         except Exception as e:
#             print(f"Error: {e}")
#             return ImageView.error_response()
        
#     def get_imagesb1(self):
#         try:
#             table_name = request.args.get('table_name', 'layout_3')  # Default to layout_3 if not provided
#             floor_plans = self.image_model.get_floor_plansb1(table_name)
#             return ImageView.success_response(floor_plans)

#         except Exception as e:
#             print(f"Error: {e}")
#             return ImageView.error_response()
            
#     def get_images2(self):
#             try:
#                 table_name = request.args.get('table_name', 'layout_3')  # Default to layout_3 if not provided
#                 floor_plans = self.image_model.get_floor_plans2(table_name)
#                 return ImageView.success_response(floor_plans)

#             except Exception as e:
#                 print(f"Error: {e}")
#                 return ImageView.error_response()
        

#     def get_imagesb2(self):
#         try:
#             table_name = request.args.get('table_name', 'layout_3')  # Default to layout_3 if not provided
#             floor_plans = self.image_model.get_floor_plansb2(table_name)
#             return ImageView.success_response(floor_plans)

#         except Exception as e:
#             print(f"Error: {e}")
#             return ImageView.error_response()
    
