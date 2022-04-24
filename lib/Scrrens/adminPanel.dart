// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Services/FirebaseStorage.dart';

var CategoryFind = 0;

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  UploadTask? task;
  File? file;
  int karateCategoryData = 0;
  final getData = FirebaseFirestore.instance;

  Future SelectFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final path = result.files.single.path;
      final detail = result.files.first;
      final fileName = detail.path;

      setState(() => file = File(path!));
      final destination = 'files/$fileName';

      task = FirebaseApi.uploadFile(destination, file!);
      if (task != null) {
        final snapshot = await task?.whenComplete(() {});
        final urlDownload = await snapshot!.ref.getDownloadURL();

        if (karateCategoryData == 1) {
          var Categoryname = 'Karate Debutants';
          var filename = 'New Video';
          final addtoFirebase = await FirebaseFirestore.instance
              .collection("videos")
              .add({
            'url': urlDownload,
            'Categoryname': Categoryname,
            'filename': filename
          });
        } else if (karateCategoryData == 2) {
          var Categoryname = 'Karate Intermediaries';
          var filename = 'New Video';
          final addtoFirebase = await FirebaseFirestore.instance
              .collection("videos")
              .add({
            'url': urlDownload,
            'Categoryname': Categoryname,
            'filename': filename
          });
        } else if (karateCategoryData == 3) {
          var Categoryname = 'Karate Avances';
          var filename = 'New Video';
          final addtoFirebase = await FirebaseFirestore.instance
              .collection("videos")
              .add({
            'url': urlDownload,
            'Categoryname': Categoryname,
            'filename': filename
          });
        } else if (karateCategoryData == 4) {
          var Categoryname = 'Mini Karate';
          var filename = 'New Video';
          final addtoFirebase = await FirebaseFirestore.instance
              .collection("videos")
              .add({
            'url': urlDownload,
            'Categoryname': Categoryname,
            'filename': filename
          });
        } else if (karateCategoryData == 5) {
          var Categoryname = 'Karate Koshiki';
          var filename = 'New Video';
          final addtoFirebase = await FirebaseFirestore.instance
              .collection("videos")
              .add({
            'url': urlDownload,
            'Categoryname': Categoryname,
            'filename': filename
          });
        } else if (karateCategoryData == 6) {
          var Categoryname = 'Karate Kaka';
          var filename = 'New Video';
          final addtoFirebase = await FirebaseFirestore.instance
              .collection("videos")
              .add({
            'url': urlDownload,
            'Categoryname': Categoryname,
            'filename': filename
          });
        } else if (karateCategoryData == 7) {
          var Categoryname = 'laido Muso Jikiden';
          var filename = 'New Video';
          final addtoFirebase = await FirebaseFirestore.instance
              .collection("videos")
              .add({
            'url': urlDownload,
            'Categoryname': Categoryname,
            'filename': filename
          });
        }
        print(urlDownload);
      }
    } else {
      return;
    }
  }

/*  Future<void> getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Videos") as QuerySnapshot<Object?>;
    final allData = querySnapshot.docs.map((e) => e.data()).toList();
    print('All data is : $allData');
    print(CategoryFind);
    */ /*  for (int i = 0; i < querySnapshot.documents.length; i++) {
      var a = querySnapshot.documents[i];
      print(a.documentID);
    }*/ /*
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Admin',
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ButtonTheme(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    minWidth: 280.0,
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.red,
                      onPressed: () async {
                        karateCategoryData = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KarateDataList()));
                      },
                      child: Text(
                        'Select Category',
                        style: TextStyle(color: Colors.white, fontSize: 21.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Videos',
                    style: TextStyle(color: Colors.black, fontSize: 23),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        SelectFile();
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(15))),
                      child: Text(
                        'Upload Video',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text('Category',
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  Text('Action',
                      style: TextStyle(
                        fontSize: 18,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: getData.collection('videos').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: snapshot.data!.docs.map((data) {
                      return Card(child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data['filename']),
                            Text(data['Categoryname']),
                            ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(12.0))),
                                    backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(10))),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                          ],
                        ),
                      ),);
                    }).toList(),
                  );
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}

class VideoUploadCategory extends StatelessWidget {
  const VideoUploadCategory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Teaining Video 1'),
          Text('Karate Debutants'),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10))),
              child: Text(
                'Delete',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
        ],
      ),
    );
  }
}

class KarateDataList extends StatefulWidget {
  @override
  _KarateDataListState createState() => _KarateDataListState();
}

class _KarateDataListState extends State<KarateDataList> {
  int data = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.red),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        data = 1;
                      });

                      Navigator.pop(context, data);
                    },
                    child: Text(
                      'Karate Debutants',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.red),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        data = 2;
                      });

                      Navigator.pop(context, data);
                    },
                    child: Text(
                      'Karate Intermediaries',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.red),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        data = 3;
                      });

                      Navigator.pop(context, data);
                    },
                    child: Text(
                      'Karate Avances',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.red),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        data = 4;
                      });

                      Navigator.pop(context, data);
                    },
                    child: Text(
                      'Mini Karate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.red),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        data = 5;
                      });

                      Navigator.pop(context, data);
                    },
                    child: Text(
                      'Karate Koshiki',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.red),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        data = 6;
                      });

                      Navigator.pop(context, data);
                    },
                    child: Text(
                      'Karate Kaka',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.red),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        data = 7;
                      });

                      Navigator.pop(context, data);
                    },
                    child: Text(
                      'laido Muso Jikiden',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
