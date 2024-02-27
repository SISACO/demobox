import 'package:Donobox/data/newpost_data.dart';
import 'package:Donobox/screens/details/details.dart';
import 'package:Donobox/screens/home/home.dart';
import 'package:Donobox/screens/auth/sign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



Future<void> savedata(String usern) async {
  final userName = await SharedPreferences.getInstance();

  await userName.setString('saved_user', usern);
}

Future<void> getdata(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 1));
  final userName = await SharedPreferences.getInstance();

  final value1 = userName.getString('saved_user');

  if (value1 != null) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => HomeScreen()), (route) => false);
  } else {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => SigninScrn()), (route) => false);
  }
}

ExitApp(BuildContext context) {

  Navigator.push(
      context,
      MaterialPageRoute<SignInScreen>(
        builder: (context) => SignInScreen(
          actions: [
            SignedOutAction((context) {
              Navigator.of(context).pop();
            })
          ],
        ),
      ));
}

