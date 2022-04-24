import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:untitled1/mode/videomodel.dart';

class FirebaseApi{
  static UploadTask? uploadFile(String? destination,File file){
    try{
      final ref=FirebaseStorage.instance.ref(destination);
      return ref.putFile(file);

    }on FirebaseException catch(e){
      return null;
    }


  }
}

class User{
  String id='';
  late  String name;
  late String email;
  late String Pasword;
  late String role;

  User({
    required this.id,required this.name,required this.email, required this.Pasword,required this.role
});
}
/*
'uid': user?.uid,
'name': name,
'email': email,
'Pasword': Pasword,
'role': 'user'*/

 CollectionReference video = FirebaseFirestore.instance.collection('videos');
 Future<List<VideoModel>> getVideoList() async {
    final videoList = await video.get().then((value) {
      return value.docs
          .map((doc) =>
              VideoModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
    return videoList;
  }