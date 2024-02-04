import 'dart:ffi';

import 'package:donobox/core/colors/colors.dart';
import 'package:donobox/widgets/menubar/MenuBar.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

AppBar MyAppBar(BuildContext context,String bartitle) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black,size: 35,),
    centerTitle: true,
    title: Text(bartitle,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
    backgroundColor: BackgroundColor,
    elevation: 0,
   
  );
}

// icon(Icons.volunteer_activism_outlined)