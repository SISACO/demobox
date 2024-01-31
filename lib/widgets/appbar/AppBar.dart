import 'package:donobox/core/colors/colors.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

AppBar MyAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text("Hello Good People",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
    backgroundColor: BackgroundColor,
    elevation: 0,
    leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: NeutralBlack,
          size: 45,
        )),
  );
}
