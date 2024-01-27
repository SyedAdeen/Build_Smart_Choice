// ignore: file_names

//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:sampleapp/SignUp_Page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

import 'package:sampleapp/home.dart';
import 'api_urls.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _changepasswordController =
      TextEditingController();
  bool _obscureText = true;
  bool check = true;
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  bool _isUsernameEmpty = true;

  final TextEditingController _secretansController = TextEditingController();
  bool _showError = false;

  securescreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

  @override
  void initState() {
    super.initState();
    securescreen();
  }

  String capitalizeWords(String inputStr) {
    List<String> words = inputStr.split(' ');
    List<String> capitalizedWords = [];

    for (String word in words) {
      if (word.isNotEmpty) {
        capitalizedWords.add(
          word[0].toUpperCase() + word.substring(1).toLowerCase(),
        );
      }
    }

    return capitalizedWords.join(' ');
  }

  void _validatePassword(String? value) {
    if (value == null ||
        value.isEmpty ||
        (value.length < 8 || value.length > 16)) {
      _focusNode2.unfocus;
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text("Password must be 8 characters to 16 characters long"),
          ),
        );
      });
    } else {
      _forgot();
    }
  }

  void _validateAndSignIn() {
    setState(() {
      _showError =
          _usernameController.text.isEmpty || _passwordController.text.isEmpty;
    });

    if (!_showError) {
      _login();
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Please fill in all the fields."),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  void _forgotPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Forgot Password"),
          content: Container(
            width: 700,
            height: 120,
            margin: const EdgeInsets.only(bottom: 1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _secretansController,
                    inputFormatters: [NoSpaceInputFormatter()],

                    // onChanged: (text) {
                    //   // When text is changed, check if it's empty
                    //   setState(
                    //       () {}); // Trigger a rebuild to show/hide the error message
                    // },
                    focusNode: _focusNode,

                    decoration: const InputDecoration(
                      labelText: "Your Secret Answer?",
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 60, 71, 194))),
              onPressed: () {
                if (_secretansController.text == '') {
                  _focusNode.unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Fill the field."),
                    ),
                  );
                } else {
                  _focusNode.unfocus();

                  // Implement password reset logic
                  Navigator.of(context).pop();

                  verify_user(); // Close the current dialog
                }
              },
              child: const Text("Submit"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _secretansController.text = '';
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Color.fromARGB(255, 60, 71, 194)),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _login() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    const String apiUrl = ApiUrls.login;

    // const String apiUrl =
    //     'http://127.0.0.1:5000/login'; // Replace with your API endpoint

    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode({'username': username, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    debugPrint('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final String loggedInUsername = data['username'];
      String result = capitalizeWords(loggedInUsername);

      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                      username: result,
                    )));
      });
    } else {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid Username or password"),
          ),
        );
      });
    }
  }

  Future<void> _forgot() async {
    final String username = _usernameController.text;
    final String password = _changepasswordController.text;
    final String secret = _secretansController.text;

    // const String apiUrl = 'http://192.168.18.30:5000/forgot';

    const String apiUrl = ApiUrls.forgot;

    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode(
          {'username': username, 'password': password, 'secret': secret}),
      headers: {'Content-Type': 'application/json'},
    );
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password Changed Successfully"),
          ),
        );
        Navigator.of(context).pop();
        _secretansController.text = '';
        _changepasswordController.text = '';
      });
    } else if (response.statusCode == 401) {
      setState(() {
        _usernameController.text = '';
        _changepasswordController.text = '';
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid Username or Secret Answer"),
          ),
        );
      });
    } else {
      setState(() {
        _usernameController.text = '';
        _changepasswordController.text = '';
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Something bad happened"),
          ),
        );
      });
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> verify_user() async {
    final String username = _usernameController.text;
    final String secret = _secretansController.text;

    //const String apiUrl = 'http://192.168.18.30:5000/verify_user';

    const String apiUrl = ApiUrls.verifyuser;

    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode({'username': username, 'secret': secret}),
      headers: {'Content-Type': 'application/json'},
    );
    debugPrint('Response body: ${response.body}');

    if (response.statusCode == 200) {
      // Show the password change dialog
      // ignore: use_build_context_synchronously
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Change Password"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _changepasswordController,
                    inputFormatters: [NoSpaceInputFormatter()],
                    maxLength: 16,
                    focusNode: _focusNode2,
                    decoration: const InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  final String newPassword = _changepasswordController.text;
                  _focusNode2.unfocus();

                  _validatePassword(newPassword);
                  // Implement password change logic
                },
                child: const Text("Save"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _secretansController.text = '';
                  _changepasswordController.text = '';
                },
                child: const Text("Cancel"),
              ),
            ],
          );
        },
      );
    } else if (response.statusCode == 401) {
      _focusNode.unfocus();
      _secretansController.text = '';

      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid Username or Secret Answer"),
          ),
        );
      });
    } else {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Something bad happened"),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Images/back30.png'),

              opacity: 0.47, // Replace with your image file path
              fit: BoxFit.fill, // You can adjust this property as needed
            ),
          ),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 0),
                      // width: 220,
                      //height: 220,
                      // decoration: BoxDecoration(
                      //     shape: BoxShape.circle,
                      //     border: Border.all(color: Colors.black, width: 1.3),
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: const Color.fromARGB(255, 11, 9, 9)
                      //             .withOpacity(0.4), // Shadow color
                      //         spreadRadius: 5, // Spread radius
                      //         blurRadius: 5, // Blur radius
                      //         offset: const Offset(
                      //           4,
                      //           -1,
                      //         ), // Offset
                      //       ),
                      //     ],
                      //     color: const Color.fromARGB(255, 255, 213, 213)
                      //     // gradient: LinearGradient(
                      //     //   colors: [
                      //     //     Color.fromARGB(255, 255, 236, 236).withOpacity(1),
                      //     //     Color.fromARGB(255, 249, 150, 150).withOpacity(1)
                      //     //   ],
                      //     // ),
                      //     ),
                      child: Center(
                        child: Image.asset(
                          'Images/logo.png',
                          width: 220,
                          height: 220,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Text(
                        "Build Smart Choice",
                        style: GoogleFonts.itim(
                            fontSize: 36,
                            color: const Color.fromARGB(255, 60, 71, 194),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _showError
                        ? const Text(
                            "Please fill in all the fields.",
                            style: TextStyle(color: Colors.red),
                          )
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: _usernameController,
                        inputFormatters: [NoSpaceInputFormatter()],
                        onChanged: (value) => setState(() {
                          _isUsernameEmpty = value.isEmpty;
                        }),
                        decoration: const InputDecoration(
                            labelText: "Username",
                            contentPadding: EdgeInsets.only(bottom: 1)),
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 0.11111),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextField(
                          obscureText: _obscureText,
                          inputFormatters: [NoSpaceInputFormatter()],
                          controller: _passwordController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(bottom: 1),
                            labelText: "Password",
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
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Visibility(
                        visible: !_isUsernameEmpty,
                        child: Container(
                          margin: const EdgeInsets.only(right: 15, bottom: 15),
                          child: TextButton(
                            onPressed:
                                _forgotPassword, // Call _forgotPassword when pressed
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: 200,
                      child: ElevatedButton(
                        onPressed: _validateAndSignIn,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 60, 71, 194))),
                        child: const Text("Sign In"),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                      child: const Text(
                        "Register Yourself",
                        style: TextStyle(
                          color: Color.fromARGB(255, 60, 71, 194),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        // Show a logout confirmation dialog
        bool logoutConfirmed = await showLogoutConfirmationDialog(context);

        // Return true to allow the back button press if the user confirms logout
        return logoutConfirmed;
      },
    );
  }

  Future<bool> showLogoutConfirmationDialog(BuildContext context) async {
    bool? logoutConfirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Exit'),
          content: const Text('Are you sure you want to exit the application?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel logout
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
                // Perform logout actions here
              },
              child: const Text('Exit'),
            ),
          ],
        );
      },
    );

    return logoutConfirmed ??
        false; // Default to false if logoutConfirmed is null
  }
}
