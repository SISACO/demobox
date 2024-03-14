
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
      appBar: MyAppBar(context, ''),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          retextfield('Email', Icons.email, false, _emailcontroller),
          reButton('Reset Password', true, (){
            restfunction(context, _emailcontroller);
          })
        ],
      )
    );
  }
}

Future restfunction (BuildContext ctx,TextEditingController emailcontrol)async{

  

  try{
  await FirebaseAuth.instance.sendPasswordResetEmail(email: emailcontrol.text).then((value) => {
    Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => SigninScrn()), (route) => false)
  });
  showDialog(context: ctx, barrierDismissible: false,builder: (ctx1)=>Center(child: CircularProgressIndicator(),));
  showSnackbar(ctx, 'Password Reset Email send');
  Navigator.of(ctx).popUntil((route) =>  route.isFirst);
  } on FirebaseAuthException catch(e){
      showSnackbar(ctx, e.message.toString());
      Navigator.of(ctx).pop();
  }
}
