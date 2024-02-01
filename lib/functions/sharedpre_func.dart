import 'package:donobox/screens/details/details.dart';
import 'package:donobox/screens/home/home.dart';
import 'package:donobox/screens/auth/sign.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> savedata(String usern) async {
  final userName = await SharedPreferences.getInstance();

  await userName.setString('saved_user', usern);
}

Future<void> getdata(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 2));
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

exitapp(BuildContext context) async {
  final userName = await SharedPreferences.getInstance();
  await userName.clear();

  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => const SigninScrn()),
      (route) => false);
}

gotodetails(BuildContext context) async {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (ctx) => const DetailsScrn()));
}
