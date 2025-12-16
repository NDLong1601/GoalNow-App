import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_section.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset(AppAssetsPath.list),
            onPressed: () => Navigator.pop(context),
          ),
          title: AppText(text: "Home", style: AppTextstyle.semiboldTs16Black),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () {},
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .center,
            children: [
              AppSectionTitle(
                title: 'Tin tức nổi bật',
                showAction: true,
                actionText: 'More',
              ),
              AppSectionTitle(
                title: 'Các trận đấu đang diễn ra',
                showAction: true,
                actionText: 'More',
              ),
              AppSectionTitle(
                title: 'Lịch thi đấu sắp tới',
                showAction: true,
                actionText: 'More',
              ),
              AppSectionTitle(title: 'Đội bóng yêu thích của tôi'),
            ],
          ),
        ),
      ),
    );
  }
}
