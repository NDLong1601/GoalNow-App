// import 'package:flutter/material.dart';
// import 'package:goalnow_app/model/channel_model.dart';
// import 'package:goalnow_app/repository/youtube_repository.dart';

// class HighlightProvider extends ChangeNotifier {
//   final YouTubeRepository repository;

//   HighlightProvider({required this.repository});

//   bool isLoading = false;
//   String? error;
//   ChannelModel? channel;

//   // Load highlights from repository
//   Future<void> loadHighlights() async {
//     isLoading = true;
//     error = null;
//     notifyListeners();

//     try {
//       channel = await repository.fetchHighlightChannel();
//     } catch (e) {
//       error = e.toString();
//     }

//     isLoading = false;
//     notifyListeners();
//   }

//   // Refresh highlights
//   Future<void> refresh() async {
//     await loadHighlights();
//   }
// }

import 'package:flutter/material.dart';
import 'package:goalnow_app/model/channel_model.dart';
import 'package:goalnow_app/repository/youtube_repository.dart';

class HighlightProvider extends ChangeNotifier {
  final YouTubeRepository repository;

  HighlightProvider({required this.repository});

  ChannelModel? channel;

  bool isLoading = false;
  bool isLoadingMore = false;
  String? error;

  Future<void> loadHighlights() async {
    if (isLoading) return;

    isLoading = true;
    error = null;
    notifyListeners();

    try {
      repository.resetPagination();
      channel = await repository.fetchHighlightChannel(pageSize: 10);
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (isLoadingMore || channel == null) return;

    isLoadingMore = true;
    notifyListeners();

    try {
      final more = await repository.fetchMoreVideos(pageSize: 10);
      channel!.videos.addAll(more);
    } catch (_) {}

    isLoadingMore = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    await loadHighlights();
  }
}
