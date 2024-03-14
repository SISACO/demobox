import 'dart:math';

import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class helpScrn extends StatelessWidget {
  const helpScrn({super.key});

  final email = 'donobox2024@gmail.com';
  final num = '+91 9544434265';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'Help & Support'),
      backgroundColor: Color.fromRGBO(255, 220, 115, 1),
      bottomNavigationBar: Container(decoration: BoxDecoration(
              color: Colors.black87,
            ),
        // margin: EdgeInsets.only(left:10,right: 10),
        height: 80.h,
        child:Center(child: Text('Designed and Developed by DONOBOX',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Color.fromRGBO(255, 220, 115, 1),
            backgroundImage: AssetImage('assets/logo/dono-logo.png'),
            radius: 140.r,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 236, 178, 18),
                borderRadius: BorderRadius.circular(10.0),
                
              ),
              margin: EdgeInsets.all(10.0).h,
                width: 390.w,
                height: 60.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Icon(Icons.email),
                  Text('donobox2024@gmail.com'),
                  IconButton(onPressed: ()async{
                     await Clipboard.setData(ClipboardData(text: "donobox2024@gmail.com"));
                     ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Copied to Clipboard")));
                  }, icon: Icon(Icons.copy))
                ],),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 236, 178, 18),
              borderRadius: BorderRadius.circular(10.0),
              
            ),
            margin: EdgeInsets.all(8.0).h,
              width: 290.w,
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Icon(Icons.phone),
                Text('+91 9544434265'),
                IconButton(onPressed: ()async{
                  await Clipboard.setData(ClipboardData(text: "+91 9544434265"));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Copied to Clipboard")));
                }, icon: Icon(Icons.copy))
              ],),
          ),
          
        ],
      ),
    );
    }}
      