import 'package:donobox/screens/AmountAdd/AmountAdd.dart';
import 'package:donobox/screens/Donation/donation.dart';
import 'package:donobox/screens/home/home.dart';
import 'package:donobox/widgets/appbar/AppBar.dart';
import 'package:donobox/widgets/appbar/PayBar.dart';
import 'package:donobox/widgets/menubar/MenuBar.dart';
import 'package:flutter/material.dart';

class PaymentInterface extends StatelessWidget {
  const PaymentInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      
      body: DefaultTabController(  
        
        length: 2,  
        child: Scaffold(  
          appBar: PayBar(context),  
          body: TabBarView(  
            children: [  
             DonationScrn(),  
             AddAmount(showAppBar: false)  
            ],  
          ),  
        ),  
      ), 
              
              
    );
  }
}