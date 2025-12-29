import 'package:goalnow_app/model/video_model.dart';

class ChannelModel {
  final String id;
  final String title;
  final String profilePictureUrl;
  final String subscriberCount;
  final String videoCount;
  final String uploadsPlaylistId;
  List<VideoModel> videos;

  ChannelModel({
    required this.id,
    required this.title,
    required this.profilePictureUrl,
    required this.subscriberCount,
    required this.videoCount,
    required this.uploadsPlaylistId,
    this.videos = const [],
  });

  factory ChannelModel.fromJson(Map<String, dynamic> json) {
    return ChannelModel(
      id: json['id'],
      title: json['snippet']['title'],
      profilePictureUrl: json['snippet']['thumbnails']['high']['url'],
      subscriberCount: json['statistics']['subscriberCount'],
      videoCount: json['statistics']['videoCount'],
      uploadsPlaylistId:
          json['contentDetails']?['relatedPlaylists']?['uploads'],
    );
  }
}
