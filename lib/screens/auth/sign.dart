import 'package:Donobox/functions/checkuser.dart';
import 'package:Donobox/functions/validation.dart';
import 'package:Donobox/reuseable/reuseable.dart';
import 'package:Donobox/screens/auth/resetpass.dart';
import 'package:Donobox/screens/auth/signup.dart';
import 'package:Donobox/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScrn extends StatefulWidget {
  SigninScrn({super.key});

  @override
  State<SigninScrn> createState() => _SigninScrnState();
}

class _SigninScrnState extends State<SigninScrn> {
  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text,
        password: _passwordcontroller.text,
      ).then((value) => CircularProgressIndicator()).then((value) => Navigator.of(ctx).pushAndRemoveUntil(
            MaterialPageRoute(builder: (ctx) => HomeScreen()),
            (route) => false));
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Invalid credentials, Please Check it';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      }
      
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  bool hidetext = true;
  String errorMsg = '';

  final formkey = GlobalKey<FormState>();

  get ctx => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome',
            style: TextStyle(fontSize: 23.0),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(18).h,
              padding: const EdgeInsets.all(18).h,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 217, 0),
                      width: 2.0),
                  borderRadius: const BorderRadius.all(Radius.circular(15)).r),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailcontroller,
                      validator: validateEmail,
                      cursorColor: const Color.fromARGB(255, 214, 196, 4),
                      style: TextStyle(color: Colors.black12.withOpacity(0.9)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.8),
                          size: 20,
                        ),
                        labelText: 'Email',
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 40, 40),
                            width: 1.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 40, 40),
                            width: 1.0,
                          ),
                        ),
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
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordcontroller,
                      validator: validatePass,
                      obscureText: hidetext,
                      cursorColor: const Color.fromARGB(255, 214, 196, 4),
                      style: TextStyle(color: Colors.black12.withOpacity(0.9)),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidetext = !hidetext;
                              });
                            },
                            icon: hidetext
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off)),
                        prefixIcon: Icon(
                          Icons.lock_person_outlined,
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.8),
                          size: 20,
                        ),
                        labelText: 'Password',
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 40, 40),
                            width: 1.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 40, 40),
                            width: 1.0,
                          ),
                        ),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 190.0).h,
                      child: GestureDetector(
                          child: Text(
                            'Forget Password',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.cyan),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResetpassScrn()));
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    reButton('Login', true, () async {
                      if (formkey.currentState!.validate()) {
                        // signinUser(ctx,_emailcontroller, _passwordcontroller);
                        // checkLogin(ctx, _emailcontroller, _passwordcontroller);

                        signInWithEmailAndPassword(context);
                        
                      }
                      setState(() {});
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't Have an Account?"),
                        GestureDetector(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.cyan),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => SigupScrn()));
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
