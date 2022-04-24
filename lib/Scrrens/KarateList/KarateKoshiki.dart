import 'package:flutter/material.dart';
import 'package:untitled1/kConstantsdata.dart';
class KarateKoshiki extends StatefulWidget {
  const KarateKoshiki({Key? key}) : super(key: key);

  @override
  _KarateKoshikiState createState() => _KarateKoshikiState();
}

class _KarateKoshikiState extends State<KarateKoshiki> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: karateMenuList('Karate Koshiki',''),
    );
  }
}
