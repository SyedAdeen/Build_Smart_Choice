import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'package:photo_view/photo_view.dart';
import 'package:sampleapp/Package1.dart';
import 'package:sampleapp/Packages.dart';
import 'dart:async';
import 'api_urls.dart';
import 'Settings.dart';

// ignore: must_be_immutable
class ImageListScreen extends StatefulWidget {
  final String user;
  String storey;
  String area;
  String budget;

  ImageListScreen(
      {Key? key,
      required this.user,
      required this.storey,
      required this.area,
      required this.budget})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ImageListScreenState createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  List<Map<String, dynamic>> imagesData = [];
  bool isLoading = true;
  List<String> selectedImages = [];

  @override
  void initState() {
    super.initState();
    widget.storey = "1";
    debugPrint("Storey = ${widget.storey}");
    debugPrint("Area = ${widget.area}");
    fetchImagesData();
  }

  Future<void> fetchImagesData() async {
    try {
      debugPrint("Budget Selected  =  ${widget.budget}");
      if (widget.area == 1.toString()) {
        final response = await http.get(
            Uri.parse('${ApiUrls.baseUrl}/get_images1?table_name=layout_10'));
        //debugPrint('Response Body: ${response.body}');

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          setState(() {
            imagesData = List<Map<String, dynamic>>.from(data);
            isLoading = false;
          });
        }
      } else if (widget.area == 2.toString()) {
        final response = await http.get(
            Uri.parse('${ApiUrls.baseUrl}/get_images1?table_name=layout_20'));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          setState(() {
            imagesData = List<Map<String, dynamic>>.from(data);
            isLoading = false;
          });
        }
      } else {
        final response = await http
            .get(Uri.parse(
                '${ApiUrls.baseUrl}/get_images1?table_name=layout_${widget.area}'))
            .timeout(const Duration(seconds: 120));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          setState(() {
            imagesData = List<Map<String, dynamic>>.from(data);
            isLoading = false;
          });
        }
      }
    } catch (error) {
      debugPrint('Error fetching images: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _onSelectButtonPressed(List<String> images, int id) async {
    // setState(() {
    // });
    selectedImages = List<String>.from(images);

    try {
      if (widget.area == 1.toString()) {
        final response = await http.get(
            Uri.parse('${ApiUrls.singlestorypackage}?area=10 MARLA&set=$id'));
        // debugPrint('Response Body: ${response.body}');

        final response2 = await http.get(Uri.parse(
            '${ApiUrls.laboursinglestorypackage}?area=10 MARLA&set=$id'));

        debugPrint('Response Body2: ${response2.body}');

        if (response.statusCode == 200 && response2.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);
          final List<dynamic> data2 = json.decode(response2.body);

          // debugPrint(data as String?);
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PackagesPage(
                user: widget.user,
                selectedImages: selectedImages,
                grey_data: data,
                labour_data: data2,
                budget: widget.budget,
                Storey: widget.storey,
                Area: widget.area,
                layout_id: id,
              ),
            ),
          );
        }
      } else if (widget.area == 2.toString()) {
        final response = await http.get(
            Uri.parse('${ApiUrls.singlestorypackage}?area=20 MARLA&set=$id'));

        final response2 = await http.get(Uri.parse(
            '${ApiUrls.laboursinglestorypackage}?area=20 MARLA&set=$id'));

        debugPrint('Response Body2: ${response2.body}');

        if (response.statusCode == 200 && response2.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);
          final List<dynamic> data2 = json.decode(response2.body);

          // debugPrint(data as String?);
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PackagesPage(
                user: widget.user,
                selectedImages: selectedImages,
                grey_data: data,
                labour_data: data2,
                budget: widget.budget,
                Storey: widget.storey,
                Area: widget.area,
                layout_id: id,
              ),
            ),
          );
        }
      } else {
        final response = await http.get(Uri.parse(
            '${ApiUrls.singlestorypackage}?area=${widget.area} MARLA&set=$id'));

        final response2 = await http.get(Uri.parse(
            '${ApiUrls.laboursinglestorypackage}?area=${widget.area} MARLA&set=$id'));

        debugPrint('Response Body1: ${response.body}');
        debugPrint('Response Body2: ${response2.body}');

        if (response.statusCode == 200 && response2.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);
          final List<dynamic> data2 = json.decode(response2.body);

          // debugPrint(data as String?);
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PackagesPage(
                user: widget.user,
                selectedImages: selectedImages,
                grey_data: data,
                labour_data: data2,
                budget: widget.budget,
                Storey: widget.storey,
                Area: widget.area,
                layout_id: id,
              ),
            ),
          );
        }
      }
    } catch (error) {
      debugPrint('Error : $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  void _openZoomableImage(String imageUrl, int planId, String storeyFloor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageZoomScreen(
          imageUrl: imageUrl,
          id: planId,
          storey: storeyFloor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.area == 2.toString()
            ? 'Floor Plans: 20 Marla | 1 Kanal'
            : widget.area == 1.toString()
                ? 'Floor Plans: 10 Marla'
                : 'Floor Plans: ${widget.area} Marla'),
        backgroundColor: const Color.fromARGB(255, 60, 71, 194),
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
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : imagesData.isEmpty
              ? const Center(
                  child: Text('No images available.'),
                )
              : Container(
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: imagesData.length,
                    itemBuilder: (context, index) {
                      final imageData = imagesData[index];
                      final id = imageData['id'];
                      final groundFloor = imageData['ground_floor'];
                      final firstFloor = imageData['rooftop'];

                      String ground = "Ground";
                      String first = "Rooftop";

                      return Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Column(
                          children: [
                            ListTile(
                              title: Center(
                                child: Text(
                                  'Set # $id',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _openZoomableImage(
                                            groundFloor, id, ground);
                                      },
                                      child: Image.memory(
                                        groundFloor != null
                                            ? base64Decode(groundFloor)
                                            : Uint8List(0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        _openZoomableImage(
                                            firstFloor, id, first);
                                      },
                                      child: Image.memory(
                                        firstFloor != null
                                            ? base64Decode(firstFloor)
                                            : Uint8List(0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                onPressed: () {
                                  _onSelectButtonPressed(
                                      [groundFloor, firstFloor], id);
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: const Color.fromARGB(
                                      255, 60, 71, 194), // Text color
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 12), // Button padding
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Button border radius
                                  ),
                                ),
                                child: const Text(
                                  'Select',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}

class ImageZoomScreen extends StatelessWidget {
  final String imageUrl;
  final int id;
  final String storey;

  const ImageZoomScreen(
      {Key? key,
      required this.imageUrl,
      required this.id,
      required this.storey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set# $id | $storey Floor"),
        backgroundColor: const Color.fromARGB(255, 60, 71, 194),
      ),
      body: PhotoView(
        imageProvider: MemoryImage(base64Decode(imageUrl)),
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 2,
      ),
    );
  }
}
