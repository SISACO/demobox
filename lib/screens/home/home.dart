import 'dart:ffi';

export 'package:donobox/widgets/custom_image_view.dart';
import 'package:donobox/core/app_export.dart';
import 'package:donobox/core/colors/colors.dart';
import 'package:donobox/core/utils/size_utils.dart';
import 'package:donobox/theme/app_decoration.dart';
import 'package:donobox/theme/theme_helper.dart';
import 'package:donobox/widgets/appbar/AppBar.dart';
import 'package:donobox/widgets/custom_elevated_button.dart';
import 'package:donobox/widgets/ten_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:donobox/theme/theme_helper.dart';
import 'package:donobox/theme/custom_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 24),
            UserWallet(),
            SizedBox(height: 24),
            SearchBarApp(),
            SizedBox(height: 17),
            //Catogory section
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 129,
                    child: ListView.separated(
                      padding: EdgeInsets.only(bottom: 27),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (
                        context,
                        index,
                      ) {
                        return Padding(
                          padding: const EdgeInsets.all(2.9),
                          child: SizedBox(
                            width: 20,
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

            Container(
              height: size.height,
              width: size.width,
              color: Colors.blue,
            )
          ],
        ),
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
              Text("₹ 0.00",
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
