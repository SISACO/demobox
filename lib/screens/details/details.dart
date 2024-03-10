import 'package:Donobox/model/model.dart';
import 'package:Donobox/reuseable/reuseable.dart';
import 'package:Donobox/screens/transaction/payment.dart';
import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DetailsScrn extends StatelessWidget {
  final postid;
  DetailsScrn({super.key, required this.postid});
 
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('PostData')
            .doc(postid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
           if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Text('Document does not exist');
        }

        var data = snapshot.data!.data() as Map<String, dynamic>?;

        if (data == null) {
          return Text('Data is null');
        }else{
          
          String imageUrl = data["Postimage"];

          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } 
            
                                          
          return Scaffold(
            appBar: MyAppBar(context, 'More Details'),
            bottomNavigationBar: Container(
              margin: EdgeInsets.only(bottom: 10, left: 10, right: 10).w,
              child: blckbtn(context, 'Donate Now', () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx1) => PaymentInterface()));
              }),
            ),
            body: SafeArea(
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0).w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0).r,
                          child: Image.network(imageUrl),
                        ),
                      ),
                      SizedBox(height: 5),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0).w,
                            child: Text(data["PostTitle"],
                                style: TextStyle(fontSize: 16)),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        children: [
                          LinearPercentIndicator(
                            width: 420.0.w,
                            lineHeight: 6.0.h,
                            percent: double.parse(data["PostProgress"].toString()) / 100.0,
                            barRadius: Radius.circular(3).r,
                            progressColor: Color(0XFFFFDC73),
                          )
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0).w,
                            child: Row(
                              children: [
                                Text(
                                  "\u{20B9}" + data["ProgressAmount"].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(" / ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                Text("\u{20B9}" + data["RequestAmount"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Color(0X498F8F8F))),
                                Padding(
                                  padding: EdgeInsets.only(left: 200.0),
                                  child: Text(data["PostProgress"].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                top: 20,
                              ).w,
                              padding: EdgeInsets.only(left: 10).w,
                              height: 86.h,
                              width: 405.w,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(217, 217, 217, 0.66),
                                  borderRadius: BorderRadius.circular(10).r),
                              child: Row(
                                children: [
                                  // CircleAvatar(
                                  //   backgroundImage:
                                  //       AssetImage('assets/logo/dono-logo.png'),
                                  // ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(data["PostCommunity"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                      SizedBox(height: 2),
                                      Text('Verified Foundation',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Color(0X498F8F8F),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    width: 90.w,
                                  ),
                                  Icon(
                                    Icons.verified_rounded,
                                    color: Colors.blue,
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),

                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0).w,
                            child: Text(
                              data["PostDescription"],
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      ),
                      // Column(
                      //   children: [
                      //     Center(
                      //       child:Container(
                      //         margin: EdgeInsets.only(bottom: 8.0),
                      //         child: blckbtn(context,Text(
                      //                       'Donate Now',
                      //                       style:
                      //                           TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      //                     ),
                      //                   ),
                      //       )
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        });
    //);
  }
}
