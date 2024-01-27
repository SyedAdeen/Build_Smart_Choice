import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sampleapp/Help.dart';
import 'package:sampleapp/Settings.dart';
import 'package:http/http.dart' as http;
import 'package:sampleapp/api_urls.dart';

class GreyMaterials extends StatefulWidget {
  final String user;

  const GreyMaterials({super.key, required this.user});

  @override
  State<GreyMaterials> createState() => _GreyMaterialsState();
}

class _GreyMaterialsState extends State<GreyMaterials> {
  List<Map<String, dynamic>> greyData = []; // Store fetched data here

  @override
  void initState() {
    super.initState();
    fetchGreyData();
  }

  Future<void> fetchGreyData() async {
    // Replace this URL with your backend API endpoint

    try {
      final response = await http.get(Uri.parse('${ApiUrls.baseUrl}/get_grey'));

      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(json.decode(response.body));

        setState(() {
          greyData = data;
        });
      } else {
        // Handle error
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exception
      debugPrint('Error fetching data: $e');
    }
  }

  Future<void> updaterate(String Material, String Rate) async {
    try {
      final response = await http.put(
        Uri.parse('${ApiUrls.baseUrl}/updaterate'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'material_name': Material.toString(),
          'new_rate': Rate.toString(),
        }),
      );
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Successfull'),
                content: Text('$Material Rate is Updated'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      fetchGreyData();
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });

        // Parse the JSON response
      } else {
        // Handle error
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exception
      debugPrint('Error fetching data: $e');
    }
  }

  int selectedRowIndex = -1; //Track the selected row
  final TextEditingController changedrate = TextEditingController();

  bool isValidNumber(String input) {
    // // Use a regular expression to check if the input is a valid number
    RegExp regex = RegExp(r'^\d+(\.\d{0,1})?$');
    return regex.hasMatch(input);
  }

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
        title: const Text("Grey Structure Materials"),
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
              DataColumn(label: Text('Factor')),
              DataColumn(label: Text('Rate')),
              DataColumn(label: Text('Edit')),
            ],
            rows: greyData.asMap().entries.map((entry) {
              final int index = entry.key;
              final Map<String, dynamic> rowData = entry.value;

              return DataRow.byIndex(
                index: index,
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
                      child: Text(rowData['Material_Name']),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: 50,
                      child: Text(rowData['Factor'].toString()),
                    ),
                  ),
                  DataCell(
                    Container(
                      width: 80,
                      child: Text(rowData['Rate'].toString()),
                    ),
                  ),
                  DataCell(
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 60, 71, 194)),
                      onPressed: () {
                        // Implement your edit logic here
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                  'Edit Rate for ${rowData['Material_Name']}'),
                              content: TextFormField(
                                controller: changedrate,
                                decoration: const InputDecoration(
                                  hintText: "Upto one Decimal Place",
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              // Add text fields or input widgets to get the new rate
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 60, 71, 194)),
                                  onPressed: () {
                                    debugPrint(changedrate.text.toString());
                                    bool vflag =
                                        isValidNumber(changedrate.text);
                                    debugPrint(vflag.toString());
                                    if (vflag.toString() == "false") {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Invlaid Material Rate'),
                                              content: const Text(
                                                  'Field must not be empty & Number should have at most one decimal place'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop(
                                                        false); // Cancel logout
                                                  },
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          });
                                    } else {
                                      updaterate(
                                          rowData['Material_Name'].toString(),
                                          changedrate.text.toString());
                                      changedrate.clear();
                                      Navigator.pop(context);
                                      fetchGreyData();
                                      setState(() {});
                                    }
                                  },
                                  child: const Text('Save'),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 177, 47, 38)),
                                  onPressed: () {
                                    changedrate.clear();
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
            }).toList(),
          ),
        ),
      ),
    );
  }
}
