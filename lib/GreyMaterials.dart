import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sampleapp/Settings.dart';
import 'package:http/http.dart' as http;
import 'package:sampleapp/api_urls.dart';
import 'package:google_fonts/google_fonts.dart';

class GreyMaterials extends StatefulWidget {
  final String user;

  const GreyMaterials({super.key, required this.user});

  @override
  State<GreyMaterials> createState() => _GreyMaterialsState();
}

class _GreyMaterialsState extends State<GreyMaterials> {
  List<Map<String, dynamic>> greyData = [];
  List<Map<String, dynamic>> filteredData = [];
  Map<String, dynamic> rowData = {};
  TextEditingController changedRateController = TextEditingController();

  // Define a variable to hold selected row data

  @override
  void initState() {
    super.initState();
    fetchGreyData();
  }

  Future<void> fetchGreyData() async {
    try {
      final response = await http.get(Uri.parse(ApiUrls.getGrey));

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
                title: const Text('Successful'),
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
      } else {
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }

  int selectedRowIndex = -1;
  int selectedRowVar = -1;
  final TextEditingController changedrate = TextEditingController();

  bool isValidNumber(String input) {
    RegExp regex = RegExp(r'^\d+(\.\d{0,1})?$');
    return regex.hasMatch(input);
  }

  void showEditDialog(BuildContext context, Map<String, dynamic> rowData) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Rate for ${rowData['Material_Name']}'),
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
                          title: const Text('Invalid Material Rate'),
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
                  updaterate(rowData['Material_Name'].toString(),
                      changedRateController.text.toString());
                  changedRateController.clear();
                  Navigator.pop(context);
                  fetchGreyData();
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

  Future<void> scrapdata(BuildContext context) async {
    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevent users from dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      final response =
          await http.put(Uri.parse('${ApiUrls.baseUrl}/scrap_data'));

      if (response.statusCode == 200) {
        Navigator.pop(context); // Dismiss the loading indicator
        fetchGreyData();
        // ignore: use_build_context_synchronously
        // Fetch the updated data
        setState(() {});
        showUpdateDialog(context);

        // Trigger a rebuild to update the UI
      } else {
        Navigator.pop(context); // Dismiss the loading indicator
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      Navigator.pop(context); // Dismiss the loading indicator
      debugPrint('Error fetching data: $e');
    }
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
                Navigator.of(context).pop();
              },
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 251, 18, 1),
        title: const Text("Grey Structure Materials"),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 60, 71, 194),
              ),
              onPressed: () {
                scrapdata(context);
              },
              child: const Text("Update Rates"),
            ),
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
                fetchGreyData(); // Call fetchFinishData() to refresh data
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Material Rates are Refreshed'),
                    duration:
                        Duration(seconds: 3), // Adjust the duration as needed
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
                        'Brand',
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
                              child: Text(rowData['Brand'].toString()),
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
    );
  }
}
