import 'package:flutter/material.dart';
import 'package:sampleapp/Settings.dart';
import 'package:http/http.dart' as http;
import 'package:sampleapp/api_urls.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

class Finishing extends StatefulWidget {
  final String user;
  const Finishing({super.key, required this.user});

  @override
  State<Finishing> createState() => _FinishingState();
}

class _FinishingState extends State<Finishing> {
  int selectedRowIndex = -1; // Add this line
  List<Map<String, dynamic>> greyData = [];
  List<Map<String, dynamic>> filteredData = [];
  TextEditingController changedRateControllerA = TextEditingController();
  TextEditingController changedRateControllerB = TextEditingController();
  TextEditingController changedRateControllerC = TextEditingController();
  TextEditingController changedRateControllerD = TextEditingController();
  bool vFlag1 = false;
  bool vFlag2 = false;
  bool vFlag3 = false;
  bool vFlag4 = false;
  @override
  void initState() {
    super.initState();
    fetchFinishData();
  }

  Future<void> fetchFinishData() async {
    try {
      final response = await http.get(Uri.parse(ApiUrls.getFinish));

      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(json.decode(response.body));

        setState(() {
          greyData = data;
        });
      } else {
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }

  Future<void> updaterate(
      String Material, String Rate, String classname) async {
    try {
      final response = await http.put(
        Uri.parse(ApiUrls.update_finish_rate),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'material_name': Material.toString(),
          'new_rate': Rate.toString(),
          'class_name': classname.toString()
        }),
      );
      if (response.statusCode == 200) {
        FocusScope.of(context).unfocus();

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$Material Rate is Updated for Class $classname'),
            duration: Duration(seconds: 2), // Adjust the duration as needed
            // action: SnackBarAction(
            //   label: 'OK',
            //   onPressed: () {
            //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
            //   },
            // ),
          ),
        );

// Hide the keyboard
      } else {
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }

  void showEditDialog(BuildContext context, Map<String, dynamic> rowData) {
    showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text(
              'Edit Rate for \n${rowData['Material_Name']}',
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Class A: ${rowData['Class_A']}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Rate: ${rowData['Rate_A']} / ${rowData['Factor']}'),
                TextFormField(
                  controller: changedRateControllerA,
                  decoration: const InputDecoration(
                    hintText: "Up to one Decimal Place",
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                Text('Class B: ${rowData['Class_B']}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Rate: ${rowData['Rate_B']} / ${rowData['Factor']}'),
                TextFormField(
                  controller: changedRateControllerB,
                  decoration: const InputDecoration(
                    hintText: "Up to one Decimal Place",
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                Text('Class C: ${rowData['Class_C']}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Rate: ${rowData['Rate_C']} / ${rowData['Factor']}'),
                TextFormField(
                  controller: changedRateControllerC,
                  decoration: const InputDecoration(
                    hintText: "Up to one Decimal Place",
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                Text('Class D: ${rowData['Class_D']}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Rate: ${rowData['Rate_D']} / ${rowData['Factor']}'),
                TextFormField(
                  controller: changedRateControllerD,
                  decoration: const InputDecoration(
                    hintText: "Up to one Decimal Place",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  int operationsCompleted = 0;

                  if (changedRateControllerA.text.isNotEmpty) {
                    bool vFlag1 = isValidNumber(changedRateControllerA.text);
                    if (vFlag1) {
                      updaterate(rowData['Material_Name'].toString(),
                          changedRateControllerA.text.toString(), "A");
                      operationsCompleted++;
                    }
                  }

                  if (changedRateControllerB.text.isNotEmpty) {
                    bool vFlag2 = isValidNumber(changedRateControllerB.text);
                    if (vFlag2) {
                      updaterate(rowData['Material_Name'].toString(),
                          changedRateControllerB.text.toString(), "B");
                      operationsCompleted++;
                    }
                  }

                  if (changedRateControllerC.text.isNotEmpty) {
                    bool vFlag3 = isValidNumber(changedRateControllerC.text);
                    if (vFlag3) {
                      updaterate(rowData['Material_Name'].toString(),
                          changedRateControllerC.text.toString(), "C");
                      operationsCompleted++;
                    }
                  }

                  if (changedRateControllerD.text.isNotEmpty) {
                    bool vFlag4 = isValidNumber(changedRateControllerD.text);
                    if (vFlag4) {
                      updaterate(rowData['Material_Name'].toString(),
                          changedRateControllerD.text.toString(), "D");
                      operationsCompleted++;
                    }
                  }

                  if (operationsCompleted > 0) {
                    changedRateControllerA.clear();
                    changedRateControllerB.clear();
                    changedRateControllerC.clear();
                    changedRateControllerD.clear();

                    Navigator.pop(context);

                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return AlertDialog(
                    //       title: const Text('Success'),
                    //       content: const Text('All rates updated successfully'),
                    //       actions: <Widget>[
                    //         TextButton(
                    //           onPressed: () {
                    //             Navigator.of(context).pop(false);
                    //           },
                    //           child: const Text('OK'),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // );

                    // setState(() async {
                    //   await fetchFinishData();
                    // });
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Invalid Material Rate'),
                          content: const Text(
                            'Field must not be empty & Number should have at most one decimal place',
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Save'),
              ),

              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //       backgroundColor: const Color.fromARGB(255, 60, 71, 194)),
              //   onPressed: () {
              //     if (changedRateControllerA.text.isNotEmpty ||
              //         changedRateControllerB.text.isNotEmpty ||
              //         changedRateControllerC.text.isNotEmpty ||
              //         changedRateControllerD.text.isNotEmpty) {
              //       if (changedRateControllerA.text.isNotEmpty) {
              //         vFlag1 = isValidNumber(changedRateControllerA.text);
              //       }
              //       if (changedRateControllerB.text.isNotEmpty) {
              //         vFlag2 = isValidNumber(changedRateControllerA.text);
              //       }
              //       if (changedRateControllerC.text.isNotEmpty) {
              //         vFlag3 = isValidNumber(changedRateControllerA.text);
              //       }
              //       if (changedRateControllerD.text.isNotEmpty) {
              //         vFlag4 = isValidNumber(changedRateControllerA.text);
              //       }

              //       if ((changedRateControllerA.text.isNotEmpty &&
              //               vFlag1.toString() == "true") ||
              //           (changedRateControllerB.text.isNotEmpty &&
              //               vFlag2.toString() == "true") ||
              //           (changedRateControllerC.text.isNotEmpty &&
              //               vFlag3.toString() == "true") ||
              //           (changedRateControllerD.text.isNotEmpty &&
              //               vFlag4.toString() == "true")) {
              //         if (vFlag1 == true) {
              //           updaterate(rowData['Material_Name'].toString(),
              //               changedRateControllerA.text.toString(), "A");
              //         }
              //         if (vFlag2 == true) {
              //           updaterate(rowData['Material_Name'].toString(),
              //               changedRateControllerB.text.toString(), "B");
              //         }
              //         if (vFlag3 == true) {
              //           updaterate(rowData['Material_Name'].toString(),
              //               changedRateControllerC.text.toString(), "C");
              //         }
              //         if (vFlag4 == true) {
              //           updaterate(rowData['Material_Name'].toString(),
              //               changedRateControllerD.text.toString(), "D");
              //         }
              //         changedRateControllerA.clear();
              //         changedRateControllerB.clear();
              //         changedRateControllerC.clear();
              //         changedRateControllerD.clear();

              //         Navigator.pop(context);
              //         setState(() {
              //           fetchFinishData();
              //         });
              //       } else {
              //         showDialog(
              //             context: context,
              //             builder: (context) {
              //               return AlertDialog(
              //                 title: const Text('Invalid Material Rate'),
              //                 content: const Text(
              //                     'Field must not be empty & Number should have at most one decimal place'),
              //                 actions: <Widget>[
              //                   TextButton(
              //                     onPressed: () {
              //                       Navigator.of(context).pop(false);
              //                     },
              //                     child: const Text('OK'),
              //                   ),
              //                 ],
              //               );
              //             });
              //       }
              //     } else {
              //       showDialog(
              //           context: context,
              //           builder: (context) {
              //             return AlertDialog(
              //               title: const Text('Empty Fields'),
              //               content: const Text(
              //                   'At least one field should be filled'),
              //               actions: <Widget>[
              //                 TextButton(
              //                   onPressed: () {
              //                     Navigator.of(context).pop(false);
              //                   },
              //                   child: const Text('OK'),
              //                 ),
              //               ],
              //             );
              //           });
              //     }
              //   },
              //   child: const Text('Save'),
              // ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 177, 47, 38)),
                onPressed: () {
                  changedRateControllerA.clear();
                  changedRateControllerB.clear();
                  changedRateControllerC.clear();
                  changedRateControllerD.clear();
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }

  void showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Text("Rates are Updated Successfully"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool isValidNumber(String input) {
    RegExp regex = RegExp(r'^\d+(\.\d{0,1})?$');
    return regex.hasMatch(input);
  }

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    filteredData = greyData
                        .where((data) => data['Material_Name']
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Search Material',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 10), // Adjust the height as needed
            FloatingActionButton(
              onPressed: () {
                fetchFinishData(); // Call fetchFinishData() to refresh data
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Material Rates are Refreshed'),
                    duration:
                        Duration(seconds: 3), // Adjust the duration as needed
                    // action: SnackBarAction(
                    //   label: 'OK',
                    //   onPressed: () {
                    //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    //   },
                    // ),
                  ),
                );
              },
              tooltip: 'Refresh',
              child: Icon(Icons.refresh),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: MediaQuery.of(context).size.width),
                child: DataTable(
                  dataRowMinHeight: 48,
                  columns: [
                    DataColumn(
                      label: Text(
                        'Material Name',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Class A',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Class B',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Class C',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Class D',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  rows: (filteredData.isEmpty ? greyData : filteredData)
                      .asMap()
                      .entries
                      .map((entry) {
                    final int index = entry.key;
                    final Map<String, dynamic> rowData = entry.value;

                    return DataRow(
                      cells: [
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              showEditDialog(context, rowData);
                            },
                            child: SizedBox(
                              width: 180,
                              child: Text(rowData['Material_Name']),
                            ),
                          ),
                        ),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              showEditDialog(context, rowData);
                            },
                            child: SizedBox(
                              width: 180,
                              child: Text(rowData['Class_A'].toString()),
                            ),
                          ),
                        ),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              showEditDialog(context, rowData);
                            },
                            child: SizedBox(
                              width: 180,
                              child: Text(rowData['Class_B'].toString()),
                            ),
                          ),
                        ),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              showEditDialog(context, rowData);
                            },
                            child: SizedBox(
                              width: 180,
                              child: Text(rowData['Class_C'].toString()),
                            ),
                          ),
                        ),
                        DataCell(
                          GestureDetector(
                            onTap: () {
                              showEditDialog(context, rowData);
                            },
                            child: SizedBox(
                              width: 180,
                              child: Text(rowData['Class_D'].toString()),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),

      // body: SingleChildScrollView(
      //   scrollDirection: Axis.horizontal, // Enable horizontal scrolling
      //   child: SingleChildScrollView(
      //     scrollDirection: Axis.vertical, // Enable vertical scrolling
      //     child: DataTable(
      //       dataRowMinHeight: 40,
      //       columns: const [
      //         DataColumn(label: Text('Material Name')),
      //         DataColumn(label: Text('Company Name')),
      //         DataColumn(label: Text('Factor')),
      //         DataColumn(label: Text('Rate')),
      //         DataColumn(label: Text('Edit')),
      //       ],
      //       rows: List.generate(20, (index) {
      //         return DataRow(
      //           selected: selectedRowIndex == index,
      //           onSelectChanged: (isSelected) {
      //             setState(() {
      //               selectedRowIndex = isSelected! ? index : -1;
      //             });
      //           },
      //           cells: [
      //             DataCell(
      //               Container(
      //                 width: 180,
      //                 child: Text('Material ${index + 1}'),
      //               ),
      //             ),
      //             DataCell(
      //               Container(
      //                 width: 180,
      //                 child: Text('Company ${index + 1}'),
      //               ),
      //             ),
      //             DataCell(
      //               Container(
      //                 width: 50,
      //                 child: Text('Factor ${index + 1}'),
      //               ),
      //             ),
      //             DataCell(
      //               Container(
      //                 width: 80,
      //                 child: Text('Rate ${index + 1}'),
      //               ),
      //             ),
      //             DataCell(
      //               ElevatedButton(
      //                 style: ElevatedButton.styleFrom(
      //                   backgroundColor: const Color.fromARGB(255, 60, 71, 194),
      //                 ),
      //                 onPressed: () {
      //                   // Implement your edit logic here
      //                   showDialog(
      //                     context: context,
      //                     builder: (context) {
      //                       return AlertDialog(
      //                         title:
      //                             Text('Edit Rate for Material ${index + 1}'),
      //                         content: TextFormField(
      //                           //controller: changedrate,
      //                           decoration: const InputDecoration(
      //                             hintText: "Upto one Decimal Place",
      //                           ),
      //                           keyboardType: TextInputType.number,
      //                         ),
      //                         // Add text fields or input widgets to get the new rate
      //                         actions: [
      //                           ElevatedButton(
      //                             style: ElevatedButton.styleFrom(
      //                               backgroundColor:
      //                                   const Color.fromARGB(255, 60, 71, 194),
      //                             ),
      //                             onPressed: () {
      //                               //debugPrint(changedrate.text.toString());
      //                               // Your edit rate logic here
      //                               // changedrate.clear();
      //                               Navigator.pop(context);
      //                               // Refresh data or update UI as needed
      //                               setState(() {});
      //                             },
      //                             child: const Text('Save'),
      //                           ),
      //                           ElevatedButton(
      //                             style: ElevatedButton.styleFrom(
      //                               backgroundColor:
      //                                   const Color.fromARGB(255, 177, 47, 38),
      //                             ),
      //                             onPressed: () {
      //                               //changedrate.clear();
      //                               Navigator.of(context).pop();
      //                             },
      //                             child: const Text('Cancel'),
      //                           ),
      //                         ],
      //                       );
      //                     },
      //                   );
      //                 },
      //                 child: const Text('Edit'),
      //               ),
      //             ),
      //           ],
      //         );
      //       }),
      //     ),
      //   ),
      // ),
    );
  }
}
