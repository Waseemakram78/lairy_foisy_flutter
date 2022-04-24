// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:untitled1/Scrrens/LogIN.dart';
import 'package:untitled1/Scrrens/SignUp.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                child: Column(
                  children: const [
                    Text(
                      'Get Started Today',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      'Choose the Right Plan that suits your needs',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(padding: EdgeInsets.all(20),
            child: Card(
              child: SizedBox(
                height: 350.0,
                width: 200.0,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)

                            ),
                            color: Colors.white,
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset('Assets/images/Person.png'),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                "Free",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              RichText(
                                  text: TextSpan(
                                    children: const [
                                      TextSpan(
                                          text: '0\$ ',
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: '/month',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 15)),
                                    ],
                                  )) /*Row(children: [Text('0\$',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),Text('/month',style: TextStyle(fontSize: 15,color: Colors.black),)],)*/
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Text(
                            'Features included are:',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.check_box_outlined,
                              color: Colors.green, size: 30.0),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '2-3 Videos',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.check_box_outlined,
                              color: Colors.green, size: 30.0),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Access to all categories',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ButtonTheme(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        minWidth: 200.0,
                        height: 50.0,
                        child: RaisedButton(
                          color: Colors.red,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Signup()),

                            );
                          },
                          child: Text(
                            "Choose Free",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                child: Container(
                  height: 350.0,
                  width: 200.0,
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),

                              color: Colors.red,
                              child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Image.asset('Assets/images/Personpro.png'),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Premium",
                                  style: TextStyle(
                                    color: Colors.white,
                                      fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                                RichText(
                                    text: TextSpan(
                                      children: const [
                                        TextSpan(
                                            text: '50\$ ',
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text: '/month',
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 15)),
                                      ],
                                    )
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            Text(
                              'Features included are:',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                          Icon(Icons.check_box_outlined,color: Colors.white,size: 30,),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Unlimited Videos',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Icon(Icons.check_box_outlined,color: Colors.white,size: 30,),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Access to all categories',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ButtonTheme(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          minWidth: 200.0,
                          height: 50.0,
                          child: RaisedButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  Signup()),

                              );
                            },
                            child: Text(
                              "Choose Premium",
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),),
          ],
        ),
      ),
    ));
  }
}
