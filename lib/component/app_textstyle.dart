import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class AppTextstyle {
  static const String _font = 'Poppins';

  /// Bold 700
  /// Semibold 600
  /// Medium 500
  /// Regular 400

  static TextStyle boldTsSize20Black = TextStyle(
    fontFamily: _font,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
  );

  static TextStyle boldTs16Primary = TextStyle(
    fontFamily: _font,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColor.primary,
  );

  static TextStyle semiboldTs16Black = TextStyle(
    fontFamily: _font,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColor.black,
  );

  static TextStyle semiboldTs16Primary = TextStyle(
    fontFamily: _font,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColor.primary,
  );
}
