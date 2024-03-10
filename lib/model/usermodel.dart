import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String myname;
  final String myemail;
  final String myusername;
  final String myprofilpic;
  final int mydonations;


  UserModel({required this.id, required this.myname, required this.myemail, required this.myusername, required this.myprofilpic,required this.mydonations});

  Map <String , dynamic> toJson(){
  return{
    'name': myname,
    'email': myemail,
    'username':myusername,
    'profilepic':myprofilpic,
    'myDonations':mydonations,

  };
}

}

