import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import  'package:intl/intl.dart' ;
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
const List<String> list = <String>[
  'Tuzlucayir',
  'Turkozu',
  'Bogazici',
  'Akdere',
  'Ertugrulgazi',
  'ilker',
  'Bayi',
  'imalat'
];

class barcode extends StatefulWidget {

  const barcode({Key? key}) : super(key: key);

  @override
  State<barcode> createState() => _barcodeState();
}

class _barcodeState extends State<barcode> {
  final format = DateFormat("yyyy-MM-dd");
  String _scanBarcode = 'Unknown';
  String dropdownValue = list.first;
  DateTime? value;
  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);

      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      var url =
          'http://qrcumhuriyetfirini.online/cumhuriyetserver/userstudentcrud/urunekle.php';
      http.post(Uri.parse(url), body: {
        'barcode': _scanBarcode.toString(),
        'sube': dropdownValue.toString(),
        'tarih':value.toString(),
      });
    });
  }

  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return Container(
          alignment: Alignment.center,
          child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Positioned(
                  top: 140,
                  child: Container(
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child:Column(children: <Widget>[
                          Text('Tarih Seç'),
                          DateTimeField(
                            initialValue: value,
                            format: format,
                            onShowPicker: (context, currentValue) async {
                              await showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) {
                                    return BottomSheet(
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            constraints: BoxConstraints(maxHeight: 200),
                                            child: CupertinoDatePicker(
                                              onDateTimeChanged: (DateTime date) {
                                                value = date;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      onClosing: () {},
                                    );
                                  });
                              setState(() {});
                              return value;
                            },
                          ),
                        ]),

                      )
                    ),
                  ),
                ),
                Positioned(
                  top: 140,
                  child: Container(
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => scanBarcodeNormal(),
                    child: Text('Start barcode scan')),
                Text('Scan result : $_scanBarcode\n',
                    style: TextStyle(fontSize: 20))
              ]));
    });
  }
}
