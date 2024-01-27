import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'dart:async';

void main() {
  runApp(UpgradeApp());
}

class UpgradeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'In-App Purchase Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StreamSubscription<dynamic> _subscription;
  @override
  void initState() {
    super.initState();

    // Set up a stream subscription for purchase updates
    final Stream purchaseUpdated = InAppPurchase.instance.purchaseStream;

    _subscription = purchaseUpdated.listen(
      (purchaseDetailsList) {
        // Call a method to handle the purchase updates
        _listenToPurchaseUpdated(purchaseDetailsList);
      },
      onDone: () {
        // When the stream is done, cancel the subscription
        _subscription.cancel();
      },
      onError: (error) {
        // Handle errors here
        // You might want to display an error message or log the error
        print("Error during purchase stream: $error");
      },
    );
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    // Handle the purchase updates here
    // This method is called whenever there is a change in the user's purchases
    // You can check the purchase details and update your app's state accordingly
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // Handle pending purchases
        // You might want to show a loading indicator
      } else {
        // Handle completed purchases
        // You can unlock premium features, update UI, etc.
        print("Purchase details: ${purchaseDetails.productID}");
      }
    }
  }

  @override
  void dispose() {
    // Cancel the subscription when the widget is disposed
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upgrade To Premium Version'),
        backgroundColor: const Color.fromARGB(255, 60, 71, 194),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Upgrade to Premium',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Unlock premium features for an enhanced experience!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Trigger the purchase process when the button is pressed
                // You should implement your own logic here
              },
              child: Text('Upgrade Now'),
            ),
          ],
        ),
      ),
    );
  }
}
