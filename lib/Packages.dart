// ignore: file_names
import 'package:flutter/material.dart';
import 'package:sampleapp/Package1.dart';
import 'package:sampleapp/Package2.dart';
import 'package:sampleapp/Package3.dart';
import 'package:sampleapp/Premium_Package.dart';
import 'package:sampleapp/Settings.dart';
import 'dart:ui'; // Add this line to import the 'dart:ui' library

// ignore: must_be_immutable
class PackagesPage extends StatefulWidget {
  String user;
  List<String> selectedImages;
  final dynamic grey_data;
  final dynamic labour_data;

  PackagesPage(
      {super.key,
      required this.user,
      required this.selectedImages,
      required this.grey_data,
      required this.labour_data});

  @override
  State<PackagesPage> createState() => _PackagesPageState();
}

class _PackagesPageState extends State<PackagesPage> {
  @override
  Widget build(BuildContext context) {
    String? totalCost;
    if (widget.grey_data is List<dynamic>) {
      final lastItem = widget.grey_data.last;
      if (lastItem is String) {
        totalCost = lastItem;
      }
      debugPrint(totalCost);
    }

    String? labour_cost;
    if (widget.labour_data is List<dynamic>) {
      final lastItem = widget.labour_data.last;
      print(widget.labour_data);

      if (lastItem is String) {
        labour_cost = lastItem;
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 71, 194),
        automaticallyImplyLeading: false,
        title: const Text("Packages"),
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
          padding: const EdgeInsets.all(40.0),
          child: Packs(
            user: widget.user,
            selectedImages: widget.selectedImages,
            totalCost: totalCost,
            grey_data: widget.grey_data,
            labour_cost: labour_cost,
            labour_data: widget.labour_data,
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Packs extends StatelessWidget {
  String user;
  List<String> selectedImages;
  final String? totalCost;
  final String? labour_cost;

  final dynamic grey_data;
  final dynamic labour_data;

  bool role = false;

  Packs(
      {super.key,
      required this.user,
      required this.selectedImages,
      required this.totalCost,
      required this.grey_data,
      required this.labour_cost,
      required this.labour_data});

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
                          labour_cost: labour_cost),
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
                                text: 'Finishing material cost : 550,000\n',
                                style: TextStyle(
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Pack2(
                    user: user,
                    selectedImages: selectedImages,
                    grey_data_pack: grey_data,
                    labourData: labour_data,
                    total_cost: totalCost,
                    labour_cost: labour_cost),
              ),
            );
          },
          child: ColoredBox(
            color: Colors.green,
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
                          text: 'Finishing material cost : 550,000\n',
                          style: TextStyle(
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Pack3(
                    user: user,
                    selectedImages: selectedImages,
                    grey_data_pack: grey_data,
                    labourData: labour_data,
                    total_cost: totalCost,
                    labour_cost: labour_cost),
              ),
            );
          },
          child: ColoredBox(
            color: const Color.fromARGB(255, 42, 48, 42),
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
                          text: 'Finishing material cost : 550,000\n',
                          style: TextStyle(
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PremiumPack(
                    user: user,
                    selectedImages: selectedImages,
                    grey_data_pack: grey_data,
                    labourData: labour_data,
                    total_cost: totalCost,
                    labour_cost: labour_cost),
              ),
            );
          },
          child: ColoredBox(
            color: const Color.fromARGB(255, 186, 16, 4),
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
                        const TextSpan(
                          text: 'Total cost: 2 Crore\n',
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
                          text: 'Finishing material cost : 1,000,000\n',
                          style: TextStyle(
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
