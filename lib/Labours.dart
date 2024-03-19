import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sampleapp/Settings.dart';
import 'package:sampleapp/api_urls.dart';
import 'package:google_fonts/google_fonts.dart';

class LaboursData extends StatefulWidget {
  final String user;
  const LaboursData({super.key, required this.user});

  @override
  State<LaboursData> createState() => _LaboursDataState();
}

class _LaboursDataState extends State<LaboursData> {
  int selectedRowIndex = -1;
  List<Map<String, dynamic>> labourData = [];

  List<Map<String, dynamic>> filteredData = [];
  Map<String, dynamic> rowData = {};
  TextEditingController changedRateController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchLabourData();
  }

  Future<void> fetchLabourData() async {
    try {
      final response =
          await http.get(Uri.parse('${ApiUrls.baseUrl}/get_labour'));

      if (response.statusCode == 200) {
        final List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(json.decode(response.body));
        debugPrint('Response Body: $data');

        setState(() {
          labourData = data;
        });
      } else {
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }

  bool isValidNumber(String input) {
    RegExp regex = RegExp(r'^\d+(\.\d{0,1})?$');
    return regex.hasMatch(input);
  }

  Future<void> updaterate(String labour_type, String Rate) async {
    try {
      final response = await http.put(
        Uri.parse('${ApiUrls.baseUrl}/update_labour_rate'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'labour_type': labour_type.toString(),
          'new_rate': Rate.toString(),
        }),
      );
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Successful'),
                content: Text('${capitalize(labour_type)} Rate is Updated'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      fetchLabourData();
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            });
      } else {
        debugPrint('Failed to Update data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error Updating data: $e');
    }
  }

  void showEditDialog(BuildContext context, Map<String, dynamic> rowData) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Rate for ${rowData['LABOUR_TYPE']}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Rate: ${rowData['Rate']} / ${rowData['Factor']}'),
              TextFormField(
                controller: changedRateController,
                decoration: const InputDecoration(
                  hintText: "Up to one Decimal Place",
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 60, 71, 194)),
              onPressed: () {
                bool vflag = isValidNumber(changedRateController.text);
                if (vflag.toString() == "false") {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Invalid Labour Rate'),
                          content: const Text(
                              'Field must not be empty & Number should have at most one decimal place'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      });
                } else {
                  updaterate(rowData['LABOUR_TYPE'].toString(),
                      changedRateController.text.toString());
                  changedRateController.clear();
                  Navigator.pop(context);
                  fetchLabourData();
                }
              },
              child: const Text('Save'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 177, 47, 38)),
              onPressed: () {
                changedRateController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  String capitalize(String s) {
    if (s.isEmpty) {
      return '';
    }
    return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
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
        title: const Text("Labour Rates"),
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
      // body: Column(
      //   children: [
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: TextField(
      //     onChanged: (value) {
      //       setState(() {
      //         filteredData = labourData
      //             .where((data) => data['Material_Name']
      //                 .toLowerCase()
      //                 .contains(value.toLowerCase()))
      //             .toList();
      //       });
      //     },
      //     decoration: const InputDecoration(
      //       labelText: 'Search Material',
      //       prefixIcon: Icon(Icons.search),
      //       border: OutlineInputBorder(),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minWidth: MediaQuery.of(context).size.width),
          child: DataTable(
            dataRowMinHeight: 48,
            columns: [
              DataColumn(
                label: Text(
                  'Labour Types',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Rate',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            rows: (filteredData.isEmpty ? labourData : filteredData)
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
                        child: Text(capitalize(rowData['LABOUR_TYPE'])),
                      ),
                    ),
                  ),
                  DataCell(
                    GestureDetector(
                      onTap: () {
                        showEditDialog(context, rowData);
                      },
                      child: SizedBox(
                        child: Text(rowData['Rate'].toString()),
                      ),
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
