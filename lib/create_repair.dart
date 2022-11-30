import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qrcode_scanner/crud/show_list.dart';
import 'package:qrcode_scanner/crud/user.dart';
import 'package:qrcode_scanner/home.dart';
import 'package:qrcode_scanner/my_app/scan_and_get.dart';
import 'package:qrcode_scanner/repairdto.dart';

class CreateRepair extends StatefulWidget {
  final String serinka;

  const CreateRepair({required this.serinka});

  @override
  _CreateRepairState createState() => _CreateRepairState();
}

TextEditingController serinkaController =
    TextEditingController(text: repair.serinka);
TextEditingController modelController =
    TextEditingController(text: repair.model);
TextEditingController defectController =
    TextEditingController(text: repair.defekt);
Repair repair = Repair(0, serinkaController.text, '', '',);

class _CreateRepairState extends State<CreateRepair> {
  @override
  void initState() {
    serinkaController = TextEditingController(text: widget.serinka);
    modelController.clear();
    defectController.clear();
  }

  var token =
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtb2QiLCJpYXQiOjE2Njk4MTU1MDUsImV4cCI6MTY2OTkwMTkwNX0.MiCljuGY564k9cClRHb_q_GWGPnYut016zWgKIkG0S-ava4IZ6s4-dtgesNWniiIqZsSBOEkxfVJLZXuzJUWow";

  Future save() async {
    // var jsonResponse = null;
    await http.post(
        Uri.parse(
          "http://10.45.180.16:2020/api/repair",
        ),
        headers: <String, String>{
          'Context-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: <String, String>{
          'serinka': repair.serinka,
          'model': repair.model,
          'defekt': repair.defekt,
        });
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => MyApp()),

        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    //  print(widget.id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[700],
        elevation: 0.0,
        title: Text(widget.serinka),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100, bottom: 100, left: 18, right: 18),
          child: Container(
            height: 550,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.indigo[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 300,
                    decoration: BoxDecoration(boxShadow: []),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter  S/N',
                          enabled: false),
                      controller: serinkaController,
                      onChanged: (val) {
                        repair.serinka = val;
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: 300,
                    decoration: const BoxDecoration(boxShadow: []),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter model'),
                      controller: modelController,
                      onChanged: (val) {
                        repair.model = val;
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    width: 300,
                    decoration: const BoxDecoration(boxShadow: []),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter defect'),
                      controller: defectController,
                      onChanged: (val) {
                        repair.defekt = val;
                      },
                    )),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 100,
                  child: TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: save,
                      child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
