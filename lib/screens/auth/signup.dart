import 'package:Donobox/functions/checkuser.dart';
import 'package:Donobox/reuseable/reuseable.dart';
import 'package:Donobox/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigupScrn extends StatefulWidget {
  const SigupScrn({super.key});

  @override
  State<SigupScrn> createState() => _SigupScrnState();
}

class _SigupScrnState extends State<SigupScrn> {

  final TextEditingController _namecontroller = TextEditingController();
   final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      "Name", Icons.person, false, _namecontroller),
                  const SizedBox(
                    height: 20,
                  ),
                  retextfield(
                      "Email", Icons.email, false, _emailcontroller),
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
                  retextfield("Confirm Password", Icons.lock, true, _confirmpasswordcontroller),
                  const SizedBox(
                    height: 20,
                  ),
                  reButton('SigUp', true, () {
                   checkSignup(context, _emailcontroller, _passwordcontroller, _confirmpasswordcontroller);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  }