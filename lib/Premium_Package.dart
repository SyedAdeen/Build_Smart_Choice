import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sampleapp/Settings.dart';

class PremiumPack extends StatefulWidget {
  String user;
  List<String> selectedImages;
  final dynamic grey_data_pack;
  final dynamic labourData;
  final dynamic finishData;
  String? labour_cost;
  String? total_cost;
  String? finish_cost;
  String? pack_cost;

  PremiumPack(
      {Key? key,
      required this.user,
      required this.selectedImages,
      required this.grey_data_pack,
      required this.labourData,
      required this.labour_cost,
      required this.total_cost,
      required this.finish_cost,
      required this.finishData,
      required this.pack_cost})
      : super(key: key);

  @override
  State<PremiumPack> createState() => _PremiumPackState();
}

class _PremiumPackState extends State<PremiumPack> {
  late List<List<dynamic>> greyTableRows;
  late List<List<dynamic>> labourTableRows;
  String? greyTotalCost;
  String? labourTotalCost;
  late List<List<dynamic>> finishTableRows;
  String? finishingTotalCost;

  @override
  void initState() {
    super.initState();
    greyTableRows = generateRows(widget.grey_data_pack);
    labourTotalCost = widget.labour_cost;
    finishTableRows = generatefinishingRows(widget.finishData);
    debugPrint("\n\n\n\n Finish Table Rows = $finishTableRows");
    finishingTotalCost = widget.finish_cost;
    debugPrint("Heelllloiiiiiiiii");
    debugPrint("Finish Data = ${widget.finishData}");
    debugPrint("Finish cost = ${widget.finish_cost}");
    debugPrint(widget.labour_cost);
    greyTotalCost = widget.total_cost;
    labourTableRows = generateLabourRows(widget.labourData);

    // greyTotalCost = (widget.grey_data_pack[1] is num)
    //     ? widget.grey_data_pack[1].toString()
    //     : '';
    // labourTotalCost =
    //     (widget.labourData is List && widget.labourData.isNotEmpty)
    //         ? widget.labourData
    //             .map((e) => e[1])
    //             .whereType<num>() // Filter out non-numeric values
    //             .fold(0, (a, b) => a + (b as num)) // Perform addition safely
    //             .toString()
    //         : '';
  }

  @override
  Widget build(BuildContext context) {
    return PremiumPackage(
        user: widget.user,
        selectedImages: widget.selectedImages,
        greyTableRows: greyTableRows,
        labourTableRows: labourTableRows,
        greyTotalCost: greyTotalCost,
        labourTotalCost: labourTotalCost,
        finishingTotalCost: finishingTotalCost,
        finishTableRows: finishTableRows,
        packCost: widget.pack_cost);
  }
}

class PremiumPackage extends StatefulWidget {
  String user;
  List<String> selectedImages;
  List<List<dynamic>> greyTableRows;
  List<List<dynamic>> labourTableRows;
  String? greyTotalCost;
  String? labourTotalCost;
  List<List<dynamic>> finishTableRows;
  String? finishingTotalCost;
  String? packCost;

  PremiumPackage(
      {Key? key,
      required this.user,
      required this.selectedImages,
      required this.greyTableRows,
      required this.labourTableRows,
      required this.greyTotalCost,
      required this.labourTotalCost,
      required this.finishTableRows,
      required this.finishingTotalCost,
      required this.packCost})
      : super(key: key);

  @override
  State<PremiumPackage> createState() => _PremiumPackageState();
}

