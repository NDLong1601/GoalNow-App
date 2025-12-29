import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class AppNewsCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String timeAgo;
  final VoidCallback? onTap;

  const AppNewsCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.timeAgo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColor.primary.withValues(alpha: 0.8)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                width: 88,
                height: 88,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 88,
                  height: 88,
                  color: AppColor.background,
                  alignment: Alignment.center,
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),

            const SizedBox(width: 12),

            /// Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  AppText(
                    text: title,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    textOverflow: TextOverflow.ellipsis,
                    style: AppTextStyle.cardTitle.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// Time
                  AppText(
                    text: timeAgo,
                    style: AppTextStyle.cardSubtitle.copyWith(
                      color: AppColor.white.withValues(alpha: 0.6),
                    ),
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

class AppNewsVerticalCard extends StatelessWidget {
  final String title;
  final String? description;
  final String imageUrl;
  final String source;
  final String timeAgo;
  final int commentCount;
  final VoidCallback? onTap;

  const AppNewsVerticalCard({
    super.key,
    required this.title,
    this.description,
    required this.imageUrl,
    required this.source,
    required this.timeAgo,
    required this.commentCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColor.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColor.primary.withValues(alpha: 0.8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image + title overlay
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
              child: Stack(
                children: [
                  Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) => Container(
                      height: 200,
                      width: double.infinity,
                      color: AppColor.background,
                      alignment: Alignment.center,
                      child: const Icon(Icons.image_not_supported),
                    ),
                  ),


                  /// Gradient overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.65),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// Title
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: 16,
                    child: AppText(
                      text: title,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                      style: AppTextStyle.h3.copyWith(color: AppColor.white),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Meta
                  Row(
                    children: [
                      AppText(
                        text: source,
                        style: AppTextStyle.bodySmall.copyWith(
                          color: AppColor.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      AppText(
                        text: '• $timeAgo',
                        style: AppTextStyle.bodySmall.copyWith(
                          color: AppColor.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// Description
                  AppText(
                    text: description ?? '',
                    maxLines: 3,
                    textOverflow: TextOverflow.ellipsis,
                    style: AppTextStyle.cardSubtitle.copyWith(
                      color: AppColor.white.withValues(alpha: 0.85),
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// Comments
                  Row(
                    children: [
                      const Icon(
                        Icons.chat_bubble_outline,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 6),
                      AppText(
                        text: '$commentCount Comments',
                        style: AppTextStyle.bodySmall.copyWith(
                          color: AppColor.white,
                        ),
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
