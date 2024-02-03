
import 'package:donobox/model/model.dart';
import 'package:donobox/reuseable/reuseable.dart';
import 'package:donobox/widgets/appbar/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyDetails extends StatelessWidget {
  const MyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}



class DetailsScrn extends StatelessWidget {
  final NewPost model;
    DetailsScrn({super.key,required this.model});

     int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'More Details'),
      body: SafeArea(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(7))),
      height: double.infinity,
      width: 420,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(borderRadius: BorderRadius.circular(8.0),child: Image.asset(model.img[0]),),
          ),
          SizedBox(height: 5),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(model.slogan,style: TextStyle(fontSize: 16)),
              )
            ],
          ),
          SizedBox(height: 5),
          Column(
            children: [
          LinearPercentIndicator(
                    width: 350.0,
                    lineHeight: 6.0,
                    percent: model.linear,
                    barRadius: Radius.circular(3),
                    progressColor: Color(0XFFFFDC73),
                  )
            ],
          ),
          SizedBox(height: 5),
          Column(
            children:[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(model.gefund,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    Text(" / ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                    Text(model.refund,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Color(0X498F8F8F))),
                      Padding(
                      padding:  EdgeInsets.only(left:200.0),
                      child: Text(model.perc,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),),
                      
                  ],
                  
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20,),
                padding: EdgeInsets.only(left: 10),
                height: 86,
                width: 343,
                decoration: BoxDecoration(color: Color.fromRGBO(217, 217, 217, 0.66),borderRadius: BorderRadius.circular(10)),
                child:Row(children: [
                  CircleAvatar(backgroundImage: AssetImage('assets/logo/dono-logo.png'),),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('DonoBox Community',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                      SizedBox(height:2),
                      Text('Verified Foundation',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Color(0X498F8F8F),))
                    ],
                  ),
                  SizedBox(width: 90,),
                Icon(Icons.verified_rounded,color: Colors.blue,)
                ],)
              ),SizedBox(height: 10,)

            ],
          ),
          
          Column(
            children:[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(model.des, style: TextStyle(fontWeight: FontWeight.w500),),
              ),
              SizedBox(height: 20,)
            ],
          ),
          Column(
            children: [
              Center(
                child:blckbtn(context,Text(
                              'Donate Now',
                              style:
                                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          )
              )
            ],
          )

        ],
      ),
    ),
      ),
    );
  }
}