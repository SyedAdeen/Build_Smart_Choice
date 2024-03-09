import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sampleapp/Settings.dart';

class Pack2 extends StatefulWidget {
  String user;
  List<String> selectedImages;
  final dynamic grey_data_pack;

  Pack2({
    Key? key,
    required this.user,
    required this.selectedImages,
    required this.grey_data_pack,
  }) : super(key: key);

  @override
  State<Pack2> createState() => _Pack1State();
}

class _Pack1State extends State<Pack2> {
  late List<List<dynamic>> tableRows;

  @override
  void initState() {
    super.initState();
    // debugPrint(widget.grey_data_pack.toString());
    tableRows = generateRows(widget.grey_data_pack);
  }

  @override
  Widget build(BuildContext context) {
    return Package1Page(
      user: widget.user,
      selectedImages: widget.selectedImages,
      tableRows: tableRows,
      grey_data_pack: widget.grey_data_pack,
      updateTable: (newRows) {
        setState(() {
          tableRows = newRows;
        });
      },
    );
  }
}

// ignore: must_be_immutable
class Package1Page extends StatefulWidget {
  String user;
  List<String> selectedImages;
  List<List<dynamic>> tableRows;
  ValueChanged<List<List<dynamic>>> updateTable;
  final dynamic grey_data_pack;

  Package1Page(
      {Key? key,
      required this.user,
      required this.selectedImages,
      required this.tableRows,
      required this.updateTable,
      required this.grey_data_pack})
      : super(key: key);

  @override
  State<Package1Page> createState() => _Package1PageState();
}

