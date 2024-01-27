import 'package:flutter/material.dart';
import 'package:sampleapp/Packages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FinalPackagePage(),
    );
  }
}

class FinalPackagePage extends StatefulWidget {
  const FinalPackagePage({super.key});

  @override
  State<FinalPackagePage> createState() => _FinalPackagePageState();
}

class _FinalPackagePageState extends State<FinalPackagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
              'Finalized Package',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.menu),
            onSelected: (value) {
              // Navigate to different screens based on the selected option
              if (value == 1) {
                Navigator.pushNamed(context, '/profile');
              } else if (value == 2) {
                Navigator.pushNamed(context, '/Settings');
              } else if (value == 3) {
                Navigator.pushNamed(context, '/logout');
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                child: Text('Aqsa Butt'), // Display the username at the top
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Profile'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('Settings'),
              ),
              const PopupMenuItem<int>(
                value: 3,
                child: Text('Log out'),
              ),
            ],
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: OutPut(),
          ),
        ),
      ),
    );
  }
}

class OutPut extends StatefulWidget {
  const OutPut({super.key});

  @override
  State<OutPut> createState() => _OutPutState();
}

class _OutPutState extends State<OutPut> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40.0),
        const Text(
          'Selected area of the house  : 10 Marla',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20.0),
        const Text(
          'Entered total budget for the house : 1 Crore',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20.0),
        const Text(
          'Selected no.of floors  : 2 Floors  ',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20.0),
        const Divider(
          thickness: 2.0, // Adjust the line thickness as needed
          color: Colors.blue, // Adjust the line color as needed
        ),
        const Text(
          'Selected Package   : Package No.1  ',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20.0),
        const Text(
          'Package details  \n Total cost : 1 Crore\n Grey Structure : 5,000,000\nFinishing Material : 5,000,000\n ',
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
          ),
          child: const SizedBox(
            width: 350,
            child: Text(
              'Save Layout & Plan (Premium)',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => PackagesPage(
            //       user: '',
            //     ),
            //   ),
            // );
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 85.0, vertical: 10.0),
          ),
          child: const SizedBox(
            width: 350,
            child: Text(
              'Save Layout & Plan ',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
