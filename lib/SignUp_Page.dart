// ignore: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sampleapp/First_Screen.dart';
import 'package:http/http.dart' as http;
import 'package:sampleapp/api_urls.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _secretans = TextEditingController();
  bool _obscureText = true;

  String? checkemail, checkpass;

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

  Future<void> signup() async {
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    final String emailaddr = _emailController.text;
    final String secret = _secretans.text.toLowerCase();

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
        'secret': secret
      }),
      headers: {'Content-Type': 'application/json'},
    );
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FirstScreen()));

        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("User Registered Successfully"),
            ),
          );
        });
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
                    controller: _secretans,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(
                          '[a-zA-Z]+')), // Only allow alphabetic characters
                    ],
                    maxLength: 20,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Please! remember your secret answer',
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
                                _secretans.text.isNotEmpty &&
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