class _Package1PageState extends State<Package1Page> {
  Future<void> _displayPdf(BuildContext context) async {
    final images = await _loadImages(widget.selectedImages);

    final pdfBytes = await _generatePdf(images, widget.tableRows);
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfBytes,
      name: 'Package1.pdf',
    );
  }

  Future<List<Uint8List>> _loadImages(List<String> imageList) async {
    final List<Uint8List> images = [];

    for (String base64Image in imageList) {
      final imageData = base64Decode(base64Image);
      images.add(imageData);
    }

    return images;
  }

  Future<Uint8List> _generatePdf(
      List<Uint8List> images, List<List<dynamic>> tableRows) async {
    final doc = pw.Document();

    for (int i = 0; i < images.length; i++) {
      doc.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(pw.MemoryImage(images[i])),
            );
          },
        ),
      );
    }

    // Add your DataTable to the page with a larger font size (18)
    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Container(
              padding: pw.EdgeInsets.all(1.0),
              // ignore: deprecated_member_use
              child: pw.Table.fromTextArray(
                context: context,
                cellAlignment: pw.Alignment.center,
                cellStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 8,
                ),
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                headers: [
                  'Material',
                  'Brand',
                  'Factor',
                  'Rate',
                  'Quantity',
                  'Cost'
                ],
                data: tableRows,
              ),
            ),
          ];
        },
      ),
    );

    final pdfBytes = await doc.save();
    return pdfBytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 71, 194),
        automaticallyImplyLeading: false,
        title: const Text("Package No. 2"),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 32,
            ),
            onSelected: (value) {
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
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/logout');
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                child: ListTile(
                  leading: const Icon(
                    Icons.account_circle,
                    color: Colors.blue,
                  ),
                  title: Text(
                    widget.user,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.green,
                  ),
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const PopupMenuItem<int>(
                value: 3,
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Log out',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // body: SingleChildScrollView(
      //   // scrollDirection: Axis.horizontal,
      //   child: Padding(
      //     padding: const EdgeInsets.all(20.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Container(
      //           margin: const EdgeInsets.only(left: 40, right: 30),
      //           height: 350,
      //           child: ListView.builder(
      //             scrollDirection: Axis.horizontal,
      //             itemCount: widget.selectedImages.length,
      //             itemBuilder: (context, index) {
      //               return Image.memory(
      //                 // ignore: unnecessary_null_comparison
      //                 widget.selectedImages[index] != null
      //                     ? base64Decode(widget.selectedImages[index])
      //                     : Uint8List(0),
      //               );
      //             },
      //           ),
      //         ),
      //         const SizedBox(height: 30),
      //         // const Text(
      //         //   'Package No. 1',
      //         //   style: TextStyle(
      //         //     fontSize: 40,
      //         //     color: Color.fromARGB(255, 0, 0, 0),
      //         //   ),
      //         // ),
      //         const Divider(
      //           thickness: 2.0,
      //           color: Color.fromARGB(255, 0, 0, 0),
      //         ),
      //         const SizedBox(height: 30),
      //         ElevatedButton(
      //           onPressed: () => _displayPdf(context),
      //           child: const Text("Save PDF"),
      //         ),
      //         SingleChildScrollView(
      //           scrollDirection: Axis.horizontal,
      //           child: DataTable(
      //             columns: [
      //               DataColumn(label: Text('Material')),
      //               DataColumn(label: Text('Brand')),
      //               DataColumn(label: Text('Factor')),
      //               DataColumn(label: Text('Rate')),
      //               // Uncomment to add more columns
      //               DataColumn(label: Text('Quantity')),
      //               DataColumn(label: Text('Cost')),
      //             ],
      //             rows: widget.tableRows
      //                 .map(
      //                   (row) => DataRow(
      //                     cells: row
      //                         .map(
      //                           (item) => DataCell(
      //                             Text(item.toString()),
      //                           ),
      //                         )
      //                         .toList(),
      //                   ),
      //                 )
      //                 .toList(),
      //           ),
      //         ),
      //         const SizedBox(height: 30),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 40, right: 30),
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.selectedImages.length,
                  itemBuilder: (context, index) {
                    return Image.memory(
                      // ignore: unnecessary_null_comparison
                      widget.selectedImages[index] != null
                          ? base64Decode(widget.selectedImages[index])
                          : Uint8List(0),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              const Divider(
                thickness: 2.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _displayPdf(context),
                child: const Text("Save PDF"),
              ),
              const SizedBox(
                  height: 20), // Add some space between button and heading
              const Text(
                'Grey Structure Cost', // Heading text
                style: TextStyle(
                  fontSize: 24, // Adjust the font size as needed
                  fontWeight: FontWeight.bold, // Make the heading bold
                ),
              ),
              const SizedBox(
                  height: 10), // Add some space between heading and total cost
              Text(
                'Total Cost: ${widget.grey_data_pack[1]}', // Display total cost
                style: const TextStyle(
                  fontSize: 18, // Adjust the font size as needed
                  fontWeight: FontWeight.bold, // Make the total cost bold
                ),
              ),
              const SizedBox(
                  height:
                      20), // Add some space between total cost and DataTable
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Material')),
                    DataColumn(label: Text('Brand')),
                    DataColumn(label: Text('Factor')),
                    DataColumn(label: Text('Rate')),
                    DataColumn(label: Text('Quantity')),
                    DataColumn(label: Text('Cost')),
                  ],
                  rows: widget.tableRows
                      .map(
                        (row) => DataRow(
                          cells: row
                              .map(
                                (item) => DataCell(
                                  Text(item.toString()),
                                ),
                              )
                              .toList(),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

List<List<dynamic>> generateRows(dynamic greyDataPack) {
  List<List<dynamic>> rows = [];

  if (greyDataPack is List && greyDataPack.isNotEmpty) {
    List<dynamic>? data = greyDataPack[0];
    if (data != null) {
      for (var sublist in data) {
        if (sublist is List && sublist.length >= 6) {
          final String material = sublist[0]?.toString() ?? '';
          final String brand = sublist[1]?.toString() ?? '';
          final String factor = sublist[2]?.toString() ?? '';
          final int cost = (sublist[3] is num) ? sublist[3].toInt() : 0;
          final int quantity = (sublist[4] is num) ? sublist[4].toInt() : 0;
          final int price = (sublist[5] is num) ? sublist[5].toInt() : 0;

          rows.add([
            material,
            brand,
            factor,
            cost.toString(),
            quantity.toString(),
            price.toString(),
          ]);
        }
      }
    } else {
      // If data is null or empty, add a row with "No Data" message
      rows.add([
        'No Data',
        'No Data',
        'No Data',
        'No Data',
        'No Data',
        'No Data',
      ]);
    }
  }

  return rows;
}
