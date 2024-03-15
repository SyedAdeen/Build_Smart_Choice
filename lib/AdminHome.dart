import 'package:flutter/material.dart';
import 'package:sampleapp/FinishingMaterials.dart';
import 'package:sampleapp/GreyMaterials.dart';
import 'package:sampleapp/Labours.dart';
import 'package:sampleapp/Settings.dart';
import 'package:sampleapp/Users.dart';
import 'package:sampleapp/user_selection.dart';

// ignore: must_be_immutable
class AdminHome extends StatefulWidget {
  String user;

  AdminHome({super.key, required this.user});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 251, 18, 1),
          automaticallyImplyLeading: false,
          title: const Text("Admin"),
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
              const SizedBox(
                height: 40.0,
              ),
              SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.only(right: 60, left: 60),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UserSelection(user: widget.user),
                      ),
                    );
                  },
                  child: ColoredBox(
                    color: Colors.blue[900]!,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      width: double.infinity,
                      padding: const EdgeInsets.all(40.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.blue[900]!,
                            offset: const Offset(5, -5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: RichText(
                              text: const TextSpan(
                                text: 'Users and Feedbacks \n',
                                style: TextStyle(
                                  color: Colors.white,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20, // Bold font weight
                                ),
                              ),
                            ),
                          ),
                          // Add more widgets as needed
                        ],
                      ),
                    ),
                  ),
                ),
              )),
              const SizedBox(height: 50),
              SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.only(right: 60.0, left: 60.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GreyMaterials(
                                user: widget.user,
                              )));
                    },
                    child: ColoredBox(
                      color: Colors.blue[800]!,
                      child: Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        width: double.infinity,
                        padding: const EdgeInsets.all(40.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.blue[800]!,
                              offset: const Offset(5, -5),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: RichText(
                                text: const TextSpan(
                                  text: 'Grey Materials \n',
                                  style: TextStyle(
                                    color: Colors.white,
                                    height: 1.5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20, // Bold font weight
                                  ),
                                ),
                              ),
                            ),
                            // Add more widgets as needed
                          ],
                        ),
                      ),
                    )),
              )),
              const SizedBox(
                height: 50.0,
              ),
              SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.only(right: 60.0, left: 60.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Finishing(user: widget.user),
                      ),
                    );
                  },
                  child: ColoredBox(
                    color: Colors.blue[900]!,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      width: double.infinity,
                      padding: const EdgeInsets.all(40.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.blue[900]!,
                            offset: Offset(5, -5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: RichText(
                              text: const TextSpan(
                                text: 'Finishing Materials \n',
                                style: TextStyle(
                                  color: Colors.white,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20, // Bold font weight
                                ),
                              ),
                            ),
                          ),
                          // Add more widgets as needed
                        ],
                      ),
                    ),
                  ),
                ),
              )),
              const SizedBox(
                height: 50.0,
              ),
              SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.only(right: 60.0, left: 60.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LaboursData(user: widget.user),
                      ),
                    );
                  },
                  child: ColoredBox(
                    color: Colors.blue[800]!,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      width: double.infinity,
                      padding: const EdgeInsets.all(40.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.blue[800]!,
                            offset: Offset(5, -5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: RichText(
                              text: const TextSpan(
                                text: 'Labour Rates\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20, // Bold font weight
                                ),
                              ),
                            ),
                          ),
                          // Add more widgets as needed
                        ],
                      ),
                    ),
                  ),
                ),
              )),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
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
