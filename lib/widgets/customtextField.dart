import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomtextField extends StatelessWidget {
  String? labelText;

  IconData? iconField;

  CustomtextField({super.key, required this.labelText, required this.iconField});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.h,
      width: 330.w,
      child: TextFormField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Color.fromARGB(255, 159, 157, 157),
          filled: true,
          focusColor: Color.fromARGB(255, 159, 157, 157),
          labelText: labelText,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0).w,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: Icon(iconField),
        ),
      ),
    );
  }
}
