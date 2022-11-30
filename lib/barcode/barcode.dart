

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cencel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes1;
    try {
      barcodeScanRes1 = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes1);
    } on PlatformException {
      barcodeScanRes1 = 'Failed to get platform version.';
    }
//barcode scanner flutter ant
    setState(() {
      _scanBarcode = barcodeScanRes1;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes2;
    try {
      barcodeScanRes2 = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
      print(barcodeScanRes2);
    } on PlatformException {
      barcodeScanRes2 = 'Failed to get platform version.';
    }

    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Barcode Scanner')),
        body: Builder(builder: (BuildContext context) {
          return Container(
              alignment: Alignment.center,
              child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () => scanBarcodeNormal(),
                        child: const Text('Barcode scan')),
                    ElevatedButton(
                        onPressed: () => scanQR(),
                        child: const Text('QR scan')),
                    ElevatedButton(
                        onPressed: () => scanBarcodeScanStream(),
                        child: const Text('Barcode scan')),
                    Text(('Scan result: $_scanBarcode'),
                        style: const TextStyle(fontSize: 20))
                  ]));
        }),
      ),
    );
  }
}