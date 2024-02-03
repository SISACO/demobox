
import 'package:donobox/core/colors/colors.dart';
import 'package:donobox/reuseable/details_reuse.dart';
import 'package:donobox/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class DetailsScrn extends StatelessWidget {
  const DetailsScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details'),),
      body: SafeArea(
        
        child: Column(
          children: [
            Container(
              color: NeutralBlack,
            )
          ],
        )
        
      ),
    );
  }
}