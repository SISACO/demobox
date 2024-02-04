import 'package:donobox/reuseable/reuseable.dart';
import 'package:flutter/material.dart';

class DonationScrn extends StatelessWidget {
  const DonationScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom:10,left: 10,right: 10),
        child: blckbtn(context,'Pay Now',(){

        }),
      ),
    );
  }
}

