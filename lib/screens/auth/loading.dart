import 'package:flutter/material.dart';

class loadingScrn extends StatelessWidget {
  const loadingScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Please Wait A moment" )),
        ],),
    ),
        ],
      ),
    );
  }
}