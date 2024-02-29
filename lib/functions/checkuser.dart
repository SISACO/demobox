
import 'package:Donobox/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void checkLogin(BuildContext ctx, usern, pass) {
  FirebaseAuth.instance.signInWithEmailAndPassword(email: usern.text, password: pass.text).then((value) {
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

  void checkSignup(BuildContext ctx,emailadd,pass1,pass2){
    if(pass1 == pass2){
     FirebaseAuth.instance.createUserWithEmailAndPassword
                  (email: emailadd.text, password: pass1.text).then((value) {
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
