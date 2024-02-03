import 'package:flutter/material.dart';
import 'package:sampleapp/Colors.dart';
import 'package:sampleapp/Settings.dart';

class UserFeedbacks extends StatefulWidget {
  final String user;
  const UserFeedbacks({Key? key, required this.user}) : super(key: key);

  @override
  State<UserFeedbacks> createState() => _UserFeedbacksState();
}

class _UserFeedbacksState extends State<UserFeedbacks> {
  List<UserFeedback> userFeedbacks = [
    UserFeedback(
        username: 'User1', email: 'user1@example.com', feedback: 'Great app!'),
    UserFeedback(
        username: 'User2',
        email: 'user2@example.com',
        feedback: 'Awesome experience!'),
    // Add more feedbacks as needed
  ];
  int totalFeedbacks = 0;
  List<UserFeedback> displayedFeedbacks = [];

  @override
  void initState() {
    super.initState();
    totalFeedbacks = userFeedbacks.length;
    displayedFeedbacks = List.from(userFeedbacks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Feedbacks - Total: $totalFeedbacks"),
        backgroundColor: AppColors.AdminAppBar,
        actions: [
          // ... Your existing PopupMenuButton code ...
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
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedFeedbacks.length,
              itemBuilder: (context, index) {
                UserFeedback feedback = displayedFeedbacks[index];
                return ListTile(
                  title: Text(feedback.username),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(feedback.email),
                      Text(feedback.feedback),
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      showActionDialog(feedback);
                    },
                    child: Text(feedback.action ? 'Pending' : 'Done'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // void filterFeedbacks(String query) {
  //   setState(() {
  //     displayedFeedbacks = userFeedbacks
  //         .where((feedback) =>
  //             feedback.username.toLowerCase().contains(query.toLowerCase()) ||
  //             feedback.email.toLowerCase().contains(query.toLowerCase()) ||
  //             feedback.feedback.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   });
  // }

  void filterFeedbacks(String query) {
    setState(() {
      displayedFeedbacks = userFeedbacks
          .where((feedback) =>
              feedback.username.toLowerCase().contains(query.toLowerCase()) ||
              feedback.email.toLowerCase().contains(query.toLowerCase()) ||
              feedback.feedback.toLowerCase().contains(query.toLowerCase()) ||
              (feedback.action ? 'pending' : 'done')
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
              'Are you sure you want to ${feedback.action ? 'deactivate' : 'activate'} this feedback?'),
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

  void updateActionColumn(UserFeedback feedback) {
    setState(() {
      feedback.action = !feedback.action;
      // Add your logic for updating the action column here
    });
  }
}

class UserFeedback {
  final String username;
  final String email;
  final String feedback;
  bool action;

  UserFeedback(
      {required this.username,
      required this.email,
      required this.feedback,
      this.action = true});
}
