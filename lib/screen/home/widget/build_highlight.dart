import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/screen/highlight/video_screen.dart';
import 'package:provider/provider.dart';
import 'package:goalnow_app/provider/highlight_provider.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class BuildLatestHighlights extends StatelessWidget {
  const BuildLatestHighlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HighlightProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading || provider.channel == null) {
          return const SizedBox.shrink();
        }

        final videos = provider.channel!.videos.take(5).toList();
        if (videos.isEmpty) return const SizedBox.shrink();

        return SizedBox(
          height: 210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            clipBehavior: Clip.hardEdge,
            itemCount: videos.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final video = videos[index];
              return SizedBox(
                width: 220,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VideoScreen(
                          videoId: video.videoId,
                          title: video.title,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Thumbnail
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Image.network(
                              video.thumbnailUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // TEXT AREA
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                          child: SizedBox(
                            height: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: video.title,
                                  maxLines: 2,
                                  textOverflow: TextOverflow.ellipsis,
                                  style: AppTextStyle.bodySmall.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                                AppText(
                                  text: 'YouTube • Highlight',
                                  style: AppTextStyle.bodySmall.copyWith(
                                    color: Colors.white60,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
