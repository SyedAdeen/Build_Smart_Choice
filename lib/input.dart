import 'package:flutter/material.dart';
import 'package:sampleapp/BasementDouble.dart';
import 'package:sampleapp/BasementSingle.dart';
import 'package:sampleapp/Double_Story.dart';
import 'package:sampleapp/Settings.dart';
import 'package:sampleapp/Single_Story.dart';
import 'package:sampleapp/home.dart';

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
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => InputPage(
                user: widget.user,
              )), // Replace YourPage with the actual page class
    );
  }

  @override
  Widget build(BuildContext context) {
    try {
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
                                            budget: _selectedBudget.toString()),
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
                                            budget: _selectedBudget.toString()),
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
                                            budget: _selectedBudget.toString()),
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
                                            budget: _selectedBudget.toString()),
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
    } catch (e) {
      Future.microtask(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => InputPage(
                    user: widget.user,
                  )), // Replace YourPage with the actual page class
        );
      });
      return Container(); // Return an empty container temporarily
    }
  }

  List<DropdownMenuItem<String>> _getBudgetOptions() {
    if (_selectedArea == '3 Marla    (675 sq. ft.)' &&
        _selectedFloors == 'Single Storey' &&
        !with_basement) {
      return const [
        DropdownMenuItem<String>(
          value: '4800000 - 5800000',
          child: Text('48 Lakh to 58 Lakh'),
        ),
        DropdownMenuItem<String>(
          value: '5800000 - 6800000',
          child: Text('58 Lakh to 68 Lakh'),
        ),
        DropdownMenuItem<String>(
          value: '6800000 - 7800000',
          child: Text('68 Lakh to 78 Lakh'),
        )
      ];
    } else if (_selectedArea == '3 Marla    (675 sq. ft.)' &&
        _selectedFloors == 'Single Storey' &&
        with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '7600000 - 8600000',
          child: Text('76 Lakh to 86 Lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '8600000 - 9600000',
          child: Text('86 Lakh to 96 Lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '9600000 - 10600000',
          child: Text('96 Lakh to 1.06 Crore'),
        )
      ];
    } else if (_selectedArea == '3 Marla    (675 sq. ft.)' &&
        _selectedFloors == 'Double Storey' &&
        !with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '7900000 - 8900000',
          child: Text('79 Lakh to 89 Lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '8900000 - 9900000',
          child: Text('89 Lakh to 99 Lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '9900000 - 10900000',
          child: Text('99 Lakh to 1.09 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '10900000 - 11900000',
          child: Text('1.09 Crore to 1.19 Crore'),
        ),
      ];
    } else if (_selectedArea == '3 Marla    (675 sq. ft.)' &&
        _selectedFloors == 'Double Storey' &&
        with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '9500000 - 10500000',
          child: Text('95 Lakh to 1.05 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '10500000 - 11500000',
          child: Text('1.05 Crore to 1.15 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '11500000 - 12500000',
          child: Text('1.15 Crore to 1.25 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '12500000 - 13500000',
          child: Text('1.25 Crore to 1.35 Crore'),
        ),
      ];
    } else if (_selectedArea == '5 Marla    (1125 sq. ft.)' &&
        _selectedFloors == 'Single Storey' &&
        !with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '6400000 - 7400000',
          child: Text('64 Lakh to 74 Lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '7400000 - 8400000',
          child: Text('74 Lakh to 84 Lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '8400000 - 9400000',
          child: Text('84 Lakh to 94 Lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '9400000 - 10400000',
          child: Text('94 Lakh to 1.04 Crore'),
        ),
      ];
    } else if (_selectedArea == '5 Marla    (1125 sq. ft.)' &&
        _selectedFloors == 'Single Storey' &&
        with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '11200000 - 12200000',
          child: Text('1.12 Crore to 1.22 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '12200000 - 13200000',
          child: Text('1.22 Crore to 1.32 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '13200000 - 14200000',
          child: Text('1.32 Crore to 1.42 Crore'),
        ),
      ];
    } else if (_selectedArea == '5 Marla    (1125 sq. ft.)' &&
        _selectedFloors == 'Double Storey' &&
        !with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '12000000 - 13000000',
          child: Text('1.20 Crore to 1.30 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '13000000 - 14000000',
          child: Text('1.30 Crore to 1.40 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '14000000 - 15000000',
          child: Text('1.40 Crore to 1.50 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '15000000 - 16000000',
          child: Text('1.50 Crore to 1.60 Crore'),
        ),
      ];
    } else if (_selectedArea == '5 Marla    (1125 sq. ft.)' &&
        _selectedFloors == 'Double Storey' &&
        with_basement) {
      return [
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
      ];
    } else if (_selectedArea == '7 Marla    (1575 sq. ft.)' &&
        _selectedFloors == 'Single Storey' &&
        !with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '8000000 - 9000000',
          child: Text('80 Lakh to 90 Lakh'),
        ),
        const DropdownMenuItem<String>(
          value: '9000000 - 10000000',
          child: Text('90 Lakh to 1 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '10000000 - 11000000',
          child: Text('1 Crore to 1.10 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '11000000 - 12000000',
          child: Text('1.10 Crore to 1.20 Crore'),
        ),
      ];
    } else if (_selectedArea == '7 Marla    (1575 sq. ft.)' &&
        _selectedFloors == 'Single Storey' &&
        with_basement) {
      return [
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
      ];
    } else if (_selectedArea == '7 Marla    (1575 sq. ft.)' &&
        _selectedFloors == 'Double Storey' &&
        !with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '13500000 - 14500000',
          child: Text('1.35 Crore to 1.45 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '14500000 - 15500000',
          child: Text('1.45 Crore to 1.55 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '15500000 - 16500000',
          child: Text('1.55 Crore to 1.65 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '16500000 - 17500000',
          child: Text('1.65 Crore to 1.75 Crore'),
        ),
      ];
    } else if (_selectedArea == '7 Marla    (1575 sq. ft.)' &&
        _selectedFloors == 'Double Storey' &&
        with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '16000000 - 17000000',
          child: Text('1.60 Crore to 1.70 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '17000000 - 18000000',
          child: Text('1.70 Crore to 1.80 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '18000000 - 19000000',
          child: Text('1.80 Crore to 1.90 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '19000000 - 20000000',
          child: Text('1.90 Crore to 2.00 Crore'),
        ),
      ];
    } else if (_selectedArea == '10 Marla   (2250 sq. ft.)' &&
        _selectedFloors == 'Single Storey' &&
        !with_basement) {
      return [
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
      ];
    } else if (_selectedArea == '10 Marla   (2250 sq. ft.)' &&
        _selectedFloors == 'Single Storey' &&
        with_basement) {
      return [
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
        const DropdownMenuItem<String>(
          value: '16700000 - 17700000',
          child: Text('1.67 Crore to 1.77 Crore'),
        ),
      ];
    } else if (_selectedArea == '10 Marla   (2250 sq. ft.)' &&
        _selectedFloors == 'Double Storey' &&
        !with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '17500000 - 18500000',
          child: Text('1.75 Crore to 1.85 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '18500000 - 19500000',
          child: Text('1.85 Crore to 1.95 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '19500000 - 20500000',
          child: Text('1.95 Crore to 2.05 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '20500000 - 21500000',
          child: Text('2.05 Crore to 2.15 Crore'),
        ),
      ];
    } else if (_selectedArea == '10 Marla   (2250 sq. ft.)' &&
        _selectedFloors == 'Double Storey' &&
        with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '20500000 - 21500000',
          child: Text('2.05 Crore to 2.15 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '21500000 - 22500000',
          child: Text('2.15 Crore to 2.25 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '22500000 - 23500000',
          child: Text('2.25 Crore to 2.35 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '23500000 - 24500000',
          child: Text('2.35 Crore to 2.45 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '24500000 - 25500000',
          child: Text('2.45 Crore to 2.55 Crore'),
        ),
      ];
    } else if (_selectedArea == '20 Marla | 1 Kanal   (4500 sq. ft.)' &&
        _selectedFloors == 'Single Storey' &&
        !with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '19500000 - 20500000',
          child: Text('1.95 Crore to 2.05 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '20500000 - 21500000',
          child: Text('2.05 Crore to 2.15 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '21500000 - 22500000',
          child: Text('2.15 Crore to 2.25 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '22500000 - 23500000',
          child: Text('2.25 Crore to 2.35 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '23500000 - 24500000',
          child: Text('2.35 Crore to 2.45 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '24500000 - 25500000',
          child: Text('2.45 Crore to 2.55 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '25500000 - 26500000',
          child: Text('2.55 Crore to 2.65 Crore'),
        ),
      ];
    } else if (_selectedArea == '20 Marla | 1 Kanal   (4500 sq. ft.)' &&
        _selectedFloors == 'Single Storey' &&
        with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '24500000 - 25500000',
          child: Text('2.45 Crore to 2.55 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '25500000 - 26500000',
          child: Text('2.55 Crore to 2.65 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '26500000 - 27500000',
          child: Text('2.65 Crore to 2.75 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '27500000 - 28500000',
          child: Text('2.75 Crore to 2.85 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '28500000 - 29500000',
          child: Text('2.85 Crore to 2.95 Crore'),
        ),
      ];
    } else if (_selectedArea == '20 Marla | 1 Kanal   (4500 sq. ft.)' &&
        _selectedFloors == 'Double Storey' &&
        !with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '29000000 - 30000000',
          child: Text('2.90 Crore to 3.00 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '30000000 - 31000000',
          child: Text('3.00 Crore to 3.10 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '31000000 - 32000000',
          child: Text('3.10 Crore to 3.20 Crore'),
        ),
      ];
    } else if (_selectedArea == '20 Marla | 1 Kanal   (4500 sq. ft.)' &&
        _selectedFloors == 'Double Storey' &&
        with_basement) {
      return [
        const DropdownMenuItem<String>(
          value: '34500000 - 35500000',
          child: Text('3.45 Crore to 3.55 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '35500000 - 36500000',
          child: Text('3.55 Crore to 3.65 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '36500000 - 37500000',
          child: Text('3.65 Crore to 3.75 Crore'),
        ),
        const DropdownMenuItem<String>(
          value: '37500000 - 38500000',
          child: Text('3.75 Crore to 3.85 Crore'),
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
