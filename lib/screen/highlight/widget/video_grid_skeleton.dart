import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_color.dart';

class VideoGridSkeleton extends StatelessWidget {
  const VideoGridSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(color: Colors.white10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Container(
                  height: 12,
                  width: double.infinity,
                  color: Colors.white10,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 12,
                  width: 100,
                  color: Colors.white10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
