import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sampleapp/Settings.dart';
import 'package:sampleapp/api_urls.dart';
// import 'package:sampleapp/Profile.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: FeedbackPage(),
//     );
//   }
// }

class FeedbackPage extends StatefulWidget {
  final String user;

  FeedbackPage({super.key, required this.user});

  @override
  // ignore: library_private_types_in_public_api
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  //double _rating = 0.0;
  final TextEditingController _Feedback_Text = TextEditingController();
  // Initial rating value

  void validfeed() {
    if (_Feedback_Text.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Empty field"),
            content: const Text("Please fill in the Feedback field"),
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
    } else if (_Feedback_Text.text.length > 100) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Exceeding Limit"),
            content: const Text("Maximum allowed characters are 100"),
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
    } else if (containsOnlySpaces(_Feedback_Text.text)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Empty"),
            content: const Text("Feedback field is Empty"),
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
      sendfeed();
    }
  }

  Future<void> sendfeed() async {
    String username = widget.user;
    String feed = _Feedback_Text.text;

    //const String apiUrl = 'http://10.0.2.2:5000/send_feed';
    const String apiUrl = ApiUrls.sendfeed;

    final response = await http.post(
      Uri.parse(apiUrl),
      body: json.encode({'username': username, 'feedback': feed}),
      headers: {'Content-Type': 'application/json'},
    );
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      _Feedback_Text.text = '';
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Successful"),
            content: const Text("Feedback sent successfully"),
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
            content: const Text("Sorry! Something bad happened"),
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

  bool containsOnlySpaces(String text) {
    return text.trim().isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 71, 194),
        title: const Text("Feedback"),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(
              Icons.menu,
              color: Colors.white, // Change the icon color
              size: 32, // Change the icon size
            ),
            onSelected: (value) {
              // Navigate to different screens based on the selected option
              if (value == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(
                      username: widget.user,
                    ),
                  ),
                );
              } else if (value == 3) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Confirm Exit'),
                        content: const Text('Are you sure you want to Logout'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false); // Cancel logout
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(context, '/logout');
                              // Perform logout actions here
                            },
                            child: const Text('Logout'),
                          ),
                        ],
                      );
                    });
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                child: ListTile(
                  leading: const Icon(
                    Icons.account_circle, // Customize the leading icon
                    color: Colors.blue, // Change the icon color
                  ),
                  title: Text(
                    widget.user,
                    style: const TextStyle(
                      fontSize: 24, // Change the font size
                      color: Colors.black, // Change the text color
                    ),
                  ),
                ),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: ListTile(
                  leading: Icon(
                    Icons.settings, // Customize the leading icon
                    color: Colors.green, // Change the icon color
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 18, // Change the font size
                      color: Colors.black, // Change the text color
                    ),
                  ),
                ),
              ),
              const PopupMenuItem<int>(
                value: 3,
                child: ListTile(
                  leading: Icon(
                    Icons.logout, // Customize the leading icon
                    color: Colors.red, // Change the icon color
                  ),
                  title: Text(
                    'Log out',
                    style: TextStyle(
                      fontSize: 18, // Change the font size
                      color: Colors.black, // Change the text color
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 213, 213),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                // const Text(
                //   'Rate Us!',
                //   style: TextStyle(
                //     fontSize: 24.0,
                //     fontWeight: FontWeight.bold,
                //     color: Color.fromARGB(255, 0, 0, 0),
                //   ),
                // ),
                // const SizedBox(height: 16.0),
                // RatingBar.builder(
                //   initialRating: _rating,
                //   minRating: 1,
                //   direction: Axis.horizontal,
                //   allowHalfRating: false,
                //   itemCount: 5,
                //   itemSize: 40.0,
                //   itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                //   itemBuilder: (context, _) => const Icon(
                //     Icons.star,
                //     color: Color.fromARGB(255, 3, 3, 2),
                //   ),
                //   onRatingUpdate: (rating) {
                //     setState(() {
                //       _rating = rating;
                //     });
                //   },
                // ),
                // const SizedBox(height: 26.0),
                const Text(
                  'Please share your thoughts with us:',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _Feedback_Text,
                  maxLength: 180,
                  decoration: const InputDecoration(
                    labelText: 'Feedback',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Maximum allowed characters are 180',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 60, 71, 194))),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (containsOnlySpaces(value!)) {
                      return 'Text field cannot contain only spaces';
                    }
                    return null; // Return null to indicate valid input
                  },
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    validfeed();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 60, 71, 194),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100.0, vertical: 10.0),
                  ),
                  child: const SizedBox(
                    width: 350,
                    child: Text(
                      'Submit Feedback',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
