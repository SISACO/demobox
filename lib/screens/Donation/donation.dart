import 'package:Donobox/core/colors/colors.dart';
import 'package:Donobox/data/modalsData.dart';
import 'package:Donobox/reuseable/reuseable.dart';
import 'package:Donobox/widgets/custom_elevated_button.dart';
import 'package:Donobox/widgets/customtextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonationScrn extends StatefulWidget {
   DonationScrn({super.key});

  @override
  State<DonationScrn> createState() => _DonationScrnState();
}

class _DonationScrnState extends State<DonationScrn> {
final TextEditingController _donationamtcontroller = TextEditingController();

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
              child: CustomtextField(
                  mycontroller: _donationamtcontroller,
                  FieldH: 60.h,
                  FieldW: 380.w,
                  labelText: "Enter The Amount",
                  iconField: Icons.currency_rupee),
            ),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: null,
                  shape: CircleBorder(),
                ),
                Text("Accept Terms & Conditions"),
              ],
            ),
            blckbtn(context, 'Pay Now', () {
              donateamt();
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
                  newElevatedButton(Amodel: amodel)
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

  void donateamt() async {
    
    double walletamt = 0.0;
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
    String uid = user.uid;
    
    
    FirebaseFirestore.instance.collection('userData').doc(uid).get().then((doc){
      setState(() {
        walletamt = doc['wallet'];
      });
    });
  
   double enteredAmount = double.tryParse(_donationamtcontroller.text) ?? 0.0;

  
    if ( walletamt>=enteredAmount ) {
   
     
      _donationamtcontroller.clear();

  
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Amount Donated successfully')),
      );

      uploadToFirebase(enteredAmount);
    } else {
      // If the transaction IDs don't match, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Not enough amount in wallet,add more amount')),
      );
    }
  }

  @override
  void dispose() {
    _donationamtcontroller.dispose();
    super.dispose();
  }

  }
  void uploadToFirebase(double? amountToDonate) {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    String uid = user.uid;
    
    
    FirebaseFirestore.instance.collection('userData').doc(uid).get().then((doc) {
      if (doc.exists) {
     
        double? currentWalletAmount = doc['wallet'];
        double? postAmount = doc['ProgressAmount'];

 
        double updatedWalletAmount = (currentWalletAmount ?? 0) - (amountToDonate ?? 0);
        double updatePostAmount = (postAmount ?? 0) + (amountToDonate ?? 0);

        FirebaseFirestore.instance.collection('userData').doc(uid).update({
          'wallet': updatedWalletAmount,
          'ProgressAmount' : updatePostAmount,
        }).then((_) {
          print('Amount Donated successfully');
        }).catchError((error) {
          print('Failed to Donate amount : $error');
        });
      } else {
        print('User document does not exist');
      }
    }).catchError((error) {
      print('Failed to get user document: $error');
    });
  } else {
    print('User is not logged in');
  }
}
}
