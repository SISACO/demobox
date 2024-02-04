import 'dart:ffi';

import 'package:donobox/core/app_export.dart';
import 'package:donobox/core/colors/colors.dart';
import 'package:donobox/data/filter_data.dart';
import 'package:donobox/data/modalsData.dart';
import 'package:donobox/model/model.dart';
import 'package:donobox/reuseable/reuseable.dart';
import 'package:donobox/widgets/custom_elevated_button.dart';
import 'package:donobox/widgets/customtextField.dart';
import 'package:donobox/widgets/ten_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonationScrn extends StatelessWidget {
  const DonationScrn({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      
      bottomNavigationBar: Container(
        color: BackgroundColor,
        height: 200,
        child:  Column(
        
          children: [
            
                            Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 20.0),
                      child: Text("Send custom Amount",
                          style: TextStyle(
                              color: Color(0XFF121212),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: CustomtextField(
                FieldH: 60.h,
                FieldW: 380.w,
                        labelText: "Enter The Amount",
                        iconField: Icons.currency_rupee),
            ),
                                     Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: null,
                      shape: CircleBorder(),
                    ),
                    Text("Accept Terms & Conditions"),
                  ],
                ),
            blckbtn(context, 'Pay Now', () {}),

          ],
        ),
        
      ),
      body: Container(
        
        child: Center(
          
          child: ListView.builder(
            
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final amodel = AmountList[index];
              return Column(
                
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  newElevatedButton(Amodel: amodel)
                ],
              );
            },
            itemCount: AmountList.length,
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}
