import 'package:Donobox/functions/checkuser.dart';
import 'package:Donobox/functions/sharedpre_func.dart';
import 'package:Donobox/reuseable/reuseable.dart';
import 'package:flutter/material.dart';

class SigninScrn extends StatefulWidget {
  const SigninScrn({super.key});

  @override
  State<SigninScrn> createState() => _SigninScrnState();
}

class _SigninScrnState extends State<SigninScrn> {
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Welcome'),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 255, 217, 0)),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                retextfield(
                    "Username", Icons.person, false, _usernamecontroller),
                const SizedBox(
                  height: 20,
                ),
                retextfield("Password", Icons.lock, true, _passwordcontroller),
                const SizedBox(
                  height: 20,
                ),
                reButton('Login', true, () {
                  checkLogin(context, _usernamecontroller.text,
                      _passwordcontroller.text);
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
