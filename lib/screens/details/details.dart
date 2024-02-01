
import 'package:donobox/reuseable/details_reuse.dart';
import 'package:flutter/material.dart';

class DetailsScrn extends StatelessWidget {
  const DetailsScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details'),),
      body: SafeArea(
        child: reDetails(Image.asset('assets/images/test.jpg'), const Text('Help Them Smile Again'), '10000 / 20000', const Text('anything'))
      ),
    );
  }
}