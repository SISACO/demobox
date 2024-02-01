
import 'package:donobox/widgets/menubar/MenuBar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
export 'package:donobox/widgets/custom_image_view.dart';
import 'package:donobox/core/app_export.dart';
import 'package:donobox/widgets/appbar/AppBar.dart';
import 'package:donobox/widgets/ten_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:donobox/theme/theme_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      
      endDrawer: NavDrawer(),
      appBar: MyAppBar(context),
      
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: ListView(
          
          children: [
            SizedBox(height: 5),
            UserWallet(),
            SizedBox(height: 17),
            SearchBarApp(),
            SizedBox(height: 17),
            //Catogory section
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 125,
                    child: ListView.separated(
                      padding: EdgeInsets.only(bottom: 27),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (
                        context,
                        index,
                      ) {
                        return Padding(
                          padding: const EdgeInsets.all(0.6),
                          child: SizedBox(
                            width: 21,
                          ),
                        );
                      },
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return TenItemWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                  child: Text("Featured",
                      style: TextStyle(
                          color: Color(0XFF121212), fontSize: 20,fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            //Catogory section
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    
                    height: 10000,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                          return Padding(
                          padding: const EdgeInsets.all(0.2),
                          child: SizedBox(
                            width: 11,
                          ),
                        );
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 27),
                      scrollDirection: Axis.vertical,
                      
                      itemCount: 60,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: newPost(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class newPost extends StatelessWidget {
  const newPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(7))),
      height: 500,
      width: 420,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/test.jpg",),fit: BoxFit.fill,),
                borderRadius: BorderRadius.all(Radius.circular(9)),
              color: Colors.black),
              height: 200,
              width: 300,
              
            ),
          ),
          SizedBox(height: 5),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Help Them Smile Again",style: TextStyle(fontSize: 16),),
              )
            ],
          ),
          SizedBox(height: 5),
          Column(
            children: [
                    LinearPercentIndicator(
                    width: 300.0,
                    lineHeight: 6.0,
                    percent: 0.5,
                    barRadius: Radius.circular(3),
                    progressColor: Color(0XFFFFDC73),
                  )
            ],
          ),
          SizedBox(height: 5),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  
                  children: [
                    Text("\u{20B9}55.99",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    Text("/",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                    Text("\u{20B9}100",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Color(0X498F8F8F))),
                    Padding(
                      padding: const EdgeInsets.only(left:160.0),
                      child: Text("50%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                    )
                  ],
                  
                ),
              ),
              
            ],
          ),
          Column(
           
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris volutpat, ex elementum tincidunt pellentesque, nunc tortor commodo ipsum, at convallis urna mi nec dolor. Nunc luctus convallis nisl, dapibus rhoncus justo consectetur ac. Donec in mi sapien. Aliquam ac mattis augue.",style: TextStyle(fontWeight: FontWeight.w500),),
              )
            ],
          ),
          Column(
            children: [
              Center(
                child: ElevatedButton(
                  
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(left:80.0,right:80.0),
                                backgroundColor: Colors.black,
                                side: BorderSide(width: 1, color: Colors.black),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                  5,
                                )),
                                
                                ),
                            onPressed: () {},
                            child: Text(
                              'See more',
                              style:
                                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);

    return SearchBar(
      hintText: "Search Here",
      
      padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0)),
      onTap: () {
        ;
      },
      onChanged: (_) {
        ;
      },
      leading: const Icon(Icons.search),
      // trailing: <Widget>[
      //   Tooltip(
      //     message: 'Change brightness mode',
      //     child: IconButton(
      //       isSelected: isDark,
      //       onPressed: () {
      //         setState(() {
      //           isDark = !isDark;
      //         });
      //       },
      //       icon: const Icon(Icons.wb_sunny_outlined),
      //       selectedIcon: const Icon(Icons.brightness_2_outlined),
      //     ),
      //   )
      // ],
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
          borderRadius: BorderRadius.all(Radius.circular(9))),
      height: 110,
      width: 370,
      child: Row(
        children: [
          SizedBox(
            height: 88,
            width: 88,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 65,
                    width: 69,
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
                  height: 35,
                  width: 35,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 17,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 21),
                child: Text(
                  "User wallet",
                  style: TextStyle(color: Color(0XFF121212), fontSize: 15),
                ),
              ),
              SizedBox(height: 7),
              Text("\u{20B9}0.00",
                  style: TextStyle(
                      color: Color(0XFF121212),
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(25),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  side: BorderSide(width: 1, color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    20,
                  ))),
              onPressed: () {},
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
