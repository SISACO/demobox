import 'package:donobox/core/app_export.dart';
import 'package:donobox/core/colors/colors.dart';
import 'package:flutter/material.dart';

AppBar PayBar(BuildContext context) {
  return AppBar(
    iconTheme: IconThemeData(
      color: PrimaryColors().black900,
      size: 35,
    ),
    centerTitle: true,
    title: Text("Donate Now",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
    backgroundColor: BackgroundColor,
    elevation: 0,
    bottom: TabBar(
      
      isScrollable: true,
      labelColor: Colors.black,
      unselectedLabelColor: Color(0X498F8F8F),
      indicatorWeight: 3,
      
  indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: PrimaryColors().amber300,
      tabs: [
       
        Tab( child: Text("Donation Amount",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),
        Tab( child: Text("Add Amount",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),
      ],
    ),
  );
}
