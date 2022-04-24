import 'package:flutter/material.dart';
import 'package:untitled1/kConstantsdata.dart';
class KarateIntermediaries extends StatefulWidget {
  const KarateIntermediaries({Key? key}) : super(key: key);

  @override
  _KarateIntermediariesState createState() => _KarateIntermediariesState();
}

class _KarateIntermediariesState extends State<KarateIntermediaries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: karateMenuList('Karate Intermeiaries',''),
    );
  }
}
