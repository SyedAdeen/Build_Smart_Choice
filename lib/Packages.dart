// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sampleapp/Package1.dart';
import 'package:sampleapp/Package2.dart';
import 'package:sampleapp/Package3.dart';
import 'package:sampleapp/Premium_Package.dart';
import 'package:sampleapp/Settings.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:sampleapp/UpgradeApp.dart';

import 'package:sampleapp/api_urls.dart'; // Add this line to import the 'dart:ui' library
import 'package:sampleapp/First_Screen.dart';

// ignore: must_be_immutable
class PackagesPage extends StatefulWidget {
  String user;
  List<String> selectedImages;
  final dynamic grey_data;
  final dynamic labour_data;
  final String budget;
  int input_range1 = 0;
  int input_range2 = 0;
  final String Storey;
  final String Area;
  final int layout_id;
  String? totalCost;
  String? labour_cost;
  String? finishing_cost;
  String? finishing2_cost;
  String? finishing3_cost;
  String? finishing4_cost;

  int TotalPackageCost = 0;
  int TotalPackageCost2 = 0;
  int TotalPackageCost3 = 0;
  int TotalPackageCost4 = 0;

  List<dynamic> pack1_finishing = [];
  List<dynamic> pack2_finishing = [];
  List<dynamic> pack3_finishing = [];
  List<dynamic> pack4_finishing = [];

  PackagesPage(
      {super.key,
      required this.user,
      required this.selectedImages,
      required this.grey_data,
      required this.labour_data,
      required this.budget,
      required this.Storey,
      required this.Area,
      required this.layout_id});

  @override
  State<PackagesPage> createState() => _PackagesPageState();
}

int rem_comma(String totalCost) {
  String no_comma = totalCost.replaceAll(',', '');
  String grey_costing = no_comma.split('.')[0];
  int final1 = int.parse(grey_costing);
  return final1;
}

