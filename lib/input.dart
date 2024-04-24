import 'package:flutter/material.dart';
import 'package:sampleapp/BasementDouble.dart';
import 'package:sampleapp/BasementSingle.dart';
import 'package:sampleapp/Double_Story.dart';
import 'package:sampleapp/Settings.dart';
import 'package:sampleapp/Single_Story.dart';

class InputPage extends StatefulWidget {
  final String user;

  const InputPage({Key? key, required this.user}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController _areaController = TextEditingController();
  TextEditingController _costController = TextEditingController();
  String? _selectedArea;
  String? _selectedFloors;
  String? _selectedBudget;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool with_basement = false;
  bool showBudgetFields = false;

  void toggleBudgetFieldsVisibility() {
    setState(() {
      showBudgetFields = !showBudgetFields;
      _selectedBudget = null;
    });
  }

  void editAgain() {
    setState(() {
      showBudgetFields = false;
    });
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
                  },
                );
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
                  onChanged: showBudgetFields
                      ? null
                      : (newValue) {
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
                  'Select number of floors',
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButtonFormField<String>(
                  value: _selectedFloors,
                  onChanged: showBudgetFields
                      ? null
                      : (newValue) {
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
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: showBudgetFields
                          ? null
                          : () {
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

                const SizedBox(
                    width: 16.0), // Add spacing between checkbox and button
                Visibility(
                  visible: _selectedArea != null && _selectedFloors != null,
                  child: ElevatedButton(
                    onPressed: showBudgetFields
                        ? editAgain
                        : toggleBudgetFieldsVisibility,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 60, 71, 194),
                    ),
                    child: Text(
                      showBudgetFields ? "Edit Again" : "Show Budget",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Visibility(
                  visible: showBudgetFields,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30.0),
                      const Text(
                        'Select your budget (PKR)',
                        style: TextStyle(fontSize: 18),
                      ),
                      // DropdownButtonFormField<String>(
                      //   value: _selectedBudget, // Current selected budget value
                      //   onChanged: (newValue) {
                      //     // Function called when a new value is selected
                      //     setState(() {
                      //       // Update state when value changes
                      //       _selectedBudget =
                      //           newValue; // Update the selected budget
                      //     });
                      //   },
                      //   items: ( // Inline list of DropdownMenuItem objects
                      //           _selectedArea == '3 Marla    (675 sq. ft.)' &&
                      //               _selectedFloors == 'Single Storey' &&
                      //               !with_basement)
                      //       ? [
                      //           DropdownMenuItem<String>(
                      //             value: '4400000 - 5400000',
                      //             child: Text('44 lakh to 54 lakh'),
                      //           ),
                      //           DropdownMenuItem<String>(
                      //             value: '5400000 - 6400000',
                      //             child: Text('54 lakh to 64 lakh'),
                      //           ),
                      //           DropdownMenuItem<String>(
                      //             value: '6400000 - 7400000',
                      //             child: Text('64 lakh to 74 lakh'),
                      //           ),
                      //         ]
                      //       : [
                      //           DropdownMenuItem<String>(
                      //             value: 'Single Storey',
                      //             child: Text('Single Storey'),
                      //           ),
                      //           DropdownMenuItem<String>(
                      //             value: 'Double Storey',
                      //             child: Text('Double Storey'),
                      //           ),
                      //         ],
                      // ),

                      DropdownButtonFormField<String>(
                        value: _selectedBudget,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedBudget = newValue;
                          });
                        },
                        items: _getBudgetOptions(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select the Budget';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30.0),
                      Visibility(
                        visible: _selectedBudget != null,
                        child: ElevatedButton(
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
                                          area: area1[0],
                                          budget: _selectedBudget
                                              .toString()), // Navigate to SingleStory class
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ImageListScreen(
                                          user: widget.user,
                                          storey: _selectedFloors.toString(),
                                          area: area1[0],
                                          budget: _selectedBudget
                                              .toString()), // Navigate to SingleStory class
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
                                          budget: _selectedBudget
                                              .toString()), // Navigate to DoubleStory class
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
                                          budget: _selectedBudget
                                              .toString()), // Navigate to DoubleStory class
                                    ),
                                  );
                                }
                              }
                              // Navigate to the next page here
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 60, 71, 194),
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _getBudgetOptions() {
    if (_selectedArea == '3 Marla    (675 sq. ft.)' &&
        _selectedFloors == 'Single Storey' &&
        !with_basement) {
      return const [
        DropdownMenuItem<String>(
          value: '4400000 - 5400000',
          child: Text('44 lakh to 54 lakh'),
        ),
        DropdownMenuItem<String>(
          value: '5400000 - 6400000',
          child: Text('54 lakh to 64 lakh'),
        ),
        DropdownMenuItem<String>(
          value: '6400000 - 7400000',
          child: Text('64 lakh to 74 lakh'),
        )
      ];
    } else if (_selectedArea == '3 Marla    (675 sq. ft.)' &&
        _selectedFloors == 'Single Storey' &&
        with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '5700000 - 6700000',
          child: Text('57 lakh to 67 lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '6700000 - 7700000',
          child: Text('67 lakh to 77 lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '7700000 - 8700000',
          child: Text('77 lakh to 87 lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '8700000 - 9700000',
          child: Text('87 lakh to 97 lakh'),
        )
      ];
    } else if (_selectedArea == '3 Marla    (675 sq. ft.)' &&
        _selectedFloors == 'Double Storey' &&
        !with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '6600000 - 7600000',
          child: Text('66 lakh to 76 lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '7600000 - 8600000',
          child: Text('76 lakh to 86 lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '8600000 - 9600000',
          child: Text('86 lakh to 96 lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '9600000 - 10600000',
          child: Text('96 lakh to 1.06 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '10600000 - 11600000',
          child: Text('1.06 Crore to 1.16 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '11600000 - 12600000',
          child: Text('1.16 Crore to 1.26 Crore'),
        )
      ];
    } else if (_selectedArea == '3 Marla    (675 sq. ft.)' &&
        _selectedFloors == 'Double Storey' &&
        with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '8100000 - 9100000',
          child: Text('81 lakh to 91 lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '9100000 - 10100000',
          child: Text('91 lakh to 1.01 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '10100000 - 11100000',
          child: Text('1.01 Crore to 1.11 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '11100000 - 12100000',
          child: Text('1.11 Crore to 1.21 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '12100000 - 13100000',
          child: Text('1.21 Crore to 1.31 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '13100000 - 14100000',
          child: Text('1.31 Crore to 1.41 Crore'),
        )
      ];
    } else if (_selectedArea == '5 Marla    (1125 sq. ft.)' &&
        _selectedFloors == 'Single Storey' &&
        !with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '6100000 - 7100000',
          child: Text('61 lakh to 71 lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '7100000 - 8100000',
          child: Text('71 lakh to 81 lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '8100000 - 9100000',
          child: Text('81 lakh to 91 lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '9100000 - 10100000',
          child: Text('91 lakh to 1.01 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '10100000 - 11100000',
          child: Text('1.01 Crore to 1.11 Crore'),
        ),
      ];
    } else if (_selectedArea == '5 Marla    (1125 sq. ft.)' &&
        _selectedFloors == 'Single Storey' &&
        with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '8000000 - 9000000',
          child: Text('80 lakh to 90 lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '9000000 - 10000000',
          child: Text('90 lakh to 1 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '10000000 - 11000000',
          child: Text('1 Crore to 1.10 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '11000000 - 12000000',
          child: Text('1.10 Crore to 1.20 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '12000000 - 13000000',
          child: Text('1.20 Crore to 1.30 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '13000000 - 14000000',
          child: Text('1.30 Crore to 1.40 Crore'),
        ),
      ];
    } else if (_selectedArea == '5 Marla    (1125 sq. ft.)' &&
        _selectedFloors == 'Double Storey' &&
        !with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '8700000 - 9700000',
          child: Text('87 lakh to 97 lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '9700000 - 10700000',
          child: Text('97 lakh to 1.07 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '10700000 - 11700000',
          child: Text('1.07 Crore to 1.17 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '11700000 - 12700000',
          child: Text('1.17 Crore to 1.27 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '12700000 - 13700000',
          child: Text('1.27 Crore to 1.37 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '13700000 - 14700000',
          child: Text('1.37 Crore to 1.47 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '14700000 - 15700000',
          child: Text('1.47 Crore to 1.57 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '15700000 - 16700000',
          child: Text('1.57 Crore to 1.67 Crore'),
        ),
      ];
    } else if (_selectedArea == '5 Marla    (1125 sq. ft.)' &&
        _selectedFloors == 'Double Storey' &&
        with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '11600000 - 12600000',
          child: Text('1.16 Crore to 1.26 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '12600000 - 13600000',
          child: Text('1.26 Crore to 1.36 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '13600000 - 14600000',
          child: Text('1.36 Crore to 1.46 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '14600000 - 15600000',
          child: Text('1.46 Crore to 1.56 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '15600000 - 16600000',
          child: Text('1.56 Crore to 1.66 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '16600000 - 17600000',
          child: Text('1.66 Crore to 1.76 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '17600000 - 18600000',
          child: Text('1.76 Crore to 1.86 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '18600000 - 19600000',
          child: Text('1.86 Crore to 1.96 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '19600000 - 20600000',
          child: Text('1.96 Crore to 2.06 Crore'),
        ),
      ];
    }

    // else if (_selectedArea == '3 Marla    (675 sq. ft.)' &&
    //     _selectedFloors == 'Single Storey' &&
    //     with_basement) {
    //   return [
    //     DropdownMenuItem<String>(
    //       value: 'Single Storey with Basement',
    //       child: Text('Single Storey with Basement'),
    //     ),
    //   ];
    // }
    else {
      return [
        const DropdownMenuItem<String>(
          value: 'No Budget',
          child: Text('No Budget'),
        )
      ];
    }
  }

  @override
  void dispose() {
    _areaController.dispose();
    _costController.dispose();
    super.dispose();
  }
}
