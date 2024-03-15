
import 'package:Donobox/reuseable/reuseable.dart';
import 'package:Donobox/screens/auth/sign.dart';
import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetpassScrn extends StatelessWidget {
  ResetpassScrn({super.key});

  final TextEditingController _emailcontroller = TextEditingController();
   final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'Reset Password'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            retextfield('Email', Icons.email, false, _emailcontroller),
            SizedBox(height: 20,),
            reButton('Reset Password', true, (){
              restfunction(context, _emailcontroller);
            })
          ],
        ),
      )
    );
  }
}

Future restfunction (BuildContext ctx,TextEditingController emailcontrol)async{

  try{
  await FirebaseAuth.instance.sendPasswordResetEmail(email: emailcontrol.text).then((value) => {
    showDialog(
        context: ctx,
        builder: (BuildContext context) => AlertDialog(
              content: Text('Password Reset Link has send ! Check your email'),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => SigninScrn()),(route) => false);
                    },
                    icon: const Icon(Icons.login_outlined),
                    label: const Text('Login'))
              ],
            ))
  });
  } on FirebaseAuthException catch(e){
      showSnackbar(ctx, e.message.toString());
      Navigator.of(ctx).pop();
  }
}
