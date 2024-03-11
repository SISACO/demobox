import 'dart:io';

import 'package:Donobox/screens/home/home.dart';
import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScrn extends StatefulWidget {
  const ProfileScrn({super.key});

  @override
  State<ProfileScrn> createState() => _ProfileScrnState();
}

class _ProfileScrnState extends State<ProfileScrn> {
  String email = '';
  String name = '';
  String uwallet = '';
  String propic = '';
  String gender = '';
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imageTemp = File(image.path);
  //     setState(() => this.image = imageTemp);
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }

  // @override
  // void initState() {
  //   getUserData();
  //   super.initState();

  // }
  // var userbase = FirebaseFirestore.instance.collection('userData')
  // .where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'Profile'),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            } else {
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    /// -- IMAGE
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(image: AssetImage(''))),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.amber),
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              color: Colors.black,
                              onPressed: (){
                                
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      name,
                    ),
                    Text(
                      email,
                    ),
                    const SizedBox(height: 20),

                    /// -- BUTTON
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text('Edit Profile',
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 10),

                    // return Center(
                    //   child: SingleChildScrollView(
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Column(
                    //         children: [
                    //           CircleAvatar(
                    //             radius: 70.r,
                    //           backgroundImage:
                    //               AssetImage(propic),
                    //         ),
                    //         SizedBox(height: 20,),

                    //           Container(
                    //             width: double.infinity,
                    //             height: 50,
                    //             decoration: BoxDecoration(
                    //               border: Border.all(),
                    //             borderRadius: BorderRadius.circular(10),

                    //           ),
                    //             child:Column(

                    //             )),
                    //           Text(email),
                    //           Text(gender),
                    //           Text(uwallet)
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // );
                  ]),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  fetch() async {
    final firebaseuser = FirebaseAuth.instance.currentUser;
    if (firebaseuser != null) {
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(firebaseuser.uid)
          .get()
          .then((value) {
        email = value.data()!["email"];
        name = value.data()!['name'];
        propic = value.data()!["profilepic"].toString();
        uwallet = value.data()!['wallet'].toString();
        gender = value.data()!['gender'];
      }).catchError((e) {
        print(e);
      });
    }
  }
}
