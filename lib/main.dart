// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled1/Scrrens/MenuScreen.dart';
import 'package:untitled1/Scrrens/LogIN.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled1/Scrrens/adminPanel.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: _Splash(),
    );
  }
}


class _Splash extends StatelessWidget {
@override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
          child:Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('Assets/images/Group32.png',
                height: 400.0,
                width: 400.0,),
                Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Material(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        elevation: 5.0,
                        child: MaterialButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  LogIN()),
                          );
                        },
                          minWidth: 300.0,
                          height: 42.0,
                          child: Text(
                            'Get Started',
                            style: TextStyle(color: Colors.white,fontSize: 20.0),
                          ),
                        ),
                      ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}