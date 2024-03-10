import 'package:Donobox/screens/transaction/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


ElevatedButton reButton(text, bool isfirst, Function onTap) {
  return ElevatedButton(
    onPressed: () async {
      onTap();
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return isfirst ? Colors.grey : const Color.fromRGBO(255, 209, 72, 1);
        }
        return isfirst ? const Color.fromRGBO(255, 209, 72, 1) : Colors.grey;
      }),
    ),
    child: Text(
      text,
      style: const TextStyle(color: Colors.black),
    ),
  );
}

ElevatedButton blckbtn(BuildContext ctx, String btntext, Function onTap) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(340, 55),
        backgroundColor: Colors.black,
        side: BorderSide(width: 1, color: Colors.black),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          5,
        )),
      ),
      onPressed: () {
        onTap();
      },
      child: Text(
        btntext,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ));
}

showSnackbar(BuildContext ctx , String messege){
  return ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(
            action: SnackBarAction(
              label: 'Action',
              onPressed: () {
              },
            ),
            content: Text(messege),
            duration: const Duration(milliseconds: 1500),
            width: 350.0.w, // Width of the SnackBar.
            padding: EdgeInsets.symmetric(
              horizontal: 10.0.h, // Inner padding for SnackBar content.
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
}