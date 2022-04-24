import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/kConstantsdata.dart';

class laidoMusoJikiden extends StatefulWidget {
  const laidoMusoJikiden({Key? key}) : super(key: key);

  @override
  _laidoMusoJikidenState createState() => _laidoMusoJikidenState();
}

class _laidoMusoJikidenState extends State<laidoMusoJikiden> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: karateMenuList('laido-Muso Jikiden','Elshin Ryo'),
    );
  }
}

