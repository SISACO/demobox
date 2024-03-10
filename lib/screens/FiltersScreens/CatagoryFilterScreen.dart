import 'package:Donobox/screens/home/home.dart';
import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:Donobox/widgets/menubar/MenuBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatogoryFilterScreen extends StatelessWidget {
  final Category;
  const CatogoryFilterScreen({super.key, this.Category});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            endDrawer: NavDrawer(),
            appBar: MyAppBar(context, Category),
            body: Padding(
              padding: const EdgeInsets.all(9.0).w,
              child: ListView(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, left: 12.0).w,
                        child: Text(Category + " Related Posts",
                            style: TextStyle(
                                color: Color(0XFF121212),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  //Catogory section
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
      .collection('PostData')
      .where('PostCatogory', isEqualTo: Category)
      .snapshots(),
                            builder: (
                              context,
                              AsyncSnapshot<QuerySnapshot> snapshot,
                            ) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    }
    if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
      return Text('No data available');
    }
                              if (!snapshot.hasData) {
                                return CircularProgressIndicator();
                              } else {
                                return ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(0.2).w,
                                      child: SizedBox(
                                        width: 11.w,
                                      ),
                                    );
                                  },
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.only(bottom: 27).w,
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (
                                    context,
                                    index,
                                  ) {
                                    final DocumentSnapshot document =
                                        snapshot.data!.docs[index];
                                    String postId = document.id;
                                    return Padding(
                                        padding: const EdgeInsets.all(14.0).w,
                                        child: newPost(
                                            Postid: postId,
                                            Image: document["Postimage"],
                                            title: document["PostTitle"],
                                            postprogress:
                                                document["PostProgress"]
                                                    .toString(),
                                            reqamount:
                                                document["RequestAmount"],
                                            progressamount:
                                                document["ProgressAmount"]
                                                    .toString(),
                                            description:
                                                document["PostDescription"]));
                                  },
                                );
                              }
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
