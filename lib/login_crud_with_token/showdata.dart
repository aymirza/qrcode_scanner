import 'package:flutter/material.dart';
import 'package:qrcode_scanner/login_crud_with_token/dashboard.dart';

import 'databasehelper.dart';

class ShowData extends StatefulWidget {
  List<dynamic>? list;
  int index;

  ShowData({required this.index, required this.list});

  @override
  ShowDataState createState() => ShowDataState();
}

class ShowDataState extends State<ShowData> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Dashboard(
                  title: '12',
                ),
              )),
            )
          ],
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 62, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: Text(
                  "Name : ${widget.list?[widget.index]['name']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new Text(
                  " Price : ${widget.list?[widget.index]['price']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new Text(
                  " Created at : ${widget.list?[widget.index]['created_at']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 50,
                child: new Text(
                  " Updated at : ${widget.list?[widget.index]['updated_at']}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        databaseHelper
                            .deleteData(widget.list?[widget.index]['id']);
                        Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Dashboard(
                            title: '123',
                          ),
                        ));
                      },
                      child: new Text(
                        'Delete',
                        style: new TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Failed'),
            content: Text('Check your email or password'),
            actions: <Widget>[
              ElevatedButton(
                child: Text(
                  'Close',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
