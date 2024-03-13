import 'package:Donobox/screens/AmountAdd/AmountAdd.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:Donobox/core/app_export.dart';
import 'package:Donobox/core/colors/colors.dart';
import 'package:Donobox/data/modalsData.dart';
import 'package:Donobox/model/model.dart';
import 'package:Donobox/reuseable/reuseable.dart';
import 'package:Donobox/widgets/cstmnumfield.dart';
import 'package:Donobox/widgets/custom_elevated_button.dart';
import 'package:Donobox/widgets/customtextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonationScrn extends StatefulWidget {
  String PostId;
  DonationScrn({super.key, required this.PostId});

  @override
  State<DonationScrn> createState() => _DonationScrnState();
}

class _DonationScrnState extends State<DonationScrn> {
  TextEditingController _donationamtcontroller = TextEditingController();

  bool agreeTerms = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: Container(
        color: BackgroundColor,
        height: 200,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 20.0),
                  child: Text("Send custom Amount",
                      style: TextStyle(
                          color: Color(0XFF121212),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CustomNumTextField(
                  mycontroller: _donationamtcontroller,
                  FieldH: 60.h,
                  FieldW: 380.w,
                  labelText: "Enter The Amount",
                  iconField: Icons.currency_rupee),
            ),
            Row(
              children: [
                Checkbox(
                  value: agreeTerms,
                  onChanged: (value) {
                    setState(() {
                      agreeTerms = value ?? false;
                    });
                  },
                  shape: CircleBorder(),
                ),
                Text("Accept Terms & Conditions"),
              ],
            ),
            blckbtn(context, 'Pay Now', () {
              String postid = widget.PostId;
              double? number = double.tryParse(_donationamtcontroller.text);
              if (number != null) {
                makeTransaction(context, postid, number);
              } else {
                showSnackbar(context, "Enter A Amount");
              }
            }),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final amodel = AmountList[index];

              return Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String postid = widget.PostId;
                      num? AmountB = num.tryParse(amodel.Amount);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text("Transfer Amount"),
                              content: Text(
                                  "The Amount will be transfered to the Regarded Community"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    makeTransaction(context, postid, AmountB!);
                                  },
                                  child: Text('Procceed'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                              ]);
                        },
                      );
                    },
                    child: Text(
                      amodel.Amount,
                      style: TextStyle(
                          color: PrimaryColors().black900,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: PrimaryColors().gray200,
                        fixedSize: Size(350, 65),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                          13,
                        ))),
                  ),
                ],
              );
            },
            itemCount: AmountList.length,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}


Future<void> makeTransaction(context, String postId, num number) async {
  num amount = number; // Keep amount as num
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    print("No user logged in.");
    return;
  }
  final userId = user.uid;
  final userRef = FirebaseFirestore.instance.collection('userData').doc(userId);
  final postRef = FirebaseFirestore.instance.collection('PostData').doc(postId);

  try {
    // Fetch user data
    DocumentSnapshot userDataSnapshot = await userRef.get();
    final userData = userDataSnapshot.data() as Map<String, dynamic>;
    num userWallet = userData['wallet'] ?? 0;

    // Fetch post data
    DocumentSnapshot postDataSnapshot = await postRef.get();
    final postData = postDataSnapshot.data() as Map<String, dynamic>;
    num requestAmount = postData['RequestAmount'] ?? 0;
    num postProgress = postData['ProgressAmount'] ?? 0;

    // Check if user has sufficient funds
    if (userWallet < amount) {
      throw showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Insufficient funds"),
              content: Text("Insufficient Balance in Your Wallet"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => AddAmount(
                              showAppBar: true,
                            )));
                  },
                  child: Text('Add Amount'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ]);
        },
      );
    }

    if (requestAmount <= postProgress) {
      await postRef.update({'isactive': false});

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Reached Maximum"),
              content: Text(
                  "Required amount for the post is already reached"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ]);
        },
      );
      return;
    }

    if (amount > (requestAmount - postProgress)) {
      throw showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Amount Exceeded"),
              content: Text("Amount exceeds required amount for the post"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ]);
        },
      );
    }
    num postprogress = (postProgress / requestAmount) * 100;

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.update(userRef, {'wallet': userWallet - amount});

      transaction.update(postRef, {'ProgressAmount': postProgress + amount});

      transaction.update(postRef, {'PostProgress': postprogress});
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text("Transaction Successfull"),
            content: Text("Successfully Transffered the Amount, thanks"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ]);
      },
    );
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text("Transaction failed"),
            content: Text("Transaction Failed,Try Again"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Try Again'),
              ),
            ]);
      },
    );
  }
}
