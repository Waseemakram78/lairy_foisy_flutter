import 'package:flutter/material.dart';
import 'package:untitled1/kConstantsdata.dart';
class KarateKata extends StatefulWidget {
  const KarateKata({Key? key}) : super(key: key);

  @override
  _KarateKataState createState() => _KarateKataState();
}

class _KarateKataState extends State<KarateKata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: karateMenuList('Karate Kata',''),
    );
  }
}
