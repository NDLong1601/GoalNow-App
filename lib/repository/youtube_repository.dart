import 'package:goalnow_app/model/channel_model.dart';
import 'package:goalnow_app/model/video_model.dart';
import 'package:goalnow_app/service/api/youtube_service.dart';

class YouTubeRepository {
  final YouTubeService service;

  YouTubeRepository({required this.service});

  static const String highlightChannelId = 'UC9xeuekJd88ku9LDcmGdUOA';

  String? _nextPageToken;
  String? _uploadsPlaylistId;

  bool get hasMore => _nextPageToken != null;

  void resetPagination() {
    _nextPageToken = null;
    _uploadsPlaylistId = null;
  }

  Future<ChannelModel> fetchHighlightChannel({int pageSize = 10}) async {
    final channelJson = await service.fetchChannel(
      channelId: highlightChannelId,
    );
    final channel = ChannelModel.fromJson(channelJson);

    final playlistId = channel.uploadsPlaylistId;
    if (playlistId.isEmpty) {
      throw Exception('Uploads playlist not found');
    }
    _uploadsPlaylistId = playlistId;

    final response = await service.fetchPlaylistVideos(
      playlistId: playlistId,
      pageToken: null,
      maxResults: pageSize,
    );

    _nextPageToken = response.nextPageToken;
    channel.videos = response.videos;

    return channel;
  }

  Future<List<VideoModel>> fetchMoreVideos({int pageSize = 10}) async {
    final playlistId = _uploadsPlaylistId;
    if (playlistId == null || playlistId.isEmpty) return [];

    final token = _nextPageToken;
    if (token == null) return [];

    final response = await service.fetchPlaylistVideos(
      playlistId: playlistId,
      pageToken: token,
      maxResults: pageSize,
    );

    _nextPageToken = response.nextPageToken;
    return response.videos;
  }
}
