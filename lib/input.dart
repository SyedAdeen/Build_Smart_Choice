//import 'dart:html';

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sampleapp/BasementDouble.dart';
import 'package:sampleapp/BasementSingle.dart';
import 'package:sampleapp/Double_Story.dart';
import 'package:sampleapp/Settings.dart';
import 'package:sampleapp/Single_Story.dart';

class InputPage extends StatefulWidget {
  final String user;

  const InputPage({super.key, required this.user});

  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // ignore: prefer_final_fields
  TextEditingController _areaController = TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _costController = TextEditingController();
  String? _selectedArea;
  String? _selectedFloors;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool with_basement = false;

  @override
  void dispose() {
    _areaController.dispose();
    _costController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 71, 194),
        title: const Text("Get Recommendation"),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10.0),
                const Text(
                  'Select plot size of the house : ',
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButtonFormField<String>(
                  value: _selectedArea,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedArea = newValue;
                    });
                  },
                  items: <String>[
                    '3 Marla    (675 sq. ft.)',
                    '5 Marla    (1125 sq. ft.)',
                    '7 Marla    (1575 sq. ft.)',
                    '10 Marla   (2250 sq. ft.)',
                    '20 Marla | 1 Kanal   (4500 sq. ft.)'
                  ]
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select plot size';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30.0),
                const Text(
                  'Enter your budget (PKR)',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _costController,
                  decoration: InputDecoration(
                    labelText: 'Max Budget is Rs 12 Crore ',
                    hintText: "Write in numeric format",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(39),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Budget of the house';
                    } else if (int.parse(value) >= 120000001) {
                      return 'Max allowed budget is 12 crore';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 30.0),
                const Text(
                  'Select number of floors',
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButtonFormField<String>(
                  value: _selectedFloors,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedFloors = newValue;
                    });
                  },
                  items: <String>['Single Storey', 'Double Storey']
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ),
                      )
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select the number of floors';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          with_basement = !with_basement;
                        });
                      },
                      child: Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.0,
                            color: const Color.fromARGB(255, 60, 71, 194),
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                          color: with_basement
                              ? const Color.fromARGB(255, 60, 71, 194)
                              : Colors.transparent,
                        ),
                        child: with_basement
                            ? const Icon(
                                Icons.check,
                                size: 20.0,
                                color: Colors.white,
                              )
                            : Container(),
                      ),
                    ),
                    const SizedBox(width: 8.0), // Add some spacing
                    const Text(
                      "Include Basement",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // All fields are valid, navigate to the next page or perform desired action
                      // print('House Area: ${_areaController.text}');
                      // print('Area Option: $_selectedArea');
                      // print('Cost of House: ${_costController.text}');
                      // print('Number of Floors: $_selectedFloors');
                      const ColorScheme.dark(background: Colors.pink);

                      if (_selectedFloors == 'Single Storey') {
                        String area1 = _selectedArea.toString();

                        if (with_basement == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BasementSingle(
                                  user: widget.user,
                                  storey: _selectedFloors.toString(),
                                  area: area1[
                                      0]), // Navigate to SingleStory class
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageListScreen(
                                  user: widget.user,
                                  storey: _selectedFloors.toString(),
                                  area: area1[
                                      0]), // Navigate to SingleStory class
                            ),
                          );
                        }
                      } else if (_selectedFloors == 'Double Storey') {
                        String area2 = _selectedArea.toString();
                        if (with_basement == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BasementDouble(
                                user: widget.user,
                                storey: _selectedFloors.toString(),
                                area: area2[0],
                              ), // Navigate to DoubleStory class
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageListScreen2(
                                user: widget.user,
                                storey: _selectedFloors.toString(),
                                area: area2[0],
                              ), // Navigate to DoubleStory class
                            ),
                          );
                        }
                      }
                      // Navigate to the next page here
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 60, 71, 194),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150.0, vertical: 10.0),
                  ),
                  child: const SizedBox(
                    width: 350,
                    child: Text(
                      'Next ',
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
