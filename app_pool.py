from flask import Flask
from flask_cors import CORS
from controller import CheckPassController, CheckPassController2, FeedbackController, ForgotController, ImageController, LoginController, SignupController, VerifyUserController
from mysql.connector import pooling

app = Flask(__name__)
CORS(app)

poolname = "mysqlpool1"
poolsize=1

db_config = {
    "host": "127.0.0.1",
    "user": "root",
    "password": "admin",
    "database": "db_bsc",
}


login_controller = LoginController(db_config,)
signup_controller = SignupController(db_config)
verify_user_controller = VerifyUserController(db_config)
fogot_controller = ForgotController(db_config)
feedback_controller = FeedbackController(db_config)
check_pass_controller = CheckPassController(db_config)
check_pass_controller2 = CheckPassController2(db_config)
image_controller=ImageController(db_config)


@app.route('/login', methods=['POST'])
def login():
    return login_controller.login(poolname, poolsize)

@app.route('/signup', methods=['POST'])
def signup():
    return signup_controller.signup(poolname,poolsize)

@app.route('/verify_user', methods=['POST'])
def verify_user():
    return verify_user_controller.verify_user(poolname,poolsize)

@app.route('/forgot', methods=['POST'])
def forgot():
    return fogot_controller.forgot(poolname,poolsize)

@app.route('/send_feed', methods=['POST'])
def send_feed():
    return feedback_controller.update_feedback(poolname,poolsize)

@app.route('/check_pass', methods=['POST'])
def check_pass():
    return check_pass_controller.check_pass1(poolname,poolsize)

@app.route('/check_pass2', methods=['POST'])
def check_pass2():
    return check_pass_controller2.check_pass2(poolname,poolsize)

@app.route('/get_images1', methods=['GET'])
def get_images():
    return image_controller.get_images(poolname,poolsize)

@app.route('/get_imagesb1', methods=['GET'])
def get_imagesb1():
    return image_controller.get_imagesb1()


@app.route('/get_images2', methods=['GET'])
def get_images2():
    return image_controller.get_images2()



@app.route('/get_imagesb2', methods=['GET'])
def get_imagesb2():
    return image_controller.get_imagesb2()


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)