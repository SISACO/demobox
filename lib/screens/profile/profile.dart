import 'package:donobox/reuseable/reuseable.dart';
import 'package:donobox/widgets/appbar/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScrn extends StatelessWidget {
  const ProfileScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'Profile'),
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: AssetImage('assets/logo/dono-logo.png'),radius: 100.r,),
            Profilebtn((){}, 'Edit Profile'),
          ],
        ),
      )),
    );
  }
}