// ignore_for_file: use_key_in_widget_constructors, file_names

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
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;

  @override
  void initState() {
    super.initState();

    // Set up a stream subscription for purchase updates
    final Stream purchaseUpdated = _inAppPurchase.purchaseStream;

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
        debugPrint("Error during purchase stream: $error");
      },
    );
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        // Handle pending purchases
        // You might want to show a loading indicator
      } else if (purchaseDetails.status == PurchaseStatus.purchased) {
        // Handle completed purchases
        // You can unlock premium features, update UI, etc.
        debugPrint("Purchase details: ${purchaseDetails.productID}");
      }
    }
  }

  // Future<void> _initiatePurchase() async {
  //   try {
  //     final bool available = await _inAppPurchase.isAvailable();
  //     if (available) {
  //       // Replace 'your_product_id_here' with your actual product ID
  //       final ProductDetailsResponse productDetails =
  //           await _inAppPurchase.queryProductDetails({'your_product_id_here'});
  //       final ProductDetails productDetail =
  //           productDetails.productDetails.first;
  //       final PurchaseParam purchaseParam =
  //           PurchaseParam(productDetails: productDetail);
  //       await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  //     } else {
  //       // In-app purchase is not available on this device
  //       debugPrint("In-app purchase is not available on this device.");
  //     }
  //   } catch (e) {
  //     // Handle errors here
  //     debugPrint("Error during purchase initiation: $e");
  //   }
  // }

  Future<void> _initiatePurchase() async {
    try {
      final bool available = await _inAppPurchase.isAvailable();
      if (available) {
        // Dummy product details for testing
        final ProductDetails dummyProduct = ProductDetails(
          id: '23',
          title: 'Dummy Product',
          description: 'This is a dummy product for testing.',
          price: '0.99', // Replace with the actual price
          currencyCode: 'USD',
          rawPrice: 0.99,
        );

        final PurchaseParam purchaseParam =
            PurchaseParam(productDetails: dummyProduct);
        await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
      } else {
        // In-app purchase is not available on this device
        debugPrint("In-app purchase is not available on this device.");
      }
    } catch (e) {
      // Handle errors here
      debugPrint("Error during purchase initiation: $e");
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  _initiatePurchase, // Call the method when the button is pressed
              child: const Text('Upgrade Now'),
            ),
          ],
        ),
      ),
    );
  }
}
