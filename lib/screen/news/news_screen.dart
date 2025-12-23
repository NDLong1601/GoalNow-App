import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_card.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/utils/format_helper.dart';
import 'package:goalnow_app/provider/news_provider.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      overlayOpacity: 0.9,
      appBar: AppBar(
        title: AppText(text: 'Hot News', style: AppTextStyle.h2),
        backgroundColor: AppColor.background,
        elevation: 0,
      ),
      body: Consumer<NewsProvider>(
        builder: (context, provider, _) {
          if (provider.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }

          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 24),
            itemCount: provider.news.length,
            itemBuilder: (context, index) {
              final news = provider.news[index];

              return AppNewsVerticalCard(
                title: news.title,
                imageUrl: news.imageUrl,
                source: news.source,
                timeAgo: FormatHelper.timeAgo(news.time),
                commentCount: 0,
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