class _PackagesPageState extends State<PackagesPage> {
  Future<void> fetch_db_data(
      int layout_id,
      int area,
      int Storey,
      List<double> package1,
      List<double> package2,
      List<double> package3,
      List<double> premium) async {
    try {
      debugPrint("Package Details = $package1");
      final response1 = await http.get(
        Uri.parse(
            '${ApiUrls.fetch_pack1_data}?set_id=$layout_id&area=$area&storey=$Storey&predicted_array=$package1'),
      );
      widget.pack1_finishing = json.decode(response1.body);
      debugPrint(widget.pack1_finishing.toString());
      var lastElement =
          widget.pack1_finishing[widget.pack1_finishing.length - 1];

      // debugPrint('Last element: $lastElement');
      widget.finishing_cost = lastElement.toString();
      debugPrint("Fetch Data of Pack1 ${widget.finishing_cost}");

      final response2 = await http.get(
        Uri.parse(
            '${ApiUrls.fetch_pack1_data}?set_id=$layout_id&area=$area&storey=$Storey&predicted_array=$package2'),
        // Pass any additional parameters as needed
      );

      widget.pack2_finishing = json.decode(response2.body);
      debugPrint(widget.pack2_finishing.toString());
      var lastElement2 =
          widget.pack2_finishing[widget.pack2_finishing.length - 1];

      // debugPrint('Last element: $lastElement');
      widget.finishing2_cost = lastElement2.toString();
      debugPrint("Fetch Data of Pack2 ${widget.finishing2_cost}");

      final response3 = await http.get(
        Uri.parse(
            '${ApiUrls.fetch_pack1_data}?set_id=$layout_id&area=$area&storey=$Storey&predicted_array=$package3'),
        // Pass any additional parameters as needed
      );
      widget.pack3_finishing = json.decode(response3.body);
      debugPrint(widget.pack3_finishing.toString());
      var lastElement3 =
          widget.pack3_finishing[widget.pack3_finishing.length - 1];

      // debugPrint('Last element: $lastElement');
      widget.finishing3_cost = lastElement3.toString();
      debugPrint("Fetch Data of Pack3 ${widget.finishing3_cost}");

      final response4 = await http.get(
        Uri.parse(
            '${ApiUrls.fetch_pack1_data}?set_id=$layout_id&area=$area&storey=$Storey&predicted_array=$premium'),
        // Pass any additional parameters as needed
      );
      widget.pack4_finishing = json.decode(response4.body);
      debugPrint(widget.pack4_finishing.toString());
      var lastElement4 =
          widget.pack4_finishing[widget.pack4_finishing.length - 1];

      // debugPrint('Last element: $lastElement');
      widget.finishing4_cost = lastElement4.toString();
      debugPrint("Fetch Data of Pack4 ${widget.finishing4_cost}");

      if (response1.statusCode == 200) {
        debugPrint("Successful1");
      }
      if (response2.statusCode == 200) {
        debugPrint("Successful2");
      }
      if (response3.statusCode == 200) {
        debugPrint("Successful3");
      }
      if (response4.statusCode == 200) {
        debugPrint("Successful4");
      } else {
        debugPrint(
            'Failed to fetch data: ${response1.statusCode}${response2.statusCode}${response3.statusCode}${response4.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }

  Future<void> recommendData(BuildContext context) async {
    if (widget.grey_data is List<dynamic>) {
      final lastItem = widget.grey_data.last;
      if (lastItem is String) {
        widget.totalCost = lastItem;
      }
      debugPrint(widget.totalCost);
    }

    if (widget.labour_data is List<dynamic>) {
      final lastItem = widget.labour_data.last;
      //print(widget.labour_data);

      if (lastItem is String) {
        widget.labour_cost = lastItem;
      }
    }

    int final1 = rem_comma(widget.totalCost.toString());
    debugPrint("Grey Costing = $final1");

    int final2 = rem_comma(widget.labour_cost.toString());
    debugPrint("Labour Costing = $final2");

    int final3 = final1 + final2;

    String finishing_range = widget.budget.toString().split(' - ')[0];
    widget.input_range1 = int.parse(finishing_range);
    widget.input_range1 = widget.input_range1 - final3;
    int first_two_dgits =
        int.parse(widget.input_range1.toString().substring(0, 2));
    int length = widget.input_range1.toString().length;
    length = length - 2;

    String rounded = first_two_dgits.toString();
    for (int i = 0; i < length; i++) {
      rounded += '0';
      widget.input_range1 = int.parse(rounded);
    }

    if (widget.Area == '7' && widget.Storey == '4') {
      widget.input_range1 = widget.input_range1 - 1000000;
    }

    if (widget.Area == '2' && widget.Storey == '4') {
      widget.input_range1 = widget.input_range1 - 1200000;
    }
    widget.input_range2 = widget.input_range1 + 1000000;
    debugPrint("Input Range 1 = ${widget.input_range1}");
    debugPrint("Input Range 2 = ${widget.input_range2}");
    debugPrint("Selected Layout Id = ${widget.layout_id}");

    // Accessing input_range1 from the PackagesPage widget
    int inputRange1 = widget.input_range1;
    int inputRange2 = widget.input_range2;
    int inputArea = int.parse(widget.Area);
    int inputStorey = int.parse(widget.Storey);
    List<double> package1_data =
        List.filled(42, 0.0); // Initialize with size 42 and default value 0.0
    List<double> package2_data = List.filled(42, 0.0);
    List<double> package3_data = List.filled(42, 0.0);
    List<double> premium_package_data = List.filled(42, 0.0);

    try {
      final response = await http.get(
        Uri.parse(
            '${ApiUrls.recommend_data}?min=$inputRange1&max=$inputRange2&area=$inputArea&floor=$inputStorey'),
        // Pass any additional parameters as needed
      );
      if (response.statusCode == 200) {
        debugPrint("Successful");

        List<dynamic> predictions = json.decode(response.body);
        debugPrint("Predictions $predictions");
        for (int i = 0; i < 42; i++) {
          package1_data[i] = predictions[i];
        }
        for (int i = 42, j = 0; i < 84; i++, j++) {
          package2_data[j] = predictions[i];
        }
        for (int i = 84, j = 0; i < 126; i++, j++) {
          package3_data[j] = predictions[i];
        }
        for (int i = 126, j = 0; i < 168; i++, j++) {
          premium_package_data[j] = predictions[i];
        }

        debugPrint("Package 1 Data = $package1_data");
        debugPrint("Package 2 Data = $package2_data");
        debugPrint("Package 3 Data = $package3_data");
        debugPrint("Premium Package Data = $premium_package_data");

        await fetch_db_data(widget.layout_id, inputArea, inputStorey,
            package1_data, package2_data, package3_data, premium_package_data);
        debugPrint(
            "finish cost at fetchdb func of Pack1 = ${widget.finishing_cost}");
        debugPrint("final3 at fetchdb func = $final3");

        debugPrint(
            "finish cost at fetchdb func of Pack2 = ${widget.finishing2_cost}");
        debugPrint("final3 at fetchdb func = $final3");

        debugPrint(
            "finish cost at fetchdb func of Pack3 = ${widget.finishing3_cost}");
        debugPrint("final3 at fetchdb func = $final3");

        debugPrint(
            "finish cost at fetchdb func of Pack4 = ${widget.finishing4_cost}");
        debugPrint("final3 at fetchdb func = $final3");

// Parse widget.finishing_cost to a double
        double? parsedFinishingCost =
            double.tryParse(widget.finishing_cost.toString());

        double? parsedFinishingCost2 =
            double.tryParse(widget.finishing2_cost.toString());

        double? parsedFinishingCost3 =
            double.tryParse(widget.finishing3_cost.toString());

        double? parsedFinishingCost4 =
            double.tryParse(widget.finishing4_cost.toString());
// Check if parsing was successful and the parsed value is not null
        if (parsedFinishingCost != null &&
            parsedFinishingCost2 != null &&
            parsedFinishingCost3 != null &&
            parsedFinishingCost4 != null) {
          // Round the parsed value to the nearest integer
          int roundedFinishingCost = parsedFinishingCost.round();
          int roundedFinishingCost2 = parsedFinishingCost2.round();
          int roundedFinishingCost3 = parsedFinishingCost3.round();
          int roundedFinishingCost4 = parsedFinishingCost4.round();
          // Add final3 to the rounded finishing cost
          int totalPackageCost = roundedFinishingCost + final3;
          debugPrint("Total Package1 Cost = $totalPackageCost");

          int totalPackageCost2 = roundedFinishingCost2 + final3;
          debugPrint("Total Package2 Cost = $totalPackageCost2");

          int totalPackageCost3 = roundedFinishingCost3 + final3;
          debugPrint("Total Package3 Cost = $totalPackageCost3");

          int totalPackageCost4 = roundedFinishingCost4 + final3;
          debugPrint("Total Package3 Cost = $totalPackageCost3");

          widget.TotalPackageCost = totalPackageCost;
          widget.TotalPackageCost2 = totalPackageCost2;
          widget.TotalPackageCost3 = totalPackageCost3;
          widget.TotalPackageCost4 = totalPackageCost4;

          widget.finishing_cost =
              removeLastCharacters(widget.finishing_cost.toString(), 2);

          widget.finishing2_cost =
              removeLastCharacters(widget.finishing2_cost.toString(), 2);

          widget.finishing3_cost =
              removeLastCharacters(widget.finishing3_cost.toString(), 2);

          widget.finishing4_cost =
              removeLastCharacters(widget.finishing4_cost.toString(), 2);
          widget.totalCost =
              removeLastCharacters(widget.totalCost.toString(), 3);
          widget.labour_cost =
              removeLastCharacters(widget.labour_cost.toString(), 3);
        } else {
          // Handle the case where parsing failed
          debugPrint("Error: Invalid format for finishing cost");
        }
      } else {
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
      // ...
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          _loadRecommendData(), // Assuming _loadRecommendData returns the Future from recommendData
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
                // Your app bar code here
                ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 60, 71, 194),
              automaticallyImplyLeading: false,
              title: Text("Packages | ${widget.budget.toString()}"),
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
                              content:
                                  const Text('Are you sure you want to Logout'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(false); // Cancel logout
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.popAndPushNamed(
                                        context, '/logout');
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
                padding: const EdgeInsets.all(40.0),
                child: Packs(
                  user: widget.user,
                  selectedImages: widget.selectedImages,
                  totalCost: widget.totalCost,
                  grey_data: widget.grey_data,
                  labour_cost: widget.labour_cost,
                  labour_data: widget.labour_data,
                  finish_cost:
                      formatAmount(int.parse(widget.finishing_cost.toString())),
                  packagecost: formatAmount(widget.TotalPackageCost),
                  finish_cost2: formatAmount(
                      int.parse(widget.finishing2_cost.toString())),
                  finish_data: widget.pack1_finishing,
                  finish_data2: widget.pack2_finishing,
                  package2cost: formatAmount(widget.TotalPackageCost2),
                  finish_cost3: formatAmount(
                      int.parse(widget.finishing3_cost.toString())),
                  finish_data3: widget.pack3_finishing,
                  package3cost: formatAmount(widget.TotalPackageCost3),
                  finish_cost4: formatAmount(
                      int.parse(widget.finishing4_cost.toString())),
                  finish_data4: widget.pack4_finishing,
                  package4cost: formatAmount(widget.TotalPackageCost4),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _loadRecommendData() async {
    await recommendData(context);
    // Initialize other variables required for building the UI
  }

  String addCommaAfterFirstDigit(String input) {
    // Check if the input string has at least one character
    if (input.isNotEmpty) {
      // Insert a comma after the first character using string concatenation
      return input.substring(0, 1) + ',' + input.substring(1);
    } else {
      // Return the input string as is if it is empty
      return input;
    }
  }

  String formatAmount(int amount) {
    String amountString = amount.toString();
    String formattedAmount = '';

    // Iterate through the amount string in reverse order
    for (int i = amountString.length - 1; i >= 0; i--) {
      // Add comma after every two digits for the first group
      if ((amountString.length - i) % 2 == 0 &&
          i > 0 &&
          i < amountString.length - 2) {
        formattedAmount = ',' + formattedAmount;
      }
      // Add comma before the last three digits
      if (i == amountString.length - 4) {
        //formattedAmount = ',' + formattedAmount;
      }
      formattedAmount = amountString[i] + formattedAmount;
    }
    if (formattedAmount.length == 10) {
      formattedAmount = addCommaAfterFirstDigit(formattedAmount);
    }

    return formattedAmount;
  }

  String removeLastCharacters(String input, int num) {
    // Check if the input string has at least two characters
    if (input.length >= num) {
      // Remove the last two characters using substring
      return input.substring(0, input.length - num);
    } else {
      // Return the input string as is if it has less than two characters
      return input;
    }
  }
}

// ignore: must_be_immutable
class Packs extends StatelessWidget {
  String user;
  List<String> selectedImages;
  final String? totalCost;
  final String? labour_cost;
  final String? finish_cost;
  final String? finish_cost2;
  final String? finish_cost3;
  final String? finish_cost4;

  final dynamic grey_data;
  final dynamic labour_data;
  final dynamic finish_data;
  final dynamic finish_data2;
  final dynamic finish_data3;
  final dynamic finish_data4;

  String packagecost;
  String package2cost;
  String package3cost;
  String package4cost;

  bool role = false;

  Packs(
      {super.key,
      required this.user,
      required this.selectedImages,
      required this.totalCost,
      required this.grey_data,
      required this.labour_cost,
      required this.labour_data,
      required this.finish_cost,
      required this.packagecost,
      required this.finish_data,
      required this.finish_cost2,
      required this.finish_data2,
      required this.package2cost,
      required this.finish_cost3,
      required this.finish_cost4,
      required this.finish_data3,
      required this.finish_data4,
      required this.package3cost,
      required this.package4cost});

  void showPremiumDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Premium Feature"),
          content: const Text(
              "Please upgrade to premium version to access this feature."),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 249, 64)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpgradeApp(),
                  ),
                );
              },
              child: const Text(
                'Buy Premium',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        role
            ? GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => Pack1(
                  //       user: user,
                  //       selectedImages: selectedImages,
                  //     ),
                  //   ),
                  // );
                },
                child: ColoredBox(
                  color: const Color.fromARGB(255, 188, 166, 46),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Package No.1 \n',
                            style: const TextStyle(
                              color: Colors.white,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 30, // Bold font weight
                            ),
                            children: [
                              const TextSpan(
                                text: 'Total cost: 1 Crore\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: 'Grey Strcuture Cost : $totalCost\n',
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                              const TextSpan(
                                text: 'Finishing material cost : 550,000 ',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            // : BackdropFilter(
            //     filter: ImageFilter.blur(
            //         sigmaX: 1.0,
            //         sigmaY: 1.0), // Adjust the sigma values for the blur effect
            //   child: IgnorePointer(
            //     ignoring: false, // Disable tap gesture
            //     child: ColoredBox(
            //       color: const Color.fromARGB(255, 205, 202, 183),
            //       child: Container(
            //         width: double.infinity,
            //         padding: const EdgeInsets.all(20.0),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             RichText(
            //               text: const TextSpan(
            //                 text: 'Package No.1 \n',
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                   height: 1.5,
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 30, // Bold font weight
            //                 ),
            //                 children: [
            //                   TextSpan(
            //                     text: 'Total cost: 1 Crore\n',
            //                     style: TextStyle(
            //                       fontWeight: FontWeight.normal,
            //                       fontSize: 15,
            //                     ),
            //                   ),
            //                   TextSpan(
            //                     text: 'Grey structure cost : 500,000\n',
            //                     style: TextStyle(
            //                       fontWeight: FontWeight.normal,
            //                       fontSize: 15,
            //                     ),
            //                   ),
            //                   TextSpan(
            //                     text: 'Finishing material cost : 550,000 ',
            //                     style: TextStyle(
            //                       fontWeight: FontWeight.normal,
            //                       fontSize: 15,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            : GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Pack1(
                        user: user,
                        selectedImages: selectedImages,
                        grey_data_pack: grey_data,
                        labourData: labour_data,
                        total_cost: totalCost,
                        labour_cost: labour_cost,
                        finishData: finish_data,
                        finish_cost: finish_cost,
                        pack_cost: packagecost,
                      ),
                    ),
                  );
                },
                child: ColoredBox(
                  color: const Color.fromARGB(255, 188, 166, 46),
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                            text: 'Package No.1 \n',
                            style: const TextStyle(
                              color: Colors.white,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 30, // Bold font weight
                            ),
                            children: [
                              TextSpan(
                                text: 'Total cost: $packagecost\n',
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: 'Grey Strcuture Cost : $totalCost\n',
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'Finishing Material Cost : $finish_cost\n',
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: 'Labour Cost : $labour_cost ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )),
                        ],
                      )),
                ),
              ),
        const SizedBox(height: 40.0),
        GestureDetector(
          onTap: () {
            if (FirstScreen.UserType == "N") {
              showPremiumDialog(context);
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Pack2(
                    user: user,
                    selectedImages: selectedImages,
                    grey_data_pack: grey_data,
                    labourData: labour_data,
                    total_cost: totalCost,
                    labour_cost: labour_cost,
                    finishData: finish_data2,
                    finish_cost: finish_cost2,
                    pack_cost: package2cost,
                  ),
                ),
              );
            }
          },
          child: ColoredBox(
            color: FirstScreen.UserType == "N" ? Colors.grey : Colors.green,
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                      text: 'Package No.2 \n',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        fontSize: 30, // Bold font weight
                      ),
                      children: [
                        TextSpan(
                          text: 'Total cost: $package2cost \n',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'Grey Strcuture Cost : $totalCost\n',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'Finishing Material Cost : $finish_cost2\n',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'Labour cost : $labour_cost ',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )),
                  ],
                )),
          ),
        ),
        const SizedBox(height: 40.0),
        GestureDetector(
          onTap: () {
            if (FirstScreen.UserType == "N") {
              showPremiumDialog(context);
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Pack3(
                    user: user,
                    selectedImages: selectedImages,
                    grey_data_pack: grey_data,
                    labourData: labour_data,
                    total_cost: totalCost,
                    labour_cost: labour_cost,
                    finishData: finish_data3,
                    finish_cost: finish_cost3,
                    pack_cost: package3cost,
                  ),
                ),
              );
            }
          },
          child: ColoredBox(
            color: FirstScreen.UserType == "N"
                ? Colors.grey
                : const Color.fromARGB(255, 42, 48, 42),
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                      text: 'Package No.3 \n',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        fontSize: 30, // Bold font weight
                      ),
                      children: [
                        TextSpan(
                          text: 'Total cost: $package3cost\n',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'Grey Strcuture Cost : $totalCost\n',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'Finishing Material Cost : $finish_cost3\n',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'Labour cost : $labour_cost ',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )),
                  ],
                )),
          ),
        ),
        const SizedBox(height: 40.0),
        GestureDetector(
          onTap: () {
            if (FirstScreen.UserType == "N") {
              showPremiumDialog(context);
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PremiumPack(
                    user: user,
                    selectedImages: selectedImages,
                    grey_data_pack: grey_data,
                    labourData: labour_data,
                    total_cost: totalCost,
                    labour_cost: labour_cost,
                    finishData: finish_data4,
                    finish_cost: finish_cost4,
                    pack_cost: package4cost,
                  ),
                ),
              );
            }
          },
          child: ColoredBox(
            color: FirstScreen.UserType == "N"
                ? Colors.grey
                : const Color.fromARGB(255, 186, 16, 4),
            child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                      text: 'Premium Package\n',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          height: 1.5),
                      children: [
                        TextSpan(
                          text: 'Total cost: $package4cost\n',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'Grey Strcuture Cost : $totalCost\n',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'Finishing Material Cost : $finish_cost4\n',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'Labour cost : $labour_cost ',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
