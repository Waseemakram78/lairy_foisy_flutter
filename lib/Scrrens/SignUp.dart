// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Scrrens/HomeScreen.dart';
import 'package:untitled1/Scrrens/LogIN.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth=FirebaseAuth.instance;
  TextEditingController emailAddress=  new TextEditingController();
  TextEditingController pasword=new TextEditingController();
  TextEditingController Name= new TextEditingController();
  TextEditingController phone= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:  BorderRadius.only(
                    bottomLeft: const Radius.circular(40.0),
                    bottomRight: const Radius.circular(40)),
              ),
              child: Center(
                child: Image.asset(
                  'Assets/images/Group32.png',
                  height: 180,
                  width: 180,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 480,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name'),
                    TextField(
                      controller: Name,
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                        hoverColor: Colors.black,
                        label: Text('David'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Email'),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailAddress,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        label: Text('example@gmail.com'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Mobile'),
                    TextField(
                      controller: phone,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        label: Text('00128456898'),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Pasword'),
                    TextField(
                      controller: pasword,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        label: Text('********'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        minWidth: 200.0,
                        height: 40.0,
                        child: RaisedButton(
                          color: Colors.red,
                          onPressed: () async{
                            try{
                              String email=emailAddress.text.trim(),Pasword=pasword.text.trim(),name=Name.text.trim(),Phone=phone.text.trim();
                              if(email==null && pasword==null)
                                {
                                  print('Email & pasword is empty');
                                }
                              else{
                                User? user=FirebaseAuth.instance.currentUser;
                                final docUser= FirebaseFirestore.instance.collection('user').doc();
                                  final Json=
                                    {
                                      'uid': docUser.id,
                                      'name': name,
                                      'email': email,
                                      'Pasword': Pasword,
                                      'role': 'user'
                                    };
                                  await docUser.set(Json);
                              }
                              final newUser= await _auth.createUserWithEmailAndPassword(email: email, password: Pasword);
                              if(newUser!=null){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomeScreen()),
                                );
                              }
                            }catch(e){
                              print(e);
                            }

                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an Account?'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogIN()));
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

