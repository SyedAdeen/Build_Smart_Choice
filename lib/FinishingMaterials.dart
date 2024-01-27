import 'package:flutter/material.dart';
import 'package:sampleapp/Settings.dart';

class Finishing extends StatefulWidget {
  final String user;
  const Finishing({super.key, required this.user});

  @override
  State<Finishing> createState() => _FinishingState();
}

class _FinishingState extends State<Finishing> {
  int selectedRowIndex = -1; // Add this line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 251, 18, 1),
        automaticallyImplyLeading: true,
        title: const Text("Finishing Materials"),
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
              DataColumn(label: Text('Material Name')),
              DataColumn(label: Text('Company Name')),
              DataColumn(label: Text('Factor')),
              DataColumn(label: Text('Rate')),
              DataColumn(label: Text('Edit')),
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
                      child: Text('Material ${index + 1}'),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: 180,
                      child: Text('Company ${index + 1}'),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: 50,
                      child: Text('Factor ${index + 1}'),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: 80,
                      child: Text('Rate ${index + 1}'),
                    ),
                  ),
                  DataCell(
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 60, 71, 194),
                      ),
                      onPressed: () {
                        // Implement your edit logic here
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title:
                                  Text('Edit Rate for Material ${index + 1}'),
                              content: TextFormField(
                                //controller: changedrate,
                                decoration: const InputDecoration(
                                  hintText: "Upto one Decimal Place",
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              // Add text fields or input widgets to get the new rate
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 60, 71, 194),
                                  ),
                                  onPressed: () {
                                    //debugPrint(changedrate.text.toString());
                                    // Your edit rate logic here
                                    // changedrate.clear();
                                    Navigator.pop(context);
                                    // Refresh data or update UI as needed
                                    setState(() {});
                                  },
                                  child: const Text('Save'),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 177, 47, 38),
                                  ),
                                  onPressed: () {
                                    //changedrate.clear();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('Edit'),
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
