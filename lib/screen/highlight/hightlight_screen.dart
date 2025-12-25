import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/utils/format_helper.dart';

class HighlightScreen extends StatefulWidget {
  const HighlightScreen({super.key});

  @override
  State<HighlightScreen> createState() => _HighlightScreenState();
}

class _HighlightScreenState extends State<HighlightScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      overlayOpacity: 0.85,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        elevation: 0,
        title: AppText(text: 'Highlights', style: AppTextStyle.h2),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list_alt, color: AppColor.iconPrimary),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Divider(height: 1),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              height: 100,
              decoration: BoxDecoration(
                color: AppColor.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColor.primaryDark),
              ),
              child: Row(
                children: [
                  // Avatar /lable "CB" / name
                  Column(
                    children: [
                      Stack(
                        children: [
                          // Avartar
                          ClipRRect(
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          // Position
                          Positioned(child: AppText(text: 'CB'))
                        ],
                      ),
                      AppText(
                        text: FormatHelper.formatPlayerName('Semenusya An'),
                        style: AppTextStyle.bodyLarge,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
