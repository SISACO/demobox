import 'package:Donobox/reuseable/reuseable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassScrn extends StatelessWidget {
    ResetPassScrn({super.key});

    final TextEditingController _emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          retextfield('Email', Icons.email, false, _emailcontroller),
          const SizedBox(height: 20,),
          reButton('Reset Password',true, (){
            restfunction(context);
          })
        ],
      ),
    );
  }

  Future restfunction (BuildContext ctx)async{

    showDialog(context: ctx, barrierDismissible: false,builder: (ctx1)=>Center(child: CircularProgressIndicator(),));

  try{
  await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailcontroller.text).then((value) => {
  });
  showSnackbar(ctx, 'Password Reset Email send');
  Navigator.of(ctx).popUntil((route) =>  route.isFirst);
  } on FirebaseAuthException catch(e){
      print(e);
      showSnackbar(ctx, e.message.toString());
      Navigator.of(ctx).pop();
  }
}
}

