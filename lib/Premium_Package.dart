import 'package:flutter/material.dart';
import 'package:sampleapp/Final_Package.dart';
import 'package:sampleapp/Settings.dart';

// ignore: must_be_immutable
class PremiumPack extends StatefulWidget {
  String user;
  PremiumPack({super.key, required this.user});

  @override
  State<PremiumPack> createState() => _PremiumPackState();
}

class _PremiumPackState extends State<PremiumPack> {
  @override
  Widget build(BuildContext context) {
    return PremiumPackagePage(user: widget.user);
  }
}

// ignore: must_be_immutable
class PremiumPackagePage extends StatefulWidget {
  String user;
  PremiumPackagePage({super.key, required this.user});

  @override
  State<PremiumPackagePage> createState() => _PremiumPackagePageState();
}

class _PremiumPackagePageState extends State<PremiumPackagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 71, 194),
        automaticallyImplyLeading: false,
        title: const Text("Premium Package"),
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
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Premium Pcakage ',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              const Divider(
                thickness: 2.0, // Adjust the line thickness as needed
                color: Colors.white, // Adjust the line color as needed
              ),
              const SizedBox(height: 30),
              const Text(
                ' * Grey Structure 5,000,000',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                ' Cement 10,000\n Rohri 58,00\n Soil 7000\n Bajri 5000\n Bricks 12,000\n Sariya 4000\n ',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                ' * Finishing Material 5,000,000',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                ' Gate 9000\n Tiles 6000\n Glass 8000\n Doors 14,000\n Windows 12,000\n Wardrobes 14,000\n ',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 500),
              const Text(
                ' Total Cost 1 Crore',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FinalPackagePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 100.0, vertical: 10.0),
                ),
                child: const SizedBox(
                  width: 350,
                  child: Text(
                    'Confirm Package ',
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
    );
  }
}
