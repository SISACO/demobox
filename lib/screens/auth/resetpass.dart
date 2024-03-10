import 'package:Donobox/functions/validation.dart';
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
      body: Form(
        key: formkey,
        child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailcontroller,
                        validator: validateEmail,
                        cursorColor: const Color.fromARGB(255, 214, 196, 4),
                        style: TextStyle(color: Colors.black12.withOpacity(0.9)),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.8),
                            size: 20,
                          ),
                          labelText: 'Email',
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 199, 40, 40),
                              width: 1.0,),),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 199, 40, 40),
                              width: 1.0,),),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 217, 0),
                            ),
                          ),
                          labelStyle: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.4)),
                          filled: true,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          fillColor: Colors.white.withOpacity(0.3),
                        ),
                      ),
                      reButton('Reset Password', true, (){
                           if(formkey.currentState!.validate()){
                  restfunction(context,_emailcontroller);
                }
                      })
          ],
        ),
      )),
    );
  }
}

Future restfunction (BuildContext ctx,TextEditingController emailcontrol)async{

  showDialog(context: ctx, barrierDismissible: false,builder: (ctx1)=>Center(child: CircularProgressIndicator(),));

  try{
  await FirebaseAuth.instance.sendPasswordResetEmail(email: emailcontrol.text).then((value) => {
    Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => SigninScrn()), (route) => false)
  });
  showSnackbar(ctx, 'Password Reset Email send');
  Navigator.of(ctx).popUntil((route) =>  route.isFirst);
  } on FirebaseAuthException catch(e){
      showSnackbar(ctx, e.message.toString());
      Navigator.of(ctx).pop();
  }
}
