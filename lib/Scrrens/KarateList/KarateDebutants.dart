import 'package:flutter/material.dart';
import 'package:untitled1/kConstantsdata.dart';
class KarateDebutants extends StatefulWidget {
  const KarateDebutants({Key? key}) : super(key: key);

  @override
  _KarateDebutantsState createState() => _KarateDebutantsState();
}

class _KarateDebutantsState extends State<KarateDebutants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: karateMenuList('Karate Debutants',''),
    );
  }
}
