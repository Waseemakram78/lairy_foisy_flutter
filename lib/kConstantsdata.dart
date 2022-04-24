import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Services/FirebaseStorage.dart';
import 'package:untitled1/mode/videomodel.dart';

class KarateData {
  String Categoryname;
  String filename;
  String url;

  KarateData(this.Categoryname, this.filename, this.url);
}

class karateMenuList extends StatefulWidget {
  karateMenuList(this.ktext, this.ksubtitle, {Key? key}) : super(key: key);
  var ktext, ksubtitle;

  @override
  _karateMenuListState createState() => _karateMenuListState();
}

class _karateMenuListState extends State<karateMenuList> {
  final getData = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Center(
              child: Image.asset('Assets/images/logo.png'),
            ),
            ButtonTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              minWidth: 280.0,
              height: 70.0,
              child: RaisedButton(
                color: Colors.red,
                onPressed: () {},
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.ktext}',
                        style: TextStyle(color: Colors.white, fontSize: 21.0),
                      ),
                      Text(
                        '${widget.ksubtitle}',
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                    ]),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: 510,
                margin: EdgeInsets.all(16),
                width: double.infinity,
                child: FutureBuilder<List<VideoModel>>(
                  future: getVideoList(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<VideoModel> listData = snapshot.data;
                       print(listData);
                      return GridView.builder(
                        scrollDirection: Axis.vertical,
                        
                       
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: listData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                print(
                                    'The all Category name is here ${listData[index].categoryName}');
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: Colors.teal[200],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    image: DecorationImage(
                                        image:
                                            AssetImage('Assets/images/child.jpg'),
                                        fit: BoxFit.cover)),
                                height: 100,
                                width: 100,
                                child: Image.asset('Assets/images/clapper.png'),
                              ),
                            );
                          });
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class kGridItembox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.teal[200],
          borderRadius: BorderRadius.all(Radius.circular(40)),
          image: DecorationImage(
              image: AssetImage('Assets/images/child.jpg'), fit: BoxFit.cover)),
      height: 100,
      width: 100,
      child: Image.asset('Assets/images/clapper.png'),
    );
  }
}
