
import 'package:Donobox/screens/auth/signup.dart';
import 'package:Donobox/screens/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
Future addUserdetail(String _name, String _emailadd, String _propic,
    double _userWallet, String _gender) async {
  var firebaseuser = await FirebaseAuth.instance.currentUser;
  // CollectionReference users = FirebaseFirestore.instance.collection('userData');
  // FirebaseAuth auth =  FirebaseAuth.instance;
  // String uid = auth.currentUser!.uid.toString();
  FirebaseFirestore.instance.collection('userData').doc(firebaseuser!.uid).set({
    // final user = UserModel(id: '', myname: _name, myemail:_emailadd, myusername: _username, myprofilpic: _propic, mydonations: 0,);
    // await FirebaseFirestore.instance.collection('userData').add({
    'name': _name,
    'email': _emailadd,
    'gender': _gender,
    'profilepic': _propic,
    'wallet': _userWallet,
  });
}

Future signupUser(
    BuildContext ctx,
    TextEditingController name,
    TextEditingController emailadd,
    TextEditingController pass,
    String img,
    String gender) async {
  String errorMsg = '';
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailadd.text, password: pass.text)
        .then(
      (value) {
    addUserdetail(name.text, emailadd.text, img, 0, gender).then(
      (value) =>
        Navigator.of(ctx).pushAndRemoveUntil(
            MaterialPageRoute(builder: (ctx) => HomeScreen()),(route) => false));
      }
    );
  } on FirebaseAuthException catch (error) {
    errorMsg = error.message!;
    // ignore: use_build_context_synchronously
    showDialog(
        context: ctx,
        builder: (BuildContext context) => AlertDialog(
              content: Text(errorMsg),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx) => SigupScrn()),);
                    },
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('Try agian'))
              ],
            ));
  }
}
