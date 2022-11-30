import 'package:flutter/material.dart';
import 'package:qrcode_scanner/barcode/barcode.dart';
import 'package:qrcode_scanner/create_repair.dart';
import 'package:qrcode_scanner/crud/show_list.dart';
import 'package:qrcode_scanner/my_app/scan_and_get.dart';
import 'package:qrcode_scanner/passdata.dart';
import 'crud/add_user.dart';
import 'package:qrcode_scanner/crud/upload.dart';
import 'package:qrcode_scanner/login_crud_with_token/login.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('First Screen'), backgroundColor: Colors.teal),
      body: Builder(builder: (BuildContext context) {
        return Container(
            alignment: Alignment.center,
            child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Screen2()));
                      },
                      child: const Text('Barcode scan')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ScanGet()));
                      },
                      child: const Text('Scan Get')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DisplayUsers()));
                      },
                      child: const Text('Users List')),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.of(context).push(MaterialPageRoute(
                  //           builder: (context) => CreateUser(id: 0)));
                  //     },
                  //     child: const Text('Add User')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                MyImagePicker(title: 'upload')));
                      },
                      child: const Text('Upload File')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage(title: "SignIN")));
                      },
                      child: const Text('Login Page')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CreateRepair(serinka: "1" )));
                      },
                      child: const Text('Create Repair')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => FirstScreen()));
                      },
                      child: const Text('PassData')),
                ]));
      }),
    );
  }
}
