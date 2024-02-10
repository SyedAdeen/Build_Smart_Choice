// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:sampleapp/Colors.dart';
// import 'package:sampleapp/Settings.dart';
// import 'package:sampleapp/api_urls.dart';
// import 'package:http/http.dart' as http;

// class UsersData extends StatefulWidget {
//   final String user;
//   const UsersData({Key? key, required this.user}) : super(key: key);

//   @override
//   State<UsersData> createState() => _UsersDataState();
// }

// class _UsersDataState extends State<UsersData> {
//   List<UserData> userDataList = []; // List to store fetched user data
//   int totalUsers = 0; // Variable to store total number of users
//   List<UserData> displayedUsers = []; // List to store displayed user data
//   String searchQuery = ''; // Variable to store search query

//   @override
//   void initState() {
//     super.initState();
//     fetchData(); // Fetch data when the screen loads
//   }

//   Future<void> removeUser(UserData user) async {
//     const String apiUrl = ApiUrls.deluser;

//     try {
//       final response = await http.put(
//         Uri.parse(apiUrl),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           "username": user.username,
//         }),
//       );

//       if (response.statusCode == 200) {
//         // ignore: use_build_context_synchronously
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: const Text('Successful'),
//               content: Text('User ${user.username} has been removed'),
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     fetchData();
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text('OK'),
//                 ),
//               ],
//             );
//           },
//         );
//       } else {
//         debugPrint('Failed to remove user: ${response.statusCode}');

