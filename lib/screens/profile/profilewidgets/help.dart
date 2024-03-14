import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class helpScrn extends StatelessWidget {
  const helpScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: ContactUsBottomAppBar(
          companyName: 'Donobox',
          textColor: Colors.white,
          backgroundColor: Colors.teal.shade300,
          email: 'adoshi26.ad@gmail.com',
          // textFont: 'Sail',
        ),
        backgroundColor: Colors.teal,
        body: ContactUs(
          cardColor: Colors.white,
          textColor: Colors.teal.shade900,
          logo: const AssetImage('assets/logo/dono-icon.png'),
          email: 'donobox2024@gmail.com',
          companyName: 'Donobox',
          companyColor: Colors.teal.shade100,
          dividerThickness: 2,
          phoneNumber: '+91 9544434265',
          // website: 'https://abhishekdoshi.godaddysites.com',
          // githubUserName: 'AbhishekDoshi26',
          // linkedinURL: 'https://www.linkedin.com/in/abhishek-doshi-520983199/',
          tagLine: 'Social Support',
          taglineColor: Colors.teal.shade100,
          // twitterHandle: 'AbhishekDoshi26',
          // instagram: '_abhishek_doshi',
          // facebookHandle: '_abhishek_doshi',
        ),
      ),
    );
  }
}