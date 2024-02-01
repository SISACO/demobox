import 'package:donobox/core/app_export.dart';
import 'package:flutter/material.dart';

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
              height: 57,
              width: 61,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 56,
                      width: 61,
                      decoration: BoxDecoration(
                        color: appTheme.gray900,
                        borderRadius: BorderRadius.circular(
                          35,
                        ),
                      ),
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgUser,
                    height: 31,
                    width: 28,
                    color: Colors.white,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Charity",
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ],
        ),
      ),
    );
  }
}
