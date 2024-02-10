import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sampleapp/Colors.dart';
import 'package:sampleapp/Settings.dart';
import 'package:sampleapp/api_urls.dart'; // Import ApiUrls class
import 'package:http/http.dart' as http;

class UserFeedbacks extends StatefulWidget {
  final String user;
  const UserFeedbacks({Key? key, required this.user}) : super(key: key);

  @override
  State<UserFeedbacks> createState() => _UserFeedbacksState();
}

class _UserFeedbacksState extends State<UserFeedbacks> {
  List<UserFeedback> userFeedbacks = [];
  int totalFeedbacks = 0;
  List<UserFeedback> displayedFeedbacks = [];

  @override
  void initState() {
    super.initState();
    fetchFeedbacksFromDatabase(); // Fetch feedbacks from the database
  }

  Future<void> fetchFeedbacksFromDatabase() async {
    const String apiUrl = ApiUrls.getfeeds;
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(json.decode(response.body));
        // debugPrint("RESPONSE BODY = ${response.body}");

        setState(() {
          userFeedbacks =
              data.map((data) => UserFeedback.fromMap(data)).toList();
          totalFeedbacks = userFeedbacks.length;
          displayedFeedbacks = List.from(userFeedbacks);
        });
      } else {
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Feedbacks - Total: $totalFeedbacks"),
        backgroundColor: AppColors.AdminAppBar,
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 32,
            ),
            onSelected: (value) {
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
                              Navigator.of(context).pop(false);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.popAndPushNamed(context, '/logout');
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
                    Icons.account_circle,
                    color: Colors.blue,
                  ),
                  title: Text(
                    widget.user,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.green,
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const PopupMenuItem<int>(
                value: 3,
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Log out',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterFeedbacks(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedFeedbacks.length,
              itemBuilder: (context, index) {
                UserFeedback feedback = displayedFeedbacks[index];
                return ListTile(
                  title: Text(
                    feedback.username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20, // Adjust the font size as needed
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(feedback.email),
                      const SizedBox(height: 4), // Added SizedBox for spacing
                      Text(
                        'Feedback: ${feedback.feedback}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4), // Added SizedBox for spacing
                      Text(
                        'Date: ${feedback.dateTime}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 14), // Added SizedBox for spacing
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      showActionDialog(feedback);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        feedback.action == "Done"
                            ? AppColors.UserAppBar
                            : AppColors.AdminAppBar,
                      ),
                      // Adjust the minimum size of the button
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(
                            100, 40), // Adjust the width and height as needed
                      ),
                      // Add more button styling properties as needed
                    ),
                    child: Text(
                      feedback.action == "Pending" ? 'Pending' : 'Done',
                      style: const TextStyle(
                        fontSize: 16, // Adjust the font size as needed
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void filterFeedbacks(String query) {
    setState(() {
      displayedFeedbacks = userFeedbacks
          .where((feedback) =>
              feedback.username.toLowerCase().contains(query.toLowerCase()) ||
              feedback.email.toLowerCase().contains(query.toLowerCase()) ||
              feedback.feedback.toLowerCase().contains(query.toLowerCase()) ||
              feedback.dateTime.toLowerCase().contains(query.toLowerCase()) ||
              (feedback.action == "Pending" ? 'pending' : 'done')
                  .contains(query.toLowerCase()))
          .toList();

      totalFeedbacks = displayedFeedbacks.length;
    });
  }

  void showActionDialog(UserFeedback feedback) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Action Confirmation'),
          content: Text(
              'Are you sure you want to Switch to ${feedback.action == "Pending" ? 'Done' : 'Pending'} this feedback?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                updateActionColumn(feedback);
                Navigator.of(context).pop();
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  Future<void> updateActionColumn(UserFeedback feedback) async {
    try {
      String updated;
      if (feedback.action == "Pending") {
        updated = "Done";
      } else {
        updated = "Pending";
      }
      const String apiUrl = ApiUrls.updatefeedaction;
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "action": updated,
          "feedback_id": feedback.feedId,
        }),
      );
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Successfull'),
                content: Text('Action is Updated to $updated'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      fetchFeedbacksFromDatabase();
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      } else {
        debugPrint('Failed to update Action: ${response.statusCode}');

        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Failure'),
                content: const Text('Failed to Update Action'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      }
    } catch (e) {
      debugPrint('Error UPdating Action: $e');
    }
  }
}

class UserFeedback {
  final String feedId;
  final String username;
  final String email;
  final String feedback;
  final String dateTime;
  String action;

  UserFeedback({
    required this.feedId,
    required this.username,
    required this.email,
    required this.feedback,
    required this.dateTime,
    required this.action,
  });
  factory UserFeedback.fromMap(Map<String, dynamic> map) {
    return UserFeedback(
      feedId: map["FEEDBACK_ID"].toString(),
      username: map['USERNAME'],
      email: map['EMAIL_ADDRESS'],
      feedback: map['detail'],
      dateTime: map['date_time'],
      action: map['Action'],
    );
  }
}
