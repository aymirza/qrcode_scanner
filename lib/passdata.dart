import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:qrcode_scanner/home.dart';
import 'package:qrcode_scanner/models.dart';
import 'package:qrcode_scanner/my_app/scan_and_get.dart';
import 'package:qrcode_scanner/repair.dart';

import 'create_repair.dart';
import 'crud/user.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String value = "Screen 1 Data Pass Text";

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Screen 1"),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: TextStyle(fontSize: 28),
            ),
            child: Text('Pass Data'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondScreen(value: value)));
            },
          ),
        ),
      );
}

class SecondScreen extends StatelessWidget {
  final String value;

  const SecondScreen({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Screen 2"),
          centerTitle: true,
        ),
        body: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 28),
                ),
                child: Text(value, style: TextStyle(fontSize: 50)),
                onPressed: () async {
                  String qrcode = "171LDAAAK100001";
                  List<dynamic> decodedRepair;
                  String getresult = "0";
                  List<dynamic> decodedModels;
                  String getresult1 = "0";
                  String getresult2 = "0";
                  String getresult3 = "0";

                  var result = qrcode.substring(0, 8);
                  try {
                    var token =
                        "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtb2QiLCJpYXQiOjE2Njk4NjYzNzYsImV4cCI6MTY2OTk1Mjc3Nn0.LX0GgqavFbH1QCW95AeP5W4ub5Y-1oxFxRiQqMnYsdk4igPu-4tjsdb3hfli1QlNgbHoOhQPmu_sxqugK0OsGQ";

                    final response = await http.get(
                        Uri.parse(
                            "http://192.168.137.21:2020/api/repair/${qrcode}"),
                        headers: {
                          'Accept': 'application/json',
                          'Authorization': 'Bearer $token'
                        });
                    decodedRepair = json.decode(response.body);
                    print(decodedRepair);
                    var repair = Repair.fromJson(decodedRepair[0]);
                    print("user-get-http = " + repair.serinka);
                    getresult = repair.serinka;
                    print('Helloooooooo');
                    print("result http = " + getresult);
                    final response2 = await http.get(
                        Uri.parse(
                            "http://192.168.137.21:2020/api/models/${result}"),
                        headers: {
                          'Accept': 'application/json',
                          'Authorization': 'Bearer $token'
                        });
                    decodedModels = json.decode(response2.body);
                    print(decodedModels);
                    var models = Models.fromJson(decodedModels[0]);
                    getresult1 = models.modelcode;
                    getresult2 = models.modelname;
                    getresult3 = models.modelcolor;
                  } catch (exception) {
                    print(exception);
                  }
                  print(result);
                  print(getresult);
                  if (qrcode == getresult) {
                    print("defektlar spiskasida bor getresult: " + getresult);
                    print("result http getresult1 = " + getresult1);
                    print("result http getresult2 = " + getresult2);
                    print("result http getresult3 = " + getresult3);
                  } else {
                    print("defektlar spiskasida yoq: " + qrcode);
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => CreateRepair(serinka: qrcode)));
                  }
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 28),
                ),
                child: Text(value, style: TextStyle(fontSize: 50)),
                onPressed: () async {
                  String qrcode = "171HHHHHK199999";
                  List<dynamic> decodedModels;
                  String getresult1 = "0";
                  String getresult2 = "0";
                  String getresult3 = "0";

                  var result = qrcode.substring(0, 8);
                  try {
                    var token2 =
                        'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtb2QiLCJpYXQiOjE2Njk4Nzc1NDAsImV4cCI6MTY2OTk2Mzk0MH0.9eFwrmaCRw3TxVTkf-9EIR_UmgIC_qmth_VySFbomzghTcohJFW-fvzJLh5uKwkHDsMvCriiWryPVLLeNKW7ZA';

                    final response2 = await http.get(
                        Uri.parse(
                            "http://192.168.137.21:2020/api/models/${result}"),
                        headers: {
                          'Accept': 'application/json',
                          'Authorization': 'Bearer $token2'
                        });
                    decodedModels = json.decode(response2.body);
                    print(decodedModels);
                    var models = Models.fromJson(decodedModels[0]);
                    print("models-get-http = " + models.modelcode);
                    print("models-get-http = " + models.modelname);
                    print("models-get-http = " + models.modelcolor);

                    getresult1 = models.modelcode;
                    getresult2 = models.modelname;
                    getresult3 = models.modelcolor;


                  } catch (exception) {
                    print(exception);
                  }
                  print('result: '+result);
                  print('getresult1: '+getresult1);
                  if (result == getresult1) {
                    print("defektlar spiskasida bor: " + getresult1);
                    print("result http getresult1 = " + getresult1);
                    print("result http getresult2 = " + getresult2);
                    print("result http getresult3 = " + getresult3);
                  } else {
                    print("defektlar spiskasida yoq: " + result);

                  }
                },
              ),
            ]),
      );
}

