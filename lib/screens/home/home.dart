import 'package:Donobox/data/filter_data.dart';
import 'package:Donobox/data/newpost_data.dart';
import 'package:Donobox/model/model.dart';
import 'package:Donobox/screens/FiltersScreens/SearchFilterScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:Donobox/screens/AmountAdd/AmountAdd.dart';

import 'package:Donobox/screens/details/details.dart';
import 'package:Donobox/widgets/menubar/MenuBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
export 'package:Donobox/widgets/custom_image_view.dart';
import 'package:Donobox/core/app_export.dart';
import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:Donobox/widgets/ten_item_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final size = MediaQuery.of(context).size;

    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return Scaffold(
            endDrawer: NavDrawer(),
            appBar: MyAppBar(context, 'Hello Good People'),
            body: Padding(
              padding: const EdgeInsets.all(9.0).w,
              child: ListView(
                children: [
                  SizedBox(height: 5.h),
                  UserWallet(),
                  SizedBox(height: 17.h),
                  SearchBarApp(),
                  SizedBox(height: 17.h),
                  //Catogory section
                  CatogorySection(),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, left: 12.0).w,
                        child: Text("Featured",
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
                                .collection("PostData")
                                .snapshots(),
                            builder: (
                              context,
                              AsyncSnapshot<QuerySnapshot> snapshot,
                            ) {
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
        });
  }
}

class CatogorySection extends StatelessWidget {
  const CatogorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 125.h,
            child: ListView.separated(
              padding: EdgeInsets.only(bottom: 27).w,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (
                context,
                index,
              ) {
                return Padding(
                  padding: const EdgeInsets.all(0.6).w,
                  child: SizedBox(
                    width: 20.w,
                  ),
                );
              },
              itemCount: filterslist.length,
              itemBuilder: (context, index) {
                final fmodel = filterslist[index];
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 6).w,
                    child: TenItemWidget(
                      fmodel: fmodel,
                    ));
              },
            ),
          ),
        ),
      ],
    );
  }
}

class newPost extends StatelessWidget {
  final Image;
  final title;
  final postprogress;
  final reqamount;
  final progressamount;
  final description;
  final Postid;

  newPost(
      {super.key,
      required this.Image,
      required this.title,
      required this.postprogress,
      required this.reqamount,
      required this.progressamount,
      required this.description,
      required this.Postid});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(7)).w),
      height: 560.h,
      width: 420.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0).w,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(Image),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                  color: Colors.black),
              height: 250.h,
              width: 360.w,
            ),
          ),
          SizedBox(height: 5.h),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0).w,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16.sp),
                ),
              )
            ],
          ),
          SizedBox(height: 5.h),
          Column(
            children: [
              LinearPercentIndicator(
                width: 360.0.w,
                lineHeight: 6.0,
                percent: double.parse(postprogress) / 100.0,
                barRadius: Radius.circular(3),
                progressColor: PrimaryColors().amber300,
              )
            ],
          ),
          SizedBox(height: 5.h),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0).w,
                child: Row(
                  children: [
                    Text(
                      "\u{20B9}" + progressamount,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    Text(" / ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.sp)),
                    Text("\u{20B9}" + reqamount,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            color: Color(0X498F8F8F))),
                    Padding(
                      padding: const EdgeInsets.only(left: 190.0).w,
                      child: Text(postprogress + "%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp)),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0).w,
                child: Text(
                  description,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 5,
                ),
              )
            ],
          ),
          Column(
            children: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(left: 80.0, right: 80.0).w,
                    backgroundColor: Colors.black,
                    side: BorderSide(width: 1.w, color: Colors.black),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      5,
                    ).w),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx1) => DetailsScrn(postid: Postid)));
                  },
                  child: Text(
                    'See more',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  bool isDark = false;
  late TextEditingController _searchController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);

    return SearchBar(
      hintText: "Search Here",
      padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0)),
      onSubmitted: (value) {
        SearchResultsScreen(SearchData: _searchQuery);
      },
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx1) => SearchResultsScreen(SearchData: _searchQuery)));
      },
      onChanged: (value) {
        setState(() {
          _searchQuery = value;
        });
        ;
      },
      leading: const Icon(Icons.search),
    );
  }
}

class UserWallet extends StatelessWidget {
  const UserWallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: appTheme.amber300,
          borderRadius: BorderRadius.all(Radius.circular(9)).w),
      height: 120.h,
      width: 370.w,
      child: Row(
        children: [
          SizedBox(
            height: 88.h,
            width: 88.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 65.h,
                    width: 65.w,
                    decoration: BoxDecoration(
                      color: appTheme.gray200,
                      borderRadius: BorderRadius.circular(
                        34,
                      ),
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgUser,
                  height: 35.h,
                  width: 35.w,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 17,
            ).w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 21).w,
                child: Text(
                  "User wallet",
                  style: TextStyle(color: Color(0XFF121212), fontSize: 15.sp),
                ),
              ),
              SizedBox(height: 7),
              Text("\u{20B9}0.00",
                  style: TextStyle(
                      color: Color(0XFF121212),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp)),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(25).w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  side: BorderSide(width: 1, color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    20,
                  ))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => AddAmount(
                          showAppBar: true,
                        )));
              },
              child: Text(
                'Top up',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
