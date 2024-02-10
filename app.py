from flask import Flask
from flask_cors import CORS
from controller import CheckPassController, CheckPassController2, FeedbackController, ForgotController, GreyMaterialsController, ImageController, LoginController, SignupController, VerifyUserController, GetUserController

app = Flask(__name__)
CORS(app)

# db_config = {
#     "host": "127.0.0.1",
#     "user": "root",
#     "password": "admin",
#     "database": "db_bsc",
# }

login_controller = LoginController()
signup_controller = SignupController()
verify_user_controller = VerifyUserController()
fogot_controller = ForgotController()
feedback_controller = FeedbackController()
check_pass_controller = CheckPassController()
check_pass_controller2 = CheckPassController2()
image_controller=ImageController()
Grey_Controller = GreyMaterialsController()
Get_User_controller = GetUserController()



@app.route('/login', methods=['POST'])
def login():
    return login_controller.login()

@app.route('/signup', methods=['POST'])
def signup():
    return signup_controller.signup()

@app.route('/adduser', methods=['POST'])
def adduser():
    return signup_controller.adduser()

@app.route('/verify_user', methods=['POST'])
def verify_user():
    return verify_user_controller.verify_user()

@app.route('/forgot', methods=['POST'])
def forgot():
    return fogot_controller.forgot()

@app.route('/send_feed', methods=['POST'])
def send_feed():
    return feedback_controller.update_feedback()

@app.route('/check_pass', methods=['POST'])
def check_pass():
    return check_pass_controller.check_pass1()

@app.route('/check_pass2', methods=['POST'])
def check_pass2():
    return check_pass_controller2.check_pass2()

@app.route('/get_images1', methods=['GET'])
def get_images():
    return image_controller.get_images()

@app.route('/get_imagesb1', methods=['GET'])
def get_imagesb1():
    return image_controller.get_imagesb1()


@app.route('/get_images2', methods=['GET'])
def get_images2():
    return image_controller.get_images2()



@app.route('/get_imagesb2', methods=['GET'])
def get_imagesb2():
    return image_controller.get_imagesb2()

@app.route('/get_grey', methods=['GET'])
def get_grey():
    return Grey_Controller.fetch_grey_materials()

@app.route('/updaterate', methods=['PUT'])
def updaterate():
    return Grey_Controller.update_rate()

@app.route('/get_all_feeds', methods=['GET'])
def get_all_feeds():
    return feedback_controller.getFeedbacks()

@app.route('/update_action', methods=['PUT'])
def update_action():
    return feedback_controller.update_action()

@app.route('/get_users', methods=['Get'])
def get_users():
    return Get_User_controller.getusers()

@app.route('/remove_users', methods=['PUT'])
def remove_users():
    return Get_User_controller.remove_users()


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
