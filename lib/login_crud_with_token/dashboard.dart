import 'package:flutter/material.dart';
import 'package:qrcode_scanner/crud/user.dart';
import 'package:qrcode_scanner/login_crud_with_token/databasehelper.dart';
import 'package:qrcode_scanner/login_crud_with_token/login.dart';
import 'package:qrcode_scanner/login_crud_with_token/showdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Dashboard'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  _save('0');
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage(
                      title: '1',
                    ),
                  ));
                },
              )
            ],
          ),
          // floatingActionButton: new FloatingActionButton(
          //   child: new Icon(Icons.add),
          //   onPressed: ()=>Navigator.of(context).push(
          //       new MaterialPageRoute(
          //         builder: (BuildContext context) => new AddData(),
          //       )
          //   ),
          // ),
          body: FutureBuilder<List>(
            future: databaseHelper.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ItemList(list: snapshot.data)
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          )),
    );
  }
}

class ItemList extends StatelessWidget {
  List? list;

  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => ShowData(
                          list: list,
                          index: i,
                        )),
              ),
              child: Card(
                child: ListTile(
                  title: Text(list?[i]['name']),
                  leading: Icon(Icons.apps),
                  subtitle: Text('Price : ${list?[i]['price']}'),
                ),
              ),
            ),
          );
        });
  }
}
