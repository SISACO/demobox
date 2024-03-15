
import 'dart:async';
import 'package:Donobox/functions/auth_gate.dart';

import 'package:Donobox/screens/profile/profilewidgets/help.dart';
import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'profilewidgets/setting_item.dart';


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

  // Future checkemail()async {
  //   await FirebaseAuth.instance.currentUser!.reload();
  //   setState(() {
  //     isverified = FirebaseAuth.instance.currentUser!.emailVerified;
  //   });
  //   // if(isverified) timer?.cancel();
  // }

 

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
              
              // isverified? SettingItem(
              //   isforward: false,
              //   title: "Email Verified",
              //   icon: Icons.email,
              //   bgColor: Colors.blue.shade100,
              //   iconColor: Colors.blue,
              //   onTap: () {},
              // ):
              // SettingItem(
              //   title: "Change Password",
              //   icon: Icons.lock_clock,
              //   bgColor: Colors.orange.shade100,
              //   iconColor: Colors.orange,
              //   isforward: true,
              //   onTap: () {

              //     // reloadUser();
              //   },
              // ),
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
                title: "Help & Support",
                icon: Ionicons.nuclear,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>helpScrn()));
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                isforward: true,
                title: "Delete Account",
                icon: Icons.delete_forever_outlined,
                bgColor: Color.fromARGB(255, 246, 58, 77),
                iconColor: Color.fromARGB(255, 255, 189, 189),
                onTap: () {
                  showDialog(
        context: context,
        builder: (BuildContext ctx) => AlertDialog(
              content: Text("Are you Sure to Delete your Account"),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    content: Text('Loading'),
                                  ));
                      deleteAccount();
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: const[
                    Text("Error Occured",style: TextStyle(color: Colors.redAccent,fontSize: 10),),
                    Text("Try restarting the app",style: TextStyle(color: Colors.redAccent,fontSize: 10),),
                  ],
                );
            }
            
          }
        )
        
      ),
    );
  }
  
  deleteAccount(){
    FirebaseFirestore.instance.collection("userData").doc(uid).delete().then(
      (doc) => user?.delete()).whenComplete(() => ExitApp(context)).onError((error, stackTrace){
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())));
        return;
      });
  }
}
User? user = FirebaseAuth.instance.currentUser;
final uid = user!.uid;

Stream<DocumentSnapshot> getUserDataStream(String uid) {
  return FirebaseFirestore.instance.collection('userData').doc(uid).snapshots();
}