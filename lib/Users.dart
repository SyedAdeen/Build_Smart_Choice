import 'package:flutter/material.dart';
import 'package:sampleapp/Settings.dart';

class UsersData extends StatefulWidget {
  final String user;
  const UsersData({super.key, required this.user});

  @override
  State<UsersData> createState() => _UsersDataState();
}

class _UsersDataState extends State<UsersData> {
  int selectedRowIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back
              },
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 251, 18, 1),
        //automaticallyImplyLeading: false,
        title: const Text("App Users"),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical, // Enable vertical scrolling
          child: DataTable(
            dataRowMinHeight: 40,
            columns: const [
              DataColumn(label: Text('Username')),
              DataColumn(label: Text('Feedback')),
              DataColumn(label: Text('Email ID')),
              DataColumn(label: Text('Remove')),
            ],
            rows: List.generate(20, (index) {
              return DataRow(
                selected: selectedRowIndex == index,
                onSelectChanged: (isSelected) {
                  setState(() {
                    selectedRowIndex = isSelected! ? index : -1;
                  });
                },
                cells: [
                  DataCell(
                    Container(
                      width: 180,
                      child: Text('Username ${index + 1}'),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: 180,
                      child: Text('Feedback ${index + 1}'),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: 180,
                      child: Text('email${index + 1}@example.com'),
                    ),
                  ),
                  DataCell(
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 177, 47, 38),
                      ),
                      onPressed: () {
                        // Implement your remove logic here
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Remove User ${index + 1}'),
                              content: const Text(
                                  'Are you sure you want to remove this user?'),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 60, 71, 194),
                                  ),
                                  onPressed: () {
                                    // Your remove user logic here
                                    Navigator.pop(context);
                                    // Refresh data or update UI as needed
                                    setState(() {});
                                  },
                                  child: const Text('Remove'),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('Remove'),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