class _PremiumPackageState extends State<PremiumPackage> {
  Future<void> _displayPdf(BuildContext context) async {
    final images = await _loadImages(widget.selectedImages);

    final pdfBytes = await _generatePdf(
        images,
        widget.greyTableRows,
        widget.labourTableRows,
        widget.greyTotalCost,
        widget.labourTotalCost,
        widget.finishTableRows,
        widget.finishingTotalCost);
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
      List<Uint8List> images,
      List<List<dynamic>> greyTableRows,
      List<List<dynamic>> labourTableRows,
      String? greyTotalCost,
      String? labourTotalCost,
      List<List<dynamic>> finishTableRows,
      String? finishingTotalCost) async {
    final doc = pw.Document();
    debugPrint("Finishing data Rows as PDF = $finishTableRows");
    debugPrint("Grey data Rows as PDF = $greyTableRows");

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

    // Add Grey Structure Cost table
    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Container(
              padding: pw.EdgeInsets.all(1.0),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Grey Structure Cost',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text('Total Cost: $greyTotalCost',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Table.fromTextArray(
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
                    data: greyTableRows,
                  ),
                ],
              ),
            ),
          ];
        },
      ),
    );

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Container(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Finishing Materials Cost',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text('Total Cost: $finishingTotalCost',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Table.fromTextArray(
                    context: context,
                    cellAlignment: pw.Alignment.center,
                    cellStyle: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 5,
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
                    data: finishTableRows,
                  ),
                ],
              ),
            ),
          ];
        },
      ),
    );

    // Add Labour Cost table if data is available
    if (labourTableRows.isNotEmpty) {
      doc.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return [
              pw.Container(
                padding: pw.EdgeInsets.all(1.0),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Labour Cost',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text('Total Cost: $labourTotalCost',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Table.fromTextArray(
                      context: context,
                      cellAlignment: pw.Alignment.center,
                      cellStyle: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 8,
                      ),
                      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      headers: ['Type', 'Cost'],
                      data: labourTableRows,
                    ),
                  ],
                ),
              ),
            ];
          },
        ),
      );
    }

    final pdfBytes = await doc.save();
    return pdfBytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 71, 194),
        automaticallyImplyLeading: false,
        title: Text("Premium Package  |   ${widget.packCost}"),
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
                'Total Cost: ${widget.greyTotalCost}', // Display total cost
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
                  rows: widget.greyTableRows
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

              const Text(
                'Finishing Materials Cost', // Heading text
                style: TextStyle(
                  fontSize: 24, // Adjust the font size as needed
                  fontWeight: FontWeight.bold, // Make the heading bold
                ),
              ),
              const SizedBox(
                  height: 10), // Add some space between heading and total cost
              Text(
                'Total Cost: ${widget.finishingTotalCost}', // Display total cost
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
                  rows: widget.finishTableRows
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

              // Labour Table
              if (widget.labourTableRows.isNotEmpty) ...[
                const SizedBox(height: 20),
                const Text(
                  'Labour Cost',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Total Cost: ${widget.labourTotalCost}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width),
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Type')),
                        DataColumn(label: Text('Cost')),
                      ],
                      rows: widget.labourTableRows
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
                ),
                const SizedBox(height: 30),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

List<List<dynamic>> generateRows(dynamic DataPack) {
  List<List<dynamic>> rows = [];
  debugPrint("DataPack $DataPack");
  if (DataPack is List && DataPack.isNotEmpty) {
    List<dynamic>? data = DataPack[0];
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

List<List<dynamic>> generatefinishingRows(dynamic DataPack) {
  List<List<dynamic>> rows = [];
  debugPrint("\n\n\n\n DataPack Finishing $DataPack");
  if (DataPack is List && DataPack.isNotEmpty) {
    for (var data in DataPack) {
      // Iterate over each sublist in DataPack
      debugPrint("Depack index data  = $data");
      if (data != null && data is List && data.length >= 6) {
        final String material = data[0]?.toString() ?? '';
        final String brand = data[1]?.toString() ?? '';
        final String factor = data[2]?.toString() ?? '';
        final int cost = (data[3] is num) ? data[3].toInt() : 0;
        final int quantity = (data[4] is num) ? data[4].toInt() : 0;
        final int price = (data[5] is num) ? data[5].toInt() : 0;
        debugPrint(material);
        debugPrint(brand);
        debugPrint(factor);
        debugPrint(cost.toString());
        debugPrint(factor);
        debugPrint(quantity.toString());
        debugPrint(price.toString());

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
  }
  return rows;
}

List<List<dynamic>> generateLabourRows(dynamic labourData) {
  List<List<dynamic>> rows = [];

  if (labourData is List && labourData.isNotEmpty) {
    List<dynamic>? laborList = labourData[0];
    if (laborList != null) {
      for (var item in laborList) {
        if (item is List && item.length == 2) {
          final String type = item[0]?.toString() ?? '';
          final double cost = item[1] is num ? item[1] : 0;
          debugPrint(type);
          debugPrint(cost.toString());

          rows.add([
            type,
            cost.toString(),
          ]);
        }
      }
    }
  }

  return rows;
}
