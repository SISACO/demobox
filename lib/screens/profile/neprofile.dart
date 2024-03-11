import 'package:Donobox/model/model.dart';
import 'package:Donobox/reuseable/reuseable.dart';
import 'package:Donobox/screens/transaction/payment.dart';
import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class ProfileScrn extends StatelessWidget {
  const ProfileScrn({super.key});


  // var userbase = FirebaseFirestore.instance.collection('userData')
  // .where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
 
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('userData')
            .doc('RwBmU2nHkQSsY5g3HQQq').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Text('Document does not exist');
        }

        var data = snapshot.data!.data() as Map<String, dynamic>?;

        if (data == null) {
          return Text('Data is null');
        }else{
          
          String imageUrl = data["Postimage"];

          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }                          
          return Scaffold(
            appBar: MyAppBar(context, 'Profile'),
            body: SafeArea(
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0).w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0).r,
                          child: Image.network(imageUrl),
                        ),
                      ),
                      SizedBox(height: 5),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0).w,
                            child: Text(data["name"],
                                style: TextStyle(fontSize: 16)),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        children: [
                          Text(data["email"],
                                style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Column(
                        children: [
                           Text(
                                  data["userwallet"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                
                          
                              
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/logo/dono-logo.png'),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                    ],
                    
                  )
                  ])
                  
                  
                ),
              ),
            ),
          );
   }
  }
  );  
  }
}
