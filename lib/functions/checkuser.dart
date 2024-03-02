
import 'package:Donobox/reuseable/reuseable.dart';
import 'package:Donobox/screens/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void checkLogin(BuildContext ctx, TextEditingController emailid, TextEditingController pass) {
  FirebaseAuth.instance.signInWithEmailAndPassword(email: emailid.text, password: pass.text).then((value) {
                     Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1) => HomeScreen()), (route) => false);
                  }).onError((error, stackTrace) {showDialog(
                      context: ctx,
                      builder: (ctx1) {
                      return AlertDialog(title: const Text('Error'),content: const Text('Username & Password not match'),
                      actions: [
                        TextButton.icon(onPressed: () {
                          Navigator.of(ctx1).pop();
                          },icon: const Icon(Icons.refresh_rounded),label: const Text('Ty agian'))
                        ],
                    );
                  }
                );
              }
             );
}

  void checkSignup(BuildContext ctx,TextEditingController name,String emailadd,TextEditingController usern, String pass1,String pass2){
    if(pass1 == pass2){
     FirebaseAuth.instance.createUserWithEmailAndPassword
                  (email: emailadd, password: pass1).then((value) {
                      Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => HomeScreen()), (route) => false);
                  }).onError((error, stackTrace){
                      showDialog(
                      context: ctx,
                      builder: (ctx1) {
                      return AlertDialog(title: const Text('Error'),content: const Text('Cannot Create the Account'),
                      actions: [
                        TextButton.icon(onPressed: () {
                          Navigator.of(ctx1).pop();
                          },icon: const Icon(Icons.refresh_rounded),label: const Text('Ty agian'))
                            ],
                          );
                        }
                      );
                  }
                );
      addUserdetail(ctx,name.text, usern.text);

    }
    else{
      showDialog(
        context: ctx,
        builder: (ctx1) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text("Password Doesn't match"),
            actions: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.of(ctx1).pop();
                  },
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Ty agian'))
            ],
          );
        });
    }
}

Future <void> addUserdetail(BuildContext context, String _name,String _username,) async{
  await FirebaseFirestore.instance.collection('userData').add({
    'Name' : _name,
    'Username' : _username,
  });
}