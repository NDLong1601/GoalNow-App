import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/model/video_model.dart';

class VideoGridCard extends StatelessWidget {
  final VideoModel video;
  final VoidCallback onTap;

  const VideoGridCard({super.key, required this.video, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white30.withValues(alpha: 0.2)),
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
                child: Image.network(video.thumbnailUrl, fit: BoxFit.cover),
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
                    // Title – luôn 2 dòng
                    AppText(
                      text: video.title,
                      style: AppTextStyle.bodySmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),

                    const Spacer(),
                    // Meta
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
    );
  }
}
