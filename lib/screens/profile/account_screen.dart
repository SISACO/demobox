
import 'dart:async';
import 'package:Donobox/screens/auth/sign.dart';
import 'package:Donobox/screens/profile/edit_screen.dart';
import 'package:Donobox/screens/profile/profilewidgets/forward_button.dart';
import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'profilewidgets/setting_item.dart';
import 'profilewidgets/setting_switch.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  bool isverified = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      isverified = FirebaseAuth.instance.currentUser!.emailVerified;
  }

//   Future<void> reloadUser() async {
//     if(!isverified){
//       timer = Timer.periodic(Duration(seconds: 20), (Timer t) => setState(() {
//         isverified = FirebaseAuth.instance.currentUser!.emailVerified;
//       }));
//     }

// }

  Future checkemail()async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isverified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    // if(isverified) timer?.cancel();
  }

  // String email = '';
  // String name = '';
  // String uwallet = '';
  // String propic = '';
  // String gender = '';
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, ''),
      body: SingleChildScrollView(
        child:StreamBuilder<DocumentSnapshot>(
            stream: getUserDataStream(uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LinearProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              var data = snapshot.data!.data() as Map<String, dynamic>?;

              if (data != null) {
              return Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          CircleAvatar(
                        radius: 45,
                        
                        backgroundImage: NetworkImage(data["profilepic"]),
                      ),
                      SizedBox(height: 10,),
                        Text(
                          data["name"],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          data["email"],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),

                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20,),
              
              isverified? SettingItem(
                isforward: false,
                title: "Email Verified",
                icon: Icons.email,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                onTap: () {},
              ):
              SettingItem(
                title: "Verify Email",
                icon: Icons.email,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                isforward: true,
                onTap: () {
                  verifyemail();
                  // reloadUser();
                },
              ),
              // const SizedBox(height: 20),
              
              // const SizedBox(height: 20),
              // SettingSwitch(
              //   title: "Dark Mode",
              //   icon: Ionicons.earth,
              //   bgColor: Colors.purple.shade100,
              //   iconColor: Colors.purple,
              //   value: isDarkMode,
              //   onTap: (value) {
              //     setState(() {
              //       isDarkMode = value;
              //     });
              //   },
              // ),
              const SizedBox(height: 20),
              SettingItem(
                isforward: true,
                title: "Help",
                icon: Ionicons.nuclear,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingItem(
                isforward: true,
                title: "Delete Account",
                icon: Icons.delete_forever_outlined,
                bgColor: const Color.fromARGB(255, 255, 14, 38),
                iconColor: const Color.fromARGB(255, 0, 0, 0),
                onTap: () {
                  showDialog(
        context: context,
        builder: (BuildContext ctx) => AlertDialog(
              content: Text("Are you Sure to Delete your Account"),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      deleteAccount();
                      Navigator.of(ctx).pop();
                      CircularProgressIndicator();
                    },
                    icon: const Icon(Icons.delete,color: Colors.red,),
                    label: const Text('Yes',style: TextStyle(color: Colors.redAccent),)),
                    TextButton.icon(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    icon: const Icon(Icons.cancel_presentation),
                    label: const Text('No'))
              ],
            ));
                },
              ),
            ],
          ),
        );
            }
            else{
              return Text('Error');
            }
            
          }
        )
        
      ),
    );
  }
  //   fetch() async {
  //   final firebaseuser = FirebaseAuth.instance.currentUser;
  //   if (firebaseuser != null) {
  //     await FirebaseFirestore.instance
  //         .collection('userData')
  //         .doc(firebaseuser.uid)
  //         .get()
  //         .then((value) {
  //       email = value.data()!["email"];
  //       name = value.data()!['name'];
  //       propic = value.data()!["profilepic"];
  //       uwallet = value.data()!['wallet'].toString();
  //       gender = value.data()!['gender'];
  //     }).catchError((e) {
  //       print(e);
  //     });
  //   }
  // }
  verifyemail() async {
    try{
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification().then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email Verification has send')));
      });
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),);
    }
    
    
  }
  deleteAccount(){

    FirebaseFirestore.instance.collection("userData").doc(uid).delete().then(
      (doc) => user?.delete().then((value) {
        CircularProgressIndicator(color: Colors.red,);
      }).then((value) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => SigninScrn()), (route) => false);
      }).onError((error, stackTrace){
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())));
      }));
  }
}
User? user = FirebaseAuth.instance.currentUser;
final uid = user!.uid;

Stream<DocumentSnapshot> getUserDataStream(String uid) {
  return FirebaseFirestore.instance.collection('userData').doc(uid).snapshots();
}