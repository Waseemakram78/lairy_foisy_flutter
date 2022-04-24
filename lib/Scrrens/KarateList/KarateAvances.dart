import 'package:flutter/material.dart';
import 'package:untitled1/kConstantsdata.dart';
class KarateAvances extends StatefulWidget {
  const KarateAvances({Key? key}) : super(key: key);

  @override
  _KarateAvancesState createState() => _KarateAvancesState();
}

class _KarateAvancesState extends State<KarateAvances> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: karateMenuList('Karate Avances',''),
    );
  }
}
