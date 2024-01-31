import 'package:donobox/core/utils/size_utils.dart';
import 'package:donobox/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class CustomTextStyles {
  // Body text style
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  // Title text style
  static get titleMediumExtraBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: 19.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumGray20001 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray20001,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900.withOpacity(0.48),
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
