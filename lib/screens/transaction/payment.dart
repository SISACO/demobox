import 'package:Donobox/screens/AmountAdd/AmountAdd.dart';
import 'package:Donobox/screens/Donation/donation.dart';
import 'package:Donobox/screens/home/home.dart';
import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:Donobox/widgets/appbar/PayBar.dart';
import 'package:Donobox/widgets/menubar/MenuBar.dart';
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
            children: [DonationScrn(), AddAmount(showAppBar: false)],
          ),
        ),
      ),
    );
  }
}
