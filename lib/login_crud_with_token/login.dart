import 'package:flutter/material.dart';
import 'package:qrcode_scanner/login_crud_with_token/databasehelper.dart';
import 'package:qrcode_scanner/login_crud_with_token/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget{

  LoginPage({Key? key ,required this.title}) : super(key : key);
  final String title;

  @override
  LoginPageState  createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    if(value != '0'){
      Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context) => new Dashboard(title: '123',),
          )
      );
    }
  }

  @override
  initState(){
    read();
  }

  DatabaseHelper databaseHelper = new DatabaseHelper();
  String msgStatus = '';

  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  _onPressed(){
    setState(() {
      if(_usernameController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty ){
        databaseHelper.loginData(_usernameController.text.trim().toLowerCase(),
            _passwordController.text.trim()).whenComplete((){
          if(databaseHelper.status){
            _showDialog();
            msgStatus = 'Check username or password';
          }else{
            Navigator.pushReplacementNamed(context, '/dashboard');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Login',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child:  TextField(
                  controller: _usernameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Place your username',
                    icon: new Icon(Icons.login),
                  ),
                ),
              ),

              Container(
                height: 50,
                child:  TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Place your password',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),

              const Padding(padding: EdgeInsets.only(top: 44.0),),
              Container(
                height: 60,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.all(15.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: _onPressed,
                  child: const Text('Signin'),
                ),
              ),

              Container(
                height: 50,
                child:   Text(
                  '$msgStatus',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
               const Padding(padding:   EdgeInsets.only(top: 44.0),),


              const Padding(padding: EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: ()=>Navigator.of(context).push(
                        MaterialPageRoute(
                        builder: (BuildContext context) =>   Dashboard(title: "11"),
                      )
                  ),
                  child: const Text('Gradient'),


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(){
    showDialog(
        context:context ,
        builder:(BuildContext context){
          return AlertDialog(
            title: const Text('Failed'),
            content:  const Text('Check your email or password'),
            actions: <Widget>[
                TextButton(
                child:  const Text(
                  'Close',
                ),

                onPressed: (){
                  Navigator.of(context).pop();
                },

              ),
            ],
          );
        }
    );
  }

}
