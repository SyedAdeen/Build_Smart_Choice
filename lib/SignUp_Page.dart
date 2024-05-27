// ignore: file_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sampleapp/First_Screen.dart';
import 'package:http/http.dart' as http;
import 'package:sampleapp/api_urls.dart';
import 'package:email_otp/email_otp.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  EmailOTP myAuth = EmailOTP();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _SECRET_ANSWERans = TextEditingController();
  // late EmailAuth emailAuth;
  bool _obscureText = true;

  String? checkemail, checkpass;

  late Timer _timer;
  int _start = 60;
  bool _timerRunning = true;
  bool _submitEnabled = true;

  String? _validatePassword(String? value) {
    if (value == null ||
        value.isEmpty ||
        (value.length < 8 || value.length > 16)) {
      setState(() {
        value = "";
      });

      return 'Password must be at least 8 characters long \n and less than 17 characters ';
    }
    return '';
  }

  String? _validateEmail(String? value) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    if (value == null || !emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  bool _allFieldsFilled = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool _areAllFieldsValid() {
    return _formKey.currentState!.validate();
  }

  // void showOtpDialog(BuildContext context) async {
  //   int remainingTime = 60;
  //   TextEditingController _otpController = TextEditingController();

  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(
  //         builder: (context, setState) {
  //           return AlertDialog(
  //             title: const Text('Enter OTP'),
  //             content: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 TextField(
  //                   controller: _otpController,
  //                   keyboardType: TextInputType.number,
  //                   maxLength: 6,
  //                   decoration: const InputDecoration(
  //                     labelText: 'OTP',
  //                     hintText: 'Enter OTP',
  //                   ),
  //                 ),
  //                 SizedBox(height: 20),
  //                 Text('Timer Started of : $remainingTime seconds'),
  //               ],
  //             ),
  //             actions: [
  //               ElevatedButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop(); // Close the dialog
  //                 },
  //                 child: Text('Cancel'),
  //               ),
  //               ElevatedButton(
  //                 onPressed: () async {
  //                   verifyOTP();
  //                 },
  //                 child: const Text("Verify"),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     },
  //   );

  //   // Countdown Timer
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     remainingTime -= 1;
  //     if (remainingTime <= 0) {
  //       timer.cancel();
  //       Navigator.of(context).pop(); // Close the dialog after 60 seconds
  //     } else {
  //       // Update the dialog with the remaining time
  //       (context as Element).markNeedsBuild();
  //     }
  //   });
  // }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        _timerRunning = false; // Stop the timer
        _timer.cancel(); // Cancel the timer
        setState(() {
          _submitEnabled = false; // Disable the Submit Button
        });
      } else {
        setState(() {
          _start--; // Decrement the timer
        });
      }
    });
  }

  void _sendVerificationCode() {
    setState(() {
      _start = 60; // Reset the timer to 60 seconds
      _timerRunning = true; // Start the timer
      _submitEnabled = true; // Enable the Submit Button
    });
    startTimer(); // Start the countdown
  }

  // void resendOTP() {
  //   _timer.cancel(); // Cancel the current timer
  //   _sendVerificationCode(); // Reset timer and resend OTP
  // }

  void cancelVerification() {
    _timer.cancel();
    setState(() {
      _timerRunning = false;
      _submitEnabled = true;
    });
    Navigator.of(context).pop(); // Close the dialog
  }

  void showOTPDialogue(BuildContext context) async {
    _sendVerificationCode(); // Start the timer when showing the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'OTP Verification',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Verification Code sent to ${_emailController.text}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      decoration: const InputDecoration(
                        labelText: 'Enter OTP',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _timerRunning
                            ? Text(
                                "Resend OTP in $_start seconds",
                                style: TextStyle(color: Colors.grey[700]),
                              )
                            : Container(),
                        ElevatedButton(
                          onPressed: _timerRunning ? null : () => resendOTP(),
                          child: Opacity(
                            opacity: _timerRunning ? 0.5 : 1.0,
                            child: Text(
                              'Resend OTP',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _submitEnabled
                              ? () async {
                                  await verifyOTP(context);
                                }
                              : null,
                          child: Text(
                            'Submit OTP',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary:
                                _submitEnabled ? Colors.green : Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        ElevatedButton(
                          onPressed: () => cancelVerification(),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void showOtpDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('OTP Sent to ${_emailController.text}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: const InputDecoration(
                  labelText: 'OTP',
                  hintText: 'Enter OTP',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
                onPressed: () async {
                  verifyOTP(context);
                },
                child: const Text("Verify")),
            ElevatedButton(
                onPressed: () async {
                  resendOTP();
                },
                child: const Text("Resend")),
          ],
        );
      },
    );
  }

  // void sendOTP() async {
  //   emailAuth = EmailAuth(sessionName: "Email Verification");
  //   var res = await emailAuth.sendOtp(recipientMail: _emailController.text);
  //   debugPrint(res as String?);
  //   if (res) {
  //     debugPrint("OTP Send");
  //   } else {
  //     debugPrint("Unable to send OTP");
  //   }
  // }

  // void verifyOTP() {
  //   var res = emailAuth.validateOtp(
  //       recipientMail: _emailController.value.text,
  //       userOtp: _otpController.value.text);
  //   if (res) {
  //     debugPrint("OTP Verified");
  //   } else {
  //     debugPrint("OTP Not verified");
  //   }
  // }

  Future<void> sendOTP() async {
    myAuth.setConfig(
      appEmail: "adeenashraf@gmail.com",
      appName: "Build Smart Choice",
      userEmail: _emailController.text,
      otpLength: 6,
      otpType: OTPType.digitsOnly,
    );

    try {
      await myAuth.sendOTP();
      debugPrint('OTP Sent Successfully to ${_emailController.text}');
    } catch (e) {
      debugPrint('Failed to send OTP. Error: $e');
    }
  }

  Future<void> verifyOTP(BuildContext context) async {
    if (await myAuth.verifyOTP(otp: _otpController.text)) {
      Navigator.of(context).pop(); // Close the dialog
      _otpController.clear();
      addUser();
    } else {
      // ignore: use_build_context_synchronously
      FocusScope.of(context).unfocus();

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Invalid OTP'),
            content: const Text('Please enter a valid OTP.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the alert dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  // Future<void> verifyOTP() async {
  //   if (await myAuth.verifyOTP(otp: _otpController.text) == true) {
  //     // ignore: use_build_context_synchronously
  //     Navigator.of(context).pop(); // Close the dialog

  //     _otpController.clear();
  //     addUser();
  //   } else {
  //     FocusScope.of(context).unfocus();

  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("Invalid OTP"),
  //     ));
  //   }
  // }

  void verifyEmail() {
    sendOTP();
    showOtpDialog(context);
  }

  void resendOTP() {
    Navigator.of(context).pop(); // Close the dialog
    verifyEmail();
    FocusScope.of(context).unfocus();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('RESEND OTP'),
          content: const Text('OTP is sent.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> addUser() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    final String emailaddr = _emailController.text;
    final String SECRET_ANSWER = _SECRET_ANSWERans.text.toLowerCase();

    // const String apiUrl = 'http://192.168.18.30:5000/signup';
    const String apiUrl = ApiUrls.adduser;
    // const String apiUrl =
    //     'http://127.0.0.1:5000/signup'; // Replace with your API endpoint

    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode({
        'username': username,
        'password': password,
        'emailaddr': emailaddr,
        'SECRET_ANSWER': SECRET_ANSWER
      }),
      headers: {'Content-Type': 'application/json'},
    );
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FirstScreen()));

        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("User Registered Successfully"),
            ),
          );
        });
      });
    } else {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error"),
          ),
        );
      });
    }
  }

  Future<void> signup() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    final String emailaddr = _emailController.text;
    final String SECRET_ANSWER = _SECRET_ANSWERans.text.toLowerCase();

    // const String apiUrl = 'http://192.168.18.30:5000/signup';
    const String apiUrl = ApiUrls.signup;
    // const String apiUrl =
    //     'http://127.0.0.1:5000/signup'; // Replace with your API endpoint

    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode({
        'username': username,
        'password': password,
        'emailaddr': emailaddr,
        'SECRET_ANSWER': SECRET_ANSWER
      }),
      headers: {'Content-Type': 'application/json'},
    );
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      setState(() {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FirstScreen()));

        setState(() {
          verifyEmail();
        });
      });
    } else if (response.statusCode == 408) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text("Email Address already used, please change Email Address"),
          ),
        );
      });
    } else if (response.statusCode == 409) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Username already exist, please change username"),
          ),
        );
      });
    } else {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Error"),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 60, 71, 194),
          title: const Text('Register Yourself'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 5.0),
                  const Text(
                    ' Enter Username  ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    maxLength: 20,
                    inputFormatters: [NoSpaceInputFormatter()],
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(39),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    ' Set your password  ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  TextFormField(
                    maxLength: 16,
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Atleast 8 characters long ',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText =
                                !_obscureText; // Toggle password visibility
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(39),
                      ),
                    ),
                    inputFormatters: [NoSpaceInputFormatter()],
                    validator: _validatePassword,
                    onChanged: (value) => setState(() {
                      checkpass = _validatePassword(value);
                    }),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    ' Enter your Email address  ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: _emailController,
                    inputFormatters: [NoSpaceInputFormatter()],
                    decoration: InputDecoration(
                      labelText: 'xyz@example.com ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(39),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                    onChanged: (value) => setState(() {
                      checkemail = _validateEmail(value);
                    }),
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    ' Enter Secret Answer  ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: _SECRET_ANSWERans,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          '[a-zA-Z]+')), // Only allow alphabetic characters
                    ],
                    maxLength: 20,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Please! remember your Secret Answer',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(39),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _allFieldsFilled =
                            _usernameController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty &&
                                _emailController.text.isNotEmpty &&
                                _SECRET_ANSWERans.text.isNotEmpty &&
                                checkemail == null &&
                                checkpass == '';
                      });

                      if (_allFieldsFilled || _areAllFieldsValid()) {
                        print('Username: ${_usernameController.text}');
                        print('Password: ${_passwordController.text}');
                        print('Email Address: ${_emailController.text}');
                        signup();
                      } else {
                        // Display an error message or prevent navigation
                        print('Please fill out all required fields.');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: const Color.fromARGB(255, 60, 71, 194),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 140.0, vertical: 10.0),
                    ),
                    child: const SizedBox(
                      width: 350,
                      child: Text(
                        'Sign Up ',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  if (!_allFieldsFilled)
                    const Text(
                      'Please fill out all fields.',
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}

class NoSpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove spaces from the input value
    final newText = newValue.text.replaceAll(' ', '');

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