//         // ignore: use_build_context_synchronously
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: const Text('Failure'),
//               content: const Text('Failed to remove user'),
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text('OK'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     } catch (e) {
//       debugPrint('Error removing user: $e');
//     }
//   }

//   Future<void> fetchData() async {
//     const String apiUrl = ApiUrls.fetchusers;
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//       if (response.statusCode == 200) {
//         final List<Map<String, dynamic>> data =
//             List<Map<String, dynamic>>.from(json.decode(response.body));
//         debugPrint("RESPONSE BODY = ${response.body}");

//         setState(() {
//           userDataList = data.map((data) => UserData.fromMap(data)).toList();
//           totalUsers = userDataList.length;
//           displayedUsers = List.from(userDataList);
//         });
//       } else {
//         debugPrint('Failed to fetch data: ${response.statusCode}');
//       }
//     } catch (e) {
//       debugPrint('Error fetching data: $e');
//     }
//     // Simulated function to fetch data from the database
//     // Replace this with your actual database fetching logic
//     // For now, I'm just generating dummy data
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('App Users - Total: $totalUsers'),
//         backgroundColor: AppColors.AdminAppBar,
//         actions: [
//           PopupMenuButton<int>(
//             icon: const Icon(
//               Icons.menu,
//               color: Colors.white,
//               size: 32,
//             ),
//             onSelected: (value) {
//               if (value == 2) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SettingsPage(
//                       username: widget.user,
//                     ),
//                   ),
//                 );
//               } else if (value == 3) {
//                 showDialog(
//                     context: context,
//                     builder: (context) {
//                       return AlertDialog(
//                         title: const Text('Confirm Exit'),
//                         content: const Text('Are you sure you want to Logout'),
//                         actions: <Widget>[
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop(false);
//                             },
//                             child: const Text('Cancel'),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.popAndPushNamed(context, '/logout');
//                             },
//                             child: const Text('Logout'),
//                           ),
//                         ],
//                       );
//                     });
//               }
//             },
//             itemBuilder: (context) => [
//               PopupMenuItem<int>(
//                 child: ListTile(
//                   leading: const Icon(
//                     Icons.account_circle,
//                     color: Colors.blue,
//                   ),
//                   title: Text(
//                     widget.user,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//               const PopupMenuItem<int>(
//                 value: 2,
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.settings,
//                     color: Colors.green,
//                   ),
//                   title: Text(
//                     'Settings',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//               const PopupMenuItem<int>(
//                 value: 3,
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.logout,
//                     color: Colors.red,
//                   ),
//                   title: Text(
//                     'Log out',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: (value) {
//                 // Update search query and filter displayed users
//                 setState(() {
//                   searchQuery = value.toLowerCase();
//                   filterUsers();
//                 });
//               },
//               decoration: const InputDecoration(
//                 hintText: 'Search by Username or Email',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Expanded(
//               child: ListView.builder(
//             itemCount: displayedUsers.length,
//             itemBuilder: (context, index) {
//               UserData userData = displayedUsers[index];
//               return ListTile(
//                 title: Text(
//                   userData.username,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20, // Adjust the font size as needed
//                   ),
//                 ),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       userData.email,
//                     ),
//                     Text(
//                       'Premium User: ${userData.isPremiumUser == "Y" ? 'Yes' : 'No'}',
//                       style: TextStyle(
//                         color: userData.isPremiumUser == "Y"
//                             ? Colors.green
//                             : Colors.red,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 trailing: ElevatedButton(
//                   onPressed: () {
//                     // Show confirmation dialog to remove user
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: const Text('In Active User'),
//                           content: Text(
//                               'Are you sure you want to In Active ${userData.username}?'),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 // Close the dialog
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text('Cancel'),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 removeUser(userData);
//                                 // Remove the user from the list
//                                 // setState(() {
//                                 //   userDataList.removeAt(index);
//                                 //   displayedUsers.removeAt(index);
//                                 //   totalUsers--;
//                                 // });
//                                 // Close the dialog
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text('In Active'),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   child: const Text('In Active'),
//                 ),
//               );
//             },
//           )),
//         ],
//       ),
//     );
//   }

//   void filterUsers() {
//     // Filter displayed users based on search query
//     if (searchQuery.isEmpty) {
//       // If search query is empty, display all users
//       setState(() {
//         displayedUsers = List.from(userDataList);
//       });
//     } else {
//       // If search query is not empty, filter users by username or email
//       setState(() {
//         displayedUsers = userDataList
//             .where((user) =>
//                 user.username.toLowerCase().contains(searchQuery) ||
//                 user.email.toLowerCase().contains(searchQuery))
//             .toList();
//       });
//     }
//   }
// }

// class UserData {
//   final String username;
//   final String email;
//   final String isPremiumUser;

//   UserData({
//     required this.username,
//     required this.email,
//     required this.isPremiumUser,
//   });

//   factory UserData.fromMap(Map<String, dynamic> map) {
//     debugPrint("here.....");

//     return UserData(
//       username: map['username'],
//       email: map['email_address'],
//       isPremiumUser: map['IS_PREMIUM_USER'],
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sampleapp/Colors.dart';
import 'package:sampleapp/Settings.dart';
import 'package:sampleapp/api_urls.dart';
import 'package:http/http.dart' as http;

class UsersData extends StatefulWidget {
  final String user;
  const UsersData({Key? key, required this.user}) : super(key: key);

  @override
  State<UsersData> createState() => _UsersDataState();
}

class _UsersDataState extends State<UsersData> {
  List<UserData> userDataList = []; // List to store fetched user data
  int totalUsers = 0; // Variable to store total number of users
  List<UserData> displayedUsers = []; // List to store displayed user data
  String searchQuery = ''; // Variable to store search query

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the screen loads
  }

  Future<void> removeUser(UserData user) async {
    const String apiUrl = ApiUrls.deluser;

    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "username": user.username,
        }),
      );

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Successful'),
              content: Text('User ${user.username} has been removed'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    fetchData();
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        debugPrint('Failed to remove user: ${response.statusCode}');

        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Failure'),
              content: const Text('Failed to remove user'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      debugPrint('Error removing user: $e');
    }
  }

  Future<void> fetchData() async {
    const String apiUrl = ApiUrls.fetchusers;
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(json.decode(response.body));
        debugPrint("RESPONSE BODY = ${response.body}");

        setState(() {
          userDataList = data.map((data) => UserData.fromMap(data)).toList();
          totalUsers = userDataList.length;
          displayedUsers = List.from(userDataList);
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
        title: Text('App Users - Total: $totalUsers'),
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
                // Update search query and filter displayed users
                setState(() {
                  searchQuery = value.toLowerCase();
                  filterUsers();
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search by Username or Email',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: totalUsers == 0
                ? const Center(
                    child: Text(
                      'No Users',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    itemCount: displayedUsers.length,
                    itemBuilder: (context, index) {
                      UserData userData = displayedUsers[index];
                      return ListTile(
                        title: Text(
                          userData.username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20, // Adjust the font size as needed
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userData.email,
                            ),
                            Text(
                              'Premium User: ${userData.isPremiumUser == "Y" ? 'Yes' : 'No'}',
                              style: TextStyle(
                                color: userData.isPremiumUser == "Y"
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {
                            // Show confirmation dialog to remove user
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('In Active User'),
                                  content: Text(
                                      'Are you sure you want to In Active ${userData.username}?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Close the dialog
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        removeUser(userData);
                                        // Remove the user from the list
                                        // setState(() {
                                        //   userDataList.removeAt(index);
                                        //   displayedUsers.removeAt(index);
                                        //   totalUsers--;
                                        // });
                                        // Close the dialog
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('In Active'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('In Active'),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void filterUsers() {
    // Filter displayed users based on search query
    if (searchQuery.isEmpty) {
      // If search query is empty, display all users
      setState(() {
        displayedUsers = List.from(userDataList);
      });
    } else {
      // If search query is not empty, filter users by username or email
      setState(() {
        displayedUsers = userDataList
            .where((user) =>
                user.username.toLowerCase().contains(searchQuery) ||
                user.email.toLowerCase().contains(searchQuery))
            .toList();
      });
    }
  }
}

class UserData {
  final String username;
  final String email;
  final String isPremiumUser;

  UserData({
    required this.username,
    required this.email,
    required this.isPremiumUser,
  });

  factory UserData.fromMap(Map<String, dynamic> map) {
    debugPrint("here.....");

    return UserData(
      username: map['username'],
      email: map['email_address'],
      isPremiumUser: map['IS_PREMIUM_USER'],
    );
  }
}
