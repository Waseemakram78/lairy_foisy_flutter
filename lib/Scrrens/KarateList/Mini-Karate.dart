import 'package:flutter/material.dart';
import 'package:untitled1/kConstantsdata.dart';
class MiniKarate extends StatefulWidget {
  const MiniKarate({Key? key}) : super(key: key);

  @override
  _MiniKarateState createState() => _MiniKarateState();
}

class _MiniKarateState extends State<MiniKarate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: karateMenuList('Mini Karat','Psychomotricate'),
    );
  }
}
