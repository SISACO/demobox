import 'package:donobox/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TenItemWidget extends StatelessWidget {
  const TenItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 71,
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(57),
              width: ScreenUtil().setWidth(72),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 56.h,
                      width: 61.w,
                      decoration: BoxDecoration(
                        color: PrimaryColors().black900,
                        borderRadius: BorderRadius.circular(
                          35,
                        ),
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgUser,
                    height: 31.h,
                    width: 28.w,
                    color: PrimaryColors().whiteA700,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Charity",
              style: TextStyle(
                color: PrimaryColors().black900
              ),
            ),
          ],
        ),
      ),
    );
  }
}
