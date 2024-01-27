import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_urls.dart';

import 'package:sampleapp/SignUp_Page.dart';

class SettingsPage extends StatefulWidget {
  final String username;
  const SettingsPage({super.key, required this.username});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkModeEnabled = false;
  bool isNotificationEnabled = true;
  final TextEditingController _prevpassword = TextEditingController();
  final TextEditingController _newpassword = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final TextEditingController _prevsecretpass = TextEditingController();
  final TextEditingController _newsecret = TextEditingController();
  bool _obscuretext = true;
  bool _obscuretext2 = true;
  bool _obscuretext3 = true;
  bool _obscuretext4 = true;

  String previousPassword = '';
  String newPassword = '';

  Future<void> checkpass() async {
    final String user = widget.username;
    final String pass = _prevpassword.text;
    final String newpass = _newpassword.text;

    // const String apiUrl = 'http://192.168.18.30:5000/check_pass';
    const String apiUrl = ApiUrls.checkpass1;

    final response = await http.post(
      Uri.parse(apiUrl),
      body: json
          .encode({'username': user, 'password': pass, 'newpassword': newpass}),
      headers: {'Content-Type': 'application/json'},
    );
    debugPrint('Response body: ${response.body}');

    if (response.statusCode == 200) {
      _prevpassword.text = '';
      _confirmpassword.text = '';
      _newpassword.text = '';

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Verification"),
            content:
                const Text("Password is verified and changed successfully"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        },
      );
    } else if (response.statusCode == 401) {
// ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Verification"),
            content: const Text("Current Password is not correct"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        },
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Something Bad happened"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        },
      );
    }
  }

  Future<void> checkpass2() async {
    final String user = widget.username;
    final String pass = _prevsecretpass.text;
    final String newsecret = _newsecret.text;
    //   const String apiUrl = 'http://192.168.18.30:5000/check_pass2';
    const String apiUrl = ApiUrls.checkpass2;
    final response = await http.post(
      Uri.parse(apiUrl),
      body: json
          .encode({'username': user, 'password': pass, 'newsecret': newsecret}),
      headers: {'Content-Type': 'application/json'},
    );
    debugPrint('Response body: ${response.body}');

    if (response.statusCode == 200) {
      _newsecret.text = '';
      _prevsecretpass.text = '';
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Verification"),
            content: const Text("Secret answer has been changed successfully"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        },
      );
    } else if (response.statusCode == 401) {
// ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Verification"),
            content: const Text("Current Password is not correct"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        },
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Something Bad happened"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        },
      );
    }
  }

  void checkvalid(String a, String b, String c) {
    if (a == '' || b == '' || c == '') {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Empty Fields"),
            content:
                const Text("Please fill in all the fields of Change Password"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        },
      );
    } else if (b.length < 8 || b.length > 16) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Password Invalid Length "),
            content: const Text(
                "Password must be at least 8 and maximum 16 characters long"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        },
      );
    } else if (b != c) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Passwords Not Matched"),
            content: const Text("Entered new and confirm password not matches"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        },
      );
    } else {
      checkpass();
    }
  }

  void checkvalid2() {
    if (_prevsecretpass.text.isEmpty || _newsecret.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Empty Fields"),
            content: const Text(
                "Please fill in all the fields of Change Secret Answer"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Ok"))
            ],
          );
        },
      );
    } else {
      checkpass2();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use the chosen theme
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 71, 194),
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'Images/setting_anim.gif', // Replace with your image path
                    fit: BoxFit.cover,
                  ),
                ),
                // const Positioned(
                //   top: 20.0,
                //   left: 20.0,
                //   child: Row(
                //     children: [
                //       Icon(Icons.settings, color: Colors.purple),
                //       SizedBox(width: 8.0),
                //       Text(
                //         'Settings',
                //         style: TextStyle(
                //           fontSize: 20.0,
                //           color: Colors.purple,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 60, 71, 194),
                      width: 4.9),
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color.fromARGB(255, 250, 248, 112),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      obscureText: _obscuretext,
                      inputFormatters: [NoSpaceInputFormatter()],
                      maxLength: 16,
                      controller: _prevpassword,
                      decoration: InputDecoration(
                        labelText: 'Current Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscuretext
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscuretext = !_obscuretext;
                            });
                          },
                        ),
                      ),
                    ),
                    TextFormField(
                      inputFormatters: [NoSpaceInputFormatter()],
                      maxLength: 16,
                      obscureText: _obscuretext2,
                      controller: _newpassword,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscuretext2
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscuretext2 = !_obscuretext2;
                            });
                          },
                        ),
                      ),
                    ),

                    TextFormField(
                      obscureText: _obscuretext3,
                      inputFormatters: [NoSpaceInputFormatter()],
                      maxLength: 16,
                      controller: _confirmpassword,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscuretext3
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscuretext3 = !_obscuretext3;
                            });
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 60, 71, 194)),
                      onPressed: () {
                        checkvalid(_prevpassword.text, _newpassword.text,
                            _confirmpassword.text);
                      },
                      child: const Text('Save Password'),
                    ),

                    const SizedBox(height: 40.0),

                    const Text(
                      "Change Secret Answer",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: _prevsecretpass,
                      obscureText: _obscuretext4,
                      inputFormatters: [NoSpaceInputFormatter()],
                      maxLength: 16,
                      decoration: InputDecoration(
                        labelText: 'Current Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscuretext4
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscuretext4 = !_obscuretext4;
                            });
                          },
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _newsecret,
                      inputFormatters: [NoSpaceInputFormatter()],
                      maxLength: 20,
                      decoration: const InputDecoration(
                        labelText:
                            'Secret Answer (What is your favorite place?)',
                      ),
                    ),

                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 60, 71, 194)),
                      onPressed: () {
                        checkvalid2();
                      },
                      child: const Text('Save Secret Answer'),
                    ),

                    // const Text(
                    //   'Notification',
                    //   style: TextStyle(
                    // fontSize: 18.0,
                    // fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     const Text('Enable Notifications'),
                    //     Switch(
                    //       value: isNotificationEnabled,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           isNotificationEnabled = value;
                    //         });
                    //         // Implement notification toggle logic here
                    //       },
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
