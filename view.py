# views.py
from flask import jsonify

class LoginView:
    @staticmethod
    def success_response(username,role):
        return jsonify({"message": "Login successful", 'username': username,'role':role}), 200

    @staticmethod
    def failure_response():
        return jsonify({"message": "Invalid Username or password"}), 401

class SignupView:
    @staticmethod
    def success_response(username, password, emailaddr, SECRET_ANSWER):
        return jsonify({
            'username': username,
            'password': password,
            'emailaddr': emailaddr,
            'SECRET_ANSWER': SECRET_ANSWER
        }), 200

    @staticmethod
    def duplicate_email_response():
        return jsonify({"error": "Duplicate email"}), 408
    def duplicate_username_response():
        return jsonify({"error": "Duplicate username"}), 409

    @staticmethod
    def failure_response(error_message):
        return jsonify({"error": error_message}), 500
    
class VerifyUserView:
    @staticmethod
    def success_response(username, SECRET_ANSWER):
        return jsonify({"username": username, "SECRET_ANSWER": SECRET_ANSWER}), 200

    @staticmethod
    def failure_response():
        return jsonify({"message": "Username not found"}), 401

    @staticmethod
    def error_response(error_message):
        return jsonify({"error": error_message}), 500

class ForgotView:
    @staticmethod
    def success_response(username, password):
        return {"username": username, "password": password}

    @staticmethod
    def failure_response():
        return {"message": "Password Change Unsuccessful"}

    @staticmethod
    def error_response(error_message):
        return {"error": error_message}
    

class FeedbackView:
    @staticmethod
    def success_response(username, feedback):
        return {"username": username, "feedback": feedback}

    @staticmethod
    def failure_response():
        return {"message": "Error updating feedback"}

    @staticmethod
    def success_update_action():
        return {"message": "Successful updating action"},200

    @staticmethod
    def failed_update_action():
        return {"message": "Failed to update action"}

    @staticmethod
    def error_response(error_message):
        return {"error": error_message}


class GetUserView:
    @staticmethod
    def success_response(users):
        return jsonify(users)
    
    @staticmethod
    def error_response():
        return jsonify({"error": "Internal Server Error"}), 500  
    
    @staticmethod
    def success_update_action():
        return {"message": "Successful Removing User"},200

    @staticmethod
    def failed_update_action():
        return {"message": "Failed to Remove User"}


class GetFeedView:
    @staticmethod
    def success_response(feedbacks):
        return jsonify(feedbacks)
    
    @staticmethod
    def error_response():
        return jsonify({"error": "Internal Server Error"}), 500  

class CheckPassView:
    @staticmethod
    def success_response(username, new_SECRET_ANSWER):
        return {"username": username, "newpass": new_SECRET_ANSWER}

    @staticmethod
    def failure_response():
        return {"message": "Username not found"}

    @staticmethod
    def error_response(error_message):
        return {"error": error_message}
    

class ImageView:
    @staticmethod
    def success_response(floor_plans):
        return jsonify(floor_plans)

    @staticmethod
    def error_response():
        return jsonify({"error": "Internal Server Error"}), 500
    
class GreyView1:
    @staticmethod
    def success_response(grey_materials):
        return jsonify(grey_materials)
    
    @staticmethod
    def error_response():
        return jsonify({"error": "Internal Server Error"}), 500

class GreyView2:
    @staticmethod
    def success_response(message=""):
        return jsonify({"success": True, "message": message}), 200

    @staticmethod
    def error_response(message=""):
        return jsonify({"success": False, "error_message": message}), 500
    
class GetGreyMaterialCost:
    @staticmethod
    def success_response(grey_materials,total_cost):
        return jsonify(grey_materials,total_cost),200
    
    @staticmethod
    def error_response():
        return jsonify({"error": "Internal Server Error"}), 500