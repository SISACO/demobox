import 'package:Donobox/core/app_export.dart';
import 'package:Donobox/reuseable/reuseable.dart';
import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:Donobox/widgets/custom_elevated_button.dart';
import 'package:Donobox/widgets/customtextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAmount extends StatefulWidget {
  final bool? showAppBar;
  AddAmount({super.key, required this.showAppBar});

  @override
  State<AddAmount> createState() => _AddAmountState();
}

class _AddAmountState extends State<AddAmount> {
  TextEditingController _transactionIdController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  double totalAmount = 0.0;
  String assignedTransactionId = '12345678';

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: widget.showAppBar! ? MyAppBar(context, "Add Amount") : null,
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10).w,
        child:  blckbtn(context, 'Add Amount', () {
         saveAmount();
        }),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.h,
              ),
              CustomtextField(
                mycontroller: _transactionIdController,
                FieldH: 55.h,
                FieldW: 350.h,
                labelText: "Enter The Transaction ID",
                iconField: Icons.vpn_key,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomtextField(
                
                mycontroller: _amountController,
                FieldH: 55.h,
                FieldW: 350.h,
                labelText: "Enter The Amount",
                iconField: Icons.currency_rupee,
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 300.h,
                width: 300.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/testqr.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 70.0).w,
              //   child: Row(
              //     children: [
              //       CustomButtonTwo(
              //         Textt: "UPI ID",
              //       ),
              //       SizedBox(
              //         width: 40.w,
              //       ),
              //       CustomButtonTwo(Textt: "SAVE")
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  void saveAmount() {
 
    String enteredTransactionId = _transactionIdController.text;
    double enteredAmount = double.tryParse(_amountController.text) ?? 0.0;

  
    if (enteredTransactionId == assignedTransactionId) {
   
      setState(() {
        totalAmount += enteredAmount;
      });
     
      _transactionIdController.clear();
      _amountController.clear();

  
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Amount saved successfully')),
      );

      uploadToFirebase(enteredAmount);
    } else {
      // If the transaction IDs don't match, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Transaction ID does not match')),
      );
    }
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _transactionIdController.dispose();
    _amountController.dispose();
    super.dispose();
  }


void uploadToFirebase(double? amountToAdd) {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    String uid = user.uid;
    
    
    FirebaseFirestore.instance.collection('userData').doc(uid).get().then((doc) {
      if (doc.exists) {
     
        double? currentWalletAmount = doc['wallet'];

 
        double updatedWalletAmount = (currentWalletAmount ?? 0) + (amountToAdd ?? 0);

        FirebaseFirestore.instance.collection('userData').doc(uid).update({
          'wallet': updatedWalletAmount,
        }).then((_) {
          print('Amount added to wallet successfully');
        }).catchError((error) {
          print('Failed to add amount to wallet: $error');
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
