import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Scrrens/KarateList/KarateDebutants.dart';
import 'package:untitled1/Scrrens/KarateList/KarateIntermediaries.dart';
import 'package:untitled1/Scrrens/KarateList/KarateAvances.dart';
import 'package:untitled1/Scrrens/KarateList/Mini-Karate.dart';
import 'package:untitled1/Scrrens/KarateList/KarateKoshiki.dart';
import 'package:untitled1/Scrrens/KarateList/laidoMusoJikiden.dart';
import 'package:untitled1/Scrrens/KarateList/KarateKata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled1/Scrrens/LogIN.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
          child: Container(
      child:Stack(
        children: <Widget>[
          Positioned(top: 0,
          height: 300,
          width: 430,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(40.0)),
                image: DecorationImage(
                  image: AssetImage('Assets/images/kfu.jpeg'),
                  fit: BoxFit.fill,
                )
            ),
            child: Image.asset('Assets/images/logo.png',height: 150,width: 150,)
          ),),
          Positioned(
            top: 210,
            left:30,
            width: 350,
            height: 500,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  kListButton(  KarateDebutants(),'Karate Debutants',''),
                  kListButton(  KarateIntermediaries(),'Karate Intermediaries',''),
                  kListButton(  KarateAvances(),'Karate Avances',''),
                  kListButton(  MiniKarate(),'Mini-Karate','Psychomotricate'),
                  kListButton(  KarateKoshiki(),'Karate Koshiki',''),
                  kListButton(  KarateKata(),'KarateKata',''),
                  kListButton(  laidoMusoJikiden(),'laido-Muso-Jikiden','Elshin ryu'),
                  ElevatedButton(
                      style:  ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0))),
                          backgroundColor: MaterialStateProperty.all(Colors.red),
                          padding: MaterialStateProperty.all(EdgeInsets.all(15))),
                      onPressed: () async
                      {
                        await _auth.signOut();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIN()));

                      }, child: Text('Sign Out'))
                ],
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

class kListButton extends StatelessWidget {
  kListButton(this.NewPage, this.kText, this.ksubTitle
  ) ;
var NewPage,kText,ksubTitle;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)),
      minWidth: 250.0,
      height: 50.0,
      child: RaisedButton(
        color: Colors.red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewPage),
          );
        },
        child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Text(
          kText,
          style: TextStyle(color: Colors.white,fontSize: 21),
        ),
              Text(
                ksubTitle,
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ]),
      ),
    );
  }
}
