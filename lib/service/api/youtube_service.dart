import 'dart:convert';
import 'dart:io';

import 'package:goalnow_app/core/data/key.dart';
import 'package:goalnow_app/model/video_model.dart';
import 'package:http/http.dart' as http;

class PlaylistResponse {
  final List<VideoModel> videos;
  final String? nextPageToken;

  PlaylistResponse({required this.videos, required this.nextPageToken});
}

class YouTubeService {
  static const String _baseUrl = 'www.googleapis.com';

  Future<Map<String, dynamic>> fetchChannel({required String channelId}) async {
    final uri = Uri.https(_baseUrl, '/youtube/v3/channels', {
      'part': 'snippet,contentDetails,statistics',
      'id': channelId,
      'key': API_KEY_YOUTUBE,
    });

    final response = await http.get(
      uri,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Fetch channel failed: ${response.body}');
    }

    final decoded = json.decode(response.body);
    final items = decoded['items'] as List<dynamic>?;

    if (items == null || items.isEmpty) {
      throw Exception('Channel not found');
    }

    return items.first as Map<String, dynamic>;
  }

  Future<PlaylistResponse> fetchPlaylistVideos({
    required String playlistId,
    String? pageToken,
    int maxResults = 10,
  }) async {
    final uri = Uri.https(_baseUrl, '/youtube/v3/playlistItems', {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '$maxResults',
      if (pageToken != null && pageToken.isNotEmpty) 'pageToken': pageToken,
      'key': API_KEY_YOUTUBE,
    });

    final response = await http.get(
      uri,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Fetch playlist failed: ${response.body}');
    }

    final decoded = json.decode(response.body);

    final items = (decoded['items'] as List<dynamic>? ?? [])
        .map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return PlaylistResponse(
      videos: items,
      nextPageToken: decoded['nextPageToken'] as String?,
    );
  }
}
