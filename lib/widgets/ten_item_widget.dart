import 'package:donobox/core/app_export.dart';
import 'package:donobox/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class TenItemWidget extends StatelessWidget {
  final Filters fmodel;
  const TenItemWidget({Key? key, required this.fmodel})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 71.w,
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
                      height: 61.h,
                      width: 61.w,
                      decoration: BoxDecoration(
                        color: PrimaryColors().black900,
                        borderRadius: BorderRadius.circular(
                          35,
                        ),
                      ),
                    ),
                  ),
                  // IconButton(onPressed: (){}, icon: Icon(Icons.ac_unit_outlined))
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
              fmodel.t1,
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
