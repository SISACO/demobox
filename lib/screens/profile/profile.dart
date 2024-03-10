// import 'dart:io';

// import 'package:Donobox/widgets/appbar/AppBar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileScrn extends StatefulWidget {
//   const ProfileScrn({super.key});

//   @override
//   State<ProfileScrn> createState() => _ProfileScrnState();
// }

// class _ProfileScrnState extends State<ProfileScrn> {


//   // Future pickImage() async {
//   //   try {
//   //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //     if (image == null) return;
//   //     final imageTemp = File(image.path);
//   //     setState(() => this.image = imageTemp);
//   //   } on PlatformException catch (e) {
//   //     print('Failed to pick image: $e');
//   //   }
//   // }

  
//   // @override
//   // void initState() {
//   //   getUserData();
//   //   super.initState();
    
//   // }
//   // var userbase = FirebaseFirestore.instance.collection('userData')
//   // .where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(context, 'Profile'),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(name!,style: TextStyle(fontSize: 16)),
//         ],
//       ),
//     );
//     }
//     }