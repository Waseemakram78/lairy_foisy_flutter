import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
