import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:qrcode_scanner/create_repair.dart';
import 'package:qrcode_scanner/crud/user.dart';
import 'package:qrcode_scanner/home.dart';
import 'package:qrcode_scanner/repair.dart';

import '../passdata.dart';

class ScanGet extends StatefulWidget {
  @override
  _ScanGetState createState() => _ScanGetState();
}

class _ScanGetState extends State<ScanGet> {
  final TextEditingController _txt = TextEditingController();

  String _scanBarcode = 'Unknown';
  String a = "a";

  @override
  void initState() {
    super.initState();
  }
  Future<void> proverkaSN() async {
    List<dynamic> decodedData;
    String result = "0";
    String getresult = "0";


    String barcodeScanRes1;

    try {
      barcodeScanRes1 = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
      _txt.text = barcodeScanRes1;
      result = _txt.text.substring(0,8);

    } on PlatformException {
      barcodeScanRes1 = 'Failed to get platform version.';
    }

    setState(() async {
      try {
        var token =
            "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtb2QiLCJpYXQiOjE2Njk4MTU1MDUsImV4cCI6MTY2OTkwMTkwNX0.MiCljuGY564k9cClRHb_q_GWGPnYut016zWgKIkG0S-ava4IZ6s4-dtgesNWniiIqZsSBOEkxfVJLZXuzJUWow";
        final response = await http.get(
            Uri.parse("http://10.45.180.16:2020/api/repair/${_txt.text}"),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token'
            });
        decodedData = json.decode(response.body);
        // print(decodedData);
        var repair = Repair.fromJson(decodedData[0]);
        print("user-get-http = " + repair.serinka);
        getresult = repair.serinka;
        print('Helloooooooo');
        print("result http = " + getresult);
      } catch (exception) {
        print(exception);
      }
      print(getresult);
      String aa = result;
      String bb = getresult;
      print(aa + " result");
      print(bb + " getresult");
      if (_txt.text == getresult) {
        print("defektlar spiskasida bor");
        // Navigator.pushNamed(context, "/createrepair");
      } else {
        print("defektlar spiskasida yoq");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateRepair(serinka: _txt.text)));
      }
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
                        onPressed: () => proverkaSN(),
                        child: const Text('Проверка Статус S/N')),
                    const Padding(
                      padding: EdgeInsets.only(top: 44.0),
                    ),


                    const Padding(
                      padding: EdgeInsets.only(top: 44.0),
                    ),
                    Text(
                      ('Scan result: $_scanBarcode'),
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    )
                  ]));
        }),
      ),
    );
  }
}
