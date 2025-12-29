import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_card.dart';
import 'package:goalnow_app/core/utils/format_helper.dart';
import 'package:goalnow_app/provider/news_provider.dart';
import 'package:provider/provider.dart';

class BuildNews extends StatefulWidget {
  const BuildNews({super.key});

  @override
  State<BuildNews> createState() => _BuildNewsState();
}

class _BuildNewsState extends State<BuildNews> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<NewsProvider>().fetchTrendingNews();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, provider, _) {
        if (provider.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.error != null) {
          return Text(provider.error!);
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.news.length,
          itemBuilder: (context, index) {
            final news = provider.news[index];
            return AppNewsCard(
              title: news.title,
              imageUrl: news.imageUrl,
              timeAgo: FormatHelper.timeAgo(news.time),
              onTap: () {
                // navigate to detail
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 4),
        );
      },
    );
  }
}
