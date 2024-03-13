

import 'package:Donobox/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNumTextField extends StatelessWidget {
  String? labelText;

  double? FieldH;

  double? FieldW;

  IconData? iconField;

   final TextEditingController? mycontroller;

  

  CustomNumTextField(
      {super.key,
      required this.labelText,
      required this.iconField,
      required this.FieldH,
      required this.FieldW,
      this.mycontroller
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: FieldH,
      width: FieldW,
      child: TextFormField(
        
        controller: mycontroller,
                          keyboardType: TextInputType.numberWithOptions(
                      decimal: true), // Allow decimal input
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(
                        r'[0-9.]')), // Allow digits and dot for decimal input
                  ],
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: PrimaryColors().gray200,
          filled: true,
          focusColor: PrimaryColors().gray200,
          labelText: labelText,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0).w,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: PrimaryColors().gray200),
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: Icon(iconField),
        ),
      ),
    );
  }
}



