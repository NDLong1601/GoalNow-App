import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/utils/logo_helper.dart';

class ClubInfo extends StatelessWidget {
  final String name;

  const ClubInfo({super.key, required this.name});

  static const double _logoSize = 22;
  static const double _textHeight = 32;
  static const double _width = 78;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      child: Column(
        children: [
          /// LOGO
          SizedBox(
            height: _logoSize,
            width: _logoSize,
            child: LogoHelper.clubLogo(name, size: _logoSize),
          ),

          const SizedBox(height: 6),

          /// TEXT
          SizedBox(
            height: _textHeight,
            child: Center(
              child: AppText(
                text: name,
                style: AppTextStyle.bodySmall,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
