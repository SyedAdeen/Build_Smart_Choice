import 'package:flutter/material.dart';
import 'package:sampleapp/AdminHome.dart';
import 'package:sampleapp/Feedback.dart';
import 'package:sampleapp/Help.dart';
import 'package:sampleapp/Packages.dart';
import 'package:sampleapp/Settings.dart';
import 'package:sampleapp/UpgradeApp.dart';
import 'package:sampleapp/input.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showPremiumBanner =
      true; // Add a flag to control when to show the premium banner

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _showPremiumBannerDialog();
    });
  }

  void _showPremiumBannerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Stack(
            children: [
              // Background Image
              Image.asset('Images/banner.png', fit: BoxFit.cover),

              // Close Button
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.yellow,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                ),
              ),

              // Buy Button
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 249, 64)),
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpgradeApp(),
                        ),
                      );
                    });
                  },
                  child: const Text(
                    'Buy Premium',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 60, 71, 194),
          automaticallyImplyLeading: false,
          title: const Text("Home"),
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
                        username: widget.username,
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
                      widget.username,
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(
                            255, 161, 147, 147), // Color of the shadow
                        offset: Offset(7,
                            1), // Adjust the horizontal and vertical offset here
                        blurRadius: 10,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // Apply the same radius here
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final String result = widget.username;
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InputPage(user: result),
                          ),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      // shadowColor: Colors.grey,
                      // elevation: 10,

                      foregroundColor: const Color.fromARGB(255, 60, 71, 194),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                    ),
                    icon: Container(
                      width: 87,
                      height: 87,
                      padding: const EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child:
                          Image.asset('Images/cost.png', height: 34, width: 34),
                    ),
                    label: const Text(
                      'Get Recommendation',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(
                            255, 161, 147, 147), // Color of the shadow
                        offset: Offset(7,
                            1), // Adjust the horizontal and vertical offset here
                        blurRadius: 10,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminHome(
                            user: widget.username,
                          ),
                        ),
                      );
                    },
                    // onPressed: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => HelpPage(
                    //         user: widget.username,
                    //       ),
                    //     ),
                    //   );
                    // },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 60, 71, 194),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                    ),
                    icon: Container(
                      width: 87,
                      height: 87,
                      // margin: EdgeInsets.only(right: 90),
                      // alignment: Alignment.centerLeft,
                      // padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child:
                          Image.asset('Images/help.png', height: 54, width: 54),
                    ),
                    label: const Text(
                      'Get Support                       ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                Container(
                  width: 300,
                  height: 100,
                  margin: const EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(
                            255, 161, 147, 147), // Color of the shadow
                        offset: Offset(7,
                            1), // Adjust the horizontal and vertical offset here
                        blurRadius: 10,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FeedbackPage(user: widget.username),
                          ));

                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         PackagesPage(user: widget.username),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 60, 71, 194),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                    ),
                    icon: Container(
                      width: 87,
                      height: 87,

                      // padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Image.asset('Images/5star.png',
                          height: 54, width: 54),
                    ),
                    label: const Text(
                      'Feedback                   ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: showPremiumBanner
            ? FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 60, 71, 194),
                onPressed: () {
                  // Show the premium banner dialog when the button is pressed
                  _showPremiumBannerDialog();
                },
                child:
                    const Icon(Icons.star), // You can use an appropriate icon
              )
            : null,
      ),
      onWillPop: () async {
        // Show a logout confirmation dialog
        bool logoutConfirmed = await showLogoutConfirmationDialog(context);

        // Return true to allow the back button press if the user confirms logout
        return logoutConfirmed;
      },
    );
  }

  Future<bool> showLogoutConfirmationDialog(BuildContext context) async {
    bool? logoutConfirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel logout
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform logout actions here
                Navigator.pushNamed(context, '/logout'); // Confirm logout
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );

    return logoutConfirmed ??
        false; // Default to false if logoutConfirmed is null
  }
}
