// import 'package:Donobox/screens/home/home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class emailVeriScrn extends StatelessWidget {
//   const emailVeriScrn({super.key});

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.mark_email_read_sharp,
//               size: 20,
//             ),
//             Text(
//               'Verification Link has been send to your email',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
//             ),
//             Text(
//                 'We have just send email verification link on your email, Please check email and click on That link to verify your Email address'),
//             Text(
//                 'If not auto redirected after verification, click on the Continue button.'),
//             TextButton(
//                 onPressed: () {
//                   if (FirebaseAuth.instance.currentUser!.emailVerified) {
//                     Navigator.of(context).pushAndRemoveUntil(
//                         MaterialPageRoute(builder: (ctx) => HomeScreen()),
//                         (route) => false);
//                   }
//                 },
//                 child: Text('Continue')),
//             TextButton(
//                 onPressed: () {
//                   try {
//                     FirebaseAuth.instance.currentUser!
//                         .sendEmailVerification()
//                         .then((value) => ScaffoldMessenger.of(context)
//                             .showSnackBar(SnackBar(
//                                 content:
//                                     Text('Verification Link has Resent'))));
//                   } catch (e) {
//                     ScaffoldMessenger.of(context)
//                         .showSnackBar(SnackBar(content: Text(e.toString())));
//                   }
//                 },
//                 child: Text('Resend E-Mail Link')),
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('Back')),
//           ],
//         ),
//       ),
//     );
//   }
// }
