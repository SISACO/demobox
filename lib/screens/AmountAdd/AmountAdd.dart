import 'package:donobox/reuseable/reuseable.dart';
import 'package:donobox/widgets/customtextField.dart';
import 'package:flutter/material.dart';

class AddAmount extends StatelessWidget {
  const AddAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom:10,left: 10,right: 10),
        child: blckbtn(context,'Add Amount', (){}),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              CustomtextField(labelText: "Enter The Transaction ID", iconField: Icons.vpn_key, ),
                          SizedBox(
                height: 30,
              ),
              CustomtextField(labelText: "Enter The Amount", iconField: Icons.currency_rupee,),
                                      SizedBox(
                height: 30,
              ),
      Container(
        
          height: 300,
          width: 300,
          decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage('assets/images/testqr.png'),
              fit: BoxFit.fill,
          ),
          ),
      ),
            ],
            
          ),
        ),
      ),
    );
  }
}
