// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleapp/Settings.dart';

class HelpPage extends StatelessWidget {
  final String user;

  const HelpPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 71, 194),
        title: const Text("Help and Support"),
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
                      username: user,
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
                    user,
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
            Stack(
              children: [
                ClipPath(
                  clipper: CircleClipper(),
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 0,
                      left: 0,
                      right: 0,
                    ),
                    // color: Color.fromARGB(255, 255, 255, 255), //Back Color
                    height: 150.0,

                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 80,
                      ),
                      child: Center(
                        child: Text(
                          'Guidance',
                          style: GoogleFonts.gruppo(
                              color: const Color.fromARGB(255, 60, 71, 194),
                              fontSize: 45.0,
                              fontWeight: FontWeight.bold),
                          // style: GoogleFonts.gruppo(
                          //   color: Color.fromARGB(255, 60, 71, 194),

                          //   fontSize: 35.0,
                          //   fontWeight: FontWeight.bold,
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Colored Box with Curved Edges
                Container(
                  margin: const EdgeInsets.only(
                    top: 70.0,
                    left: 8,
                    right: 8,
                  ), // Adjust to control space
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 60, 71, 194), // Box color
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Cost Calculation',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const SizedBox(height: 10.0),
                        NumberedText(
                            '1. Select your plot size from the given\n     options'),
                        const SizedBox(height: 7.0),
                        NumberedText('2. Select number of Floors'),
                        const SizedBox(height: 7.0),
                        NumberedText(
                            '3. Provide your overall budget for the\n    House Construction in PKR'),
                        const SizedBox(height: 7.0),
                        NumberedText(
                            '4. We will provide you floor plans\n     according to your plot size'),
                        const SizedBox(height: 7.0),
                        NumberedText('5.  Select your preferred floor plan'),
                        const SizedBox(height: 7.0),
                        NumberedText(
                            '6.  We will recommend 1 option as\n      per your budget and 1 suggested\n      package for your consideration '),
                        const SizedBox(height: 5.0),
                        const SizedBox(height: 5.0),
                        const SizedBox(height: 10.0),
                        const SizedBox(height: 10.0),
                        const Text(
                          'Premium Version Feature',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const SizedBox(height: 10.0),
                        NumberedText(
                            '1.  We will recommend 3 options as\n      per your budget and 1 premium\n      package for your consideration '),
                        const SizedBox(height: 7.0),
                        NumberedText(
                            '2.   You can view and access all layouts'),
                        const SizedBox(height: 7.0),

                        NumberedText(
                            '3.   You can save  layouts with their \n       packages'),
                        const SizedBox(height: 5.0),

                        const SizedBox(height: 10.0),
                        const SizedBox(height: 10.0),
                        const SizedBox(height: 15.0),
                        // Add more NumberedText widgets as needed
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black, // Background color
                borderRadius:
                    BorderRadius.circular(20.0), // Adjust the radius as needed
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 18, 18, 18)
                        .withOpacity(0.5), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: const Offset(
                        5, 5), // Offset (controls the shadow's position)
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "Mail us at bschoice@gmail.com for Support",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // Text color
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic, // Text style (italic)
                    letterSpacing: 1.2, // Letter spacing
                    // Underline color
                    decorationThickness: 2.0, // Underline thickness
                  ),
                ),
              ),
            )

            // Add more content below the circle and colored box
            // const SizedBox(height: 100.0), // Placeholder for additional content
          ],
        ),
      ),
    );
  }
}

class NumberedText extends StatelessWidget {
  final String text;

  NumberedText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width / 2, 1.0),
        radius: size.width,
      ));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
