import 'package:Donobox/screens/auth/sign.dart';
import 'package:Donobox/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SigninScrn();
        }

        return const HomeScreen();
      },
    );
  }
}

class AuthentcationServices {
  final FirebaseAuth _firebaseAuth;
  AuthentcationServices(this._firebaseAuth);
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}



ExitApp(BuildContext context) {
  FirebaseAuth.instance.signOut().then((value) => {
     Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => const SigninScrn()),
      (route) => false)
  });
 
}

