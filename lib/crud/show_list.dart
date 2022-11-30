import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qrcode_scanner/crud/user.dart';


class DisplayUsers extends StatefulWidget {
  const DisplayUsers({Key? key}) : super(key: key);

  @override
  _DisplayUsersState createState() => _DisplayUsersState();
}

class _DisplayUsersState extends State<DisplayUsers> {
  var token =
      "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtb2QiLCJpYXQiOjE2NjkyODE4OTAsImV4cCI6MTY2OTM2ODI5MH0.ukPIiX9ZRIna0-JTDFXg4ra-xA6xFZ5aG3BrNQILbJlDCNidn8lNfVXOFNaymoSkDp1Tq4ar3tNyGyFhFk8cFQ";
  List<Users> user = [];

  Future<List<Users>> getAll() async {
    var response = await http.get(Uri.parse("http://192.168.137.182:2020/api"),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      user.clear();
    }
    List<dynamic> decodedData = jsonDecode(response.body);
    print(decodedData);




    // for (var u in decodedData) {
    //   print('DDDDDDD');
    //   user.add(u);
    //
    // }
    return
    user;
  }

  @override
  Widget build(BuildContext context) {
    getAll();
    return Scaffold(
        appBar: AppBar(
          title: Text('Display Users'),
          elevation: 0.0,
          backgroundColor: Colors.indigo[700],
        ),
        body: FutureBuilder(
            future: getAll(),
            builder: (context, AsyncSnapshot<List<Users>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, index) =>
                      InkWell(
                        child: ListTile(
                            title: Text(snapshot.data![index].name)
                        ),
                      )
              );
            }
        ));
  }
}