// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:qrcode_scanner/crud/show_list.dart';
// import 'package:qrcode_scanner/crud/user.dart';
//
// class CreateUser extends StatefulWidget {
//   final int id;
//
//   const CreateUser({ Key? key, required this.id });
//
//   @override
//   _CreateUserState createState() => _CreateUserState();
// }
//
// TextEditingController nameController = TextEditingController(text: users.name);
// Users users = Users('', '');
//
// class _CreateUserState extends State<CreateUser> {
//   var token =
//   "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtb2QiLCJpYXQiOjE2NjkyODE4OTAsImV4cCI6MTY2OTM2ODI5MH0.ukPIiX9ZRIna0-JTDFXg4ra-xA6xFZ5aG3BrNQILbJlDCNidn8lNfVXOFNaymoSkDp1Tq4ar3tNyGyFhFk8cFQ";
//
//   Future save() async {
//     // var jsonResponse = null;
//     await http.post(
//         Uri.parse("http://192.168.0.103:2020/api",), headers: <String, String>{
//       'Context-Type': 'application/json; charset=UTF-8',
//       'Authorization': 'Bearer $token'
//     }, body: <String, String>{ 'name': users.name,}
//     );
//     Navigator.of(context).pushAndRemoveUntil(
//         MaterialPageRoute(builder: (BuildContext context) => DisplayUsers()), (
//         Route<dynamic> route) => false);
//   }
//   @override
//   Widget build(BuildContext context) {
//     //  print(widget.id);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigo[700],
//         elevation: 0.0,
//         title: Text('Create User'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding:  EdgeInsets.only(top: 100,bottom: 100,left: 18,right: 18),
//           child: Container(
//             height: 550,
//             width: 400,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: Colors.indigo[700],
//             ),
//
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                     width: 300,
//                     decoration:   BoxDecoration(boxShadow: [
//                     ]),
//                     child: TextField(
//                       controller:nameController ,
//                       onChanged: (val){
//                         users.name = val;
//                       },
//
//                     )
//                 ),
//                 SizedBox(height: 10,),
//
//                 SizedBox(
//                   width: 100,
//                   child: TextButton(
//                       style: TextButton.styleFrom(backgroundColor: Colors.white),
//                       onPressed:save,
//                       child: const Text('Save')),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//
//   }
//
// }
