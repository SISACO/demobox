import 'package:Donobox/core/app_export.dart';
import 'package:Donobox/model/model.dart';
import 'package:Donobox/screens/Donation/donation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonTwo extends StatelessWidget {
  final String? Textt;
  final Postid;
  CustomButtonTwo({super.key, required this.Textt, this.Postid});

  @override
  Widget build(
    BuildContext context,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: PrimaryColors().whiteA700,
          padding: EdgeInsets.symmetric(horizontal: 30),
          side: BorderSide(width: 2, color: PrimaryColors().amberA100),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            20,
          ))),
      onPressed: () {},
      child: Text(
        Textt ?? '',
        style: TextStyle(
            color: PrimaryColors().black900, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class newElevatedButton extends StatelessWidget {
  final DtAmount Amodel;
  newElevatedButton({super.key, required this.Amodel});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        
      },
      child: Text(
        Amodel.Amount,
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
    );
  }
}
