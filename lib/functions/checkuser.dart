import 'package:donobox/functions/sharedpre_func.dart';
import 'package:donobox/screens/home/home.dart';
import 'package:flutter/material.dart';

const _username = 'donobox';
const _password = '1234';

void checkLogin(BuildContext ctx, usern, pass) {
  if (usern == _username && pass == _password) {
    savedata(usern);
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => HomeScreen()), (route) => false);
  } 
  else {
    showDialog(
        context: ctx,
        builder: (ctx1) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Username & Password not match'),
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
