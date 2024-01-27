import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sampleapp/Settings.dart';

class Pack1 extends StatefulWidget {
  String user;
  List<String> selectedImages;

  Pack1({Key? key, required this.user, required this.selectedImages})
      : super(key: key);

  @override
  State<Pack1> createState() => _Pack1State();
}

class _Pack1State extends State<Pack1> {
  List<List<dynamic>> tableRows = generateRows(20);

  @override
  Widget build(BuildContext context) {
    return Package1Page(
      user: widget.user,
      selectedImages: widget.selectedImages,
      tableRows: tableRows,
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

  Package1Page({
    Key? key,
    required this.user,
    required this.selectedImages,
    required this.tableRows,
    required this.updateTable,
  }) : super(key: key);

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
              padding: pw.EdgeInsets.all(10.0),
              child: pw.Table.fromTextArray(
                context: context,
                cellAlignment: pw.Alignment.center,
                cellStyle: pw.TextStyle(
                  fontWeight: pw.FontWeight.bold,
                  fontSize: 18,
                ),
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                headers: ['Material', 'Cost', 'Quantity', 'Price'],
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
        title: const Text("Package No. 1"),
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
      body: SingleChildScrollView(
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
              const Text(
                'Package No. 1',
                style: TextStyle(
                  fontSize: 40,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const Divider(
                thickness: 2.0,
                color: Colors.white,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _displayPdf(context),
                child: const Text("Save PDF"),
              ),
              DataTable(
                columns: const [
                  DataColumn(label: Text('Material')),
                  DataColumn(label: Text('Cost')),
                  DataColumn(label: Text('Quantity')),
                  DataColumn(label: Text('Price')),
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
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

List<List<dynamic>> generateRows(int rowCount) {
  List<List<dynamic>> rows = [];

  for (int i = 1; i <= rowCount; i++) {
    final int cost = i * 10;
    final int quantity = i * 5;
    final int price = cost * quantity;

    rows.add([
      '$i',
      '$cost',
      '$quantity',
      '$price',
    ]);
  }

  return rows;
}
