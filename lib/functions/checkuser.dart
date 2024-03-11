
import 'package:Donobox/screens/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


// void checkLogin(BuildContext ctx, TextEditingController emailid, TextEditingController pass) {
//   FirebaseAuth.instance.signInWithEmailAndPassword(email: emailid.text, password: pass.text).then((value) {
//                      Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx1) => HomeScreen()), (route) => false);
//                   }).onError((error, stackTrace) {showDialog(
//                       context: ctx,
//                       builder: (ctx1) {
//                       return AlertDialog(title: const Text('Error'),content: const Text('Username & Password not match'),
//                       actions: [
//                         TextButton.icon(onPressed: () {
//                           Navigator.of(ctx1).pop();
//                           },icon: const Icon(Icons.refresh_rounded),label: const Text('Try agian'))
//                         ],
//                     );
//                   }
//                 );
//               }
//              );
// }

//   void checkSignup(BuildContext ctx,TextEditingController name,String emailadd,TextEditingController usern, String pass1,String pass2){
//     if(pass1 == pass2){
//      FirebaseAuth.instance.createUserWithEmailAndPassword
//                   (email: emailadd, password: pass1).then((value) {
//                       Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => HomeScreen()), (route) => false);
//                   }).onError((error, stackTrace){
//                       showDialog(
//                       context: ctx,
//                       builder: (ctx1) {
//                       return AlertDialog(title: const Text('Error'),content: const Text('Cannot Create the Account'),
//                       actions: [
//                         TextButton.icon(onPressed: () {
//                           Navigator.of(ctx1).pop();
//                           },icon: const Icon(Icons.refresh_rounded),label: const Text('Ty agian'))
//                             ],
//                           );
//                         }
//                       );
//                   }
//                 );
//       // addUserdetail(name.text,emailadd,'',0);

//     }
//     else{
//       showDialog(
//         context: ctx,
//         builder: (ctx1) {
//           return AlertDialog(
//             title: const Text('Error'),
//             content: const Text("Password Doesn't match"),
//             actions: [
//               TextButton.icon(
//                   onPressed: () {
//                     Navigator.of(ctx1).pop();
//                   },
//                   icon: const Icon(Icons.refresh_rounded),
//                   label: const Text('Ty agian'))
//             ],
//           );
//         });
//     }
// }

final FirebaseAuth auth = FirebaseAuth.instance;
Future addUserdetail(String _name, String _emailadd,
    String _propic, double _userWallet,String _gender) async {
      var firebaseuser=await FirebaseAuth.instance.currentUser;
      // CollectionReference users = FirebaseFirestore.instance.collection('userData');
      // FirebaseAuth auth =  FirebaseAuth.instance;
      // String uid = auth.currentUser!.uid.toString();
      FirebaseFirestore.instance.collection('userData')
      .doc(firebaseuser!.uid).set({
  // final user = UserModel(id: '', myname: _name, myemail:_emailadd, myusername: _username, myprofilpic: _propic, mydonations: 0,);
    // await FirebaseFirestore.instance.collection('userData').add({
      'name': _name,
      'email': _emailadd,
      'gender':_gender,
      'profilepic': _propic,
      'wallet': _userWallet,
    });
  
  }

Future signupUser(
    BuildContext ctx,
    TextEditingController name,
    TextEditingController emailadd,
    TextEditingController usern,
    TextEditingController pass,
    String gender) async {
  String errorMsg = '';
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailadd.text, password: pass.text)
        .then(
      (value) {
        Navigator.of(ctx).pushAndRemoveUntil(
            MaterialPageRoute(builder: (ctx) => HomeScreen()),
            (route) => false);
      },
    );
    addUserdetail(name.text, emailadd.text, '', 0,gender);
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
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('Ty agian'))
              ],
            ));
  }
}

// Future<void> signinUser(BuildContext ctx, TextEditingController emailadd,
//     TextEditingController pass) async {
//   String errorMsg = '';
//   try {
//     await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: emailadd.text, password: pass.text)
//         .then((value) {
//       Navigator.of(ctx).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (ctx) => HomeScreen()), (route) => false);
//     });
//   } on FirebaseAuthException catch (error) {
//     errorMsg = error.message!;
//     // ignore: use_build_context_synchronously
//     showDialog(
//         context: ctx,
//         builder: (BuildContext context) => AlertDialog(
//               content: Text(errorMsg),
//               actions: [
//                 TextButton.icon(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     icon: const Icon(Icons.refresh_rounded),
//                     label: const Text('Ty agian'))
//               ],
//             ));
//   }
// }

