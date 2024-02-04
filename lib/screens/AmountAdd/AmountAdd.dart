import 'package:donobox/core/app_export.dart';
import 'package:donobox/reuseable/reuseable.dart';
import 'package:donobox/widgets/appbar/AppBar.dart';
import 'package:donobox/widgets/custom_elevated_button.dart';
import 'package:donobox/widgets/customtextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAmount extends StatelessWidget {
  const AddAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, "Add Anount"),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom:10,left: 10,right: 10).w,
        child: blckbtn(context,'Add Amount', (){}),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.h,
              ),
              CustomtextField(FieldH: 55.h,FieldW: 350.h,
                labelText: "Enter The Transaction ID", iconField: Icons.vpn_key, ),
                          SizedBox(
                height: 30.h,
              ),
              CustomtextField(FieldH: 55.h,FieldW: 350.h, labelText: "Enter The Amount", iconField: Icons.currency_rupee,),
                                      SizedBox(
                height: 30.h,
              ),
      Container(
        
          height: 300.h,
          width: 300.w,
          decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('assets/images/testqr.png'),
              fit: BoxFit.fill,
          ),
          ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal:80.0).w,
        child: Row(
          
          children: [
            CustomButtonTwo(Textt: "UPI ID",),
            
            SizedBox(width: 40.w,),
            CustomButtonTwo(Textt: "SAVE",),
      
          ],
        ),
      )
            ],
            
          ),
        ),
      ),
    );
  }
}
