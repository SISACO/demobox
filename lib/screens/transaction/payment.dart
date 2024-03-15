import 'package:Donobox/screens/AmountAdd/AmountAdd.dart';
import 'package:Donobox/screens/Donation/donation.dart';

import 'package:Donobox/widgets/appbar/PayBar.dart';

import 'package:flutter/material.dart';

class PaymentInterface extends StatelessWidget {
  String PostId;
   PaymentInterface({super.key, required this.PostId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PayBar(context),
          body: TabBarView(
            children: [DonationScrn(PostId: PostId,), AddAmount(showAppBar: false)],
          ),
        ),
      ),
    );
  }
}