// class CreateRepair2 extends StatefulWidget {
//   final String serinkaa;
//
//   const CreateRepair2({Key? key, required this.serinkaa});
//
//   @override
//   _CreateRepair2State createState() => _CreateRepair2State();
// }
//
// TextEditingController serinkaController = TextEditingController(text: repair.serinka);
// TextEditingController modelController =
//     TextEditingController(text: repair.model);
// TextEditingController defectController =
//     TextEditingController(text: repair.defekt);
// Repair repair = Repair(0, serinkaController.text, '', '');
//
// class _CreateRepair2State extends State<CreateRepair2> {
//   @override
//   void initState() {
//     serinkaController = TextEditingController(text: widget.serinkaa);
//   }
//
//   var token =
//       "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtb2QiLCJpYXQiOjE2NjkzODI5NzYsImV4cCI6MTY2OTQ2OTM3Nn0.9zFCAgc6xJ6Ng-0wLQGsJD1M_a5OTdBCoc17TYlcv6VcQrwoISuZ3MGQ3MmEI1t-hWmn9-WlPOajDVCVJD4iVg";
//
//   Future save() async {
//     // var jsonResponse = null;
//     await http.post(
//         Uri.parse(
//           "http://192.168.137.245:2020/api/repair",
//         ),
//         headers: <String, String>{
//           'Context-Type': 'application/json; charset=UTF-8',
//           'Authorization': 'Bearer $token'
//         },
//         body: <String, String>{
//           'serinka': repair.serinka,
//           'model': repair.model,
//           'defekt': repair.defekt,
//         });
//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (BuildContext context) => ScanGet()),
//         (Route<dynamic> route) => false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //  print(widget.id);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigo[700],
//         elevation: 0.0,
//         title: const Text('Create User'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(top: 100, bottom: 100, left: 18, right: 18),
//           child: Container(
//             height: 550,
//             width: 400,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: Colors.indigo[200],
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                     width: 300,
//                     decoration: BoxDecoration(boxShadow: []),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: "Eter S/N",
//                           enabled: false),
//                       controller: serinkaController ,
//                       onChanged: (val) {
//                         repair.serinka = val;
//                       },
//                     )),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                     width: 300,
//                     decoration: const BoxDecoration(boxShadow: []),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: 'Enter model'),
//                       controller: modelController,
//                       onChanged: (val) {
//                         repair.model = val;
//                       },
//                     )),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                     width: 300,
//                     decoration: const BoxDecoration(boxShadow: []),
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: 'Enter defect'),
//                       controller: defectController,
//                       onChanged: (val) {
//                         repair.defekt = val;
//                       },
//                     )),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   width: 100,
//                   child: TextButton(
//                       style:
//                           TextButton.styleFrom(backgroundColor: Colors.white),
//                       onPressed: save,
//                       child: const Text('Save')),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class App2 extends StatefulWidget {
//   @override
//   _App2State createState() => _App2State();
// }
//
// class _App2State extends State<App2> {
//
//   //country
//   List country_data = [];
//
//   late String countryid;                                 //default id for the dropdown
//   //its null for me you can copy an id from api and place here it will be seen....
//   Future<String> country() async {
//     var res = await http.get(
//         Uri.encodeFull("Your API url"),
//         headers: {"Accept": "application/json"}); //if you have any auth key place here...properly..
//     var resBody = json.decode(res.body);
//
//     setState(() {
//       country_data = resBody;
//     });
//
//     return "Sucess";
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     this.country();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dropdown #API"),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//
//       body: Container(
//           padding: EdgeInsets.all(15.0),      //some padding
//           child: Column(
//             children: <Widget>[
//               DecoratedBox(
//                   decoration: BoxDecoration(
//                       border: new Border.all(color: Colors.black),
//                       borderRadius: BorderRadius.circular(5.0)),
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
//                     //Why you have used Stack ??????
//                     //B'coz it make clickable to whole decorated Box!!!! as you can click anywhere for dropdown !!!
//                     child: Stack(
//                       children: <Widget>[
// //Country Text
//                         Text(
//                           "Country:",
//                           style: TextStyle(
//                             fontSize: 13.0,
//                           ),
//                         ),
//
// //Dropdown that has no loine beneath
//
//                         DropdownButtonHideUnderline(
//                           child:
//
// //starting the dropdown
//                           DropdownButton(
//                             items: country_data.map((item) {
//                               return new DropdownMenuItem(
//                                   child: new Text(
//                                     item['CountryName'],    //Names that the api dropdown contains
//                                     style: TextStyle(
//                                       fontSize: 13.0,
//                                     ),
//                                   ),
//                                   value: item['CountryID'].toString()       //Id that has to be passed that the dropdown has.....
//                                 //e.g   India (Name)    and   its   ID (55fgf5f6frf56f) somethimg like that....
//                               );
//                             }).toList(),
//                             onChanged: (String newVal) {
//                               setState(() {
//                                 countryid = newVal;
//                                 print(countryid.toString());
//                               });
//                             },
//                             value: countryid,                 //pasing the default id that has to be viewed... //i havnt used something ... //you can place some (id)
//                           ),
//
//
//                         )
//                       ],
//                     ),
//                   )),
//             ],
//           )
//       ),
//
//     );
//   }
// }
