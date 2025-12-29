import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  final String videoId;
  final String title;
  final String? description;
  final String? channelName;
  final String? channelAvatar;
  final bool isVertical;

  const VideoScreen({
    super.key,
    required this.videoId,
    required this.title,
    this.description,
    this.channelName,
    this.channelAvatar,
    this.isVertical = false,
  });

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;

  bool _isPlaying = false;
  bool _showControls = true;

  Duration _position = Duration.zero;

  Timer? _hideTimer;

  // Initialize video player
  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        hideControls: true,
        disableDragSeek: true,
        enableCaption: true,
      ),
    )..addListener(_listener);
  }

  // Video player listener
  void _listener() {
    if (!mounted) return;

    final value = _controller.value;

    setState(() {
      _isPlaying = value.isPlaying;
      _position = value.position;
    });

    // Rotate screen on fullscreen
    if (value.isFullScreen) {
      if (widget.isVertical) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      }
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
  }

  // Dispose resources
  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  // Toggle play/pause
  void _togglePlay() {
    _isPlaying ? _controller.pause() : _controller.play();
  }

  // Seek by seconds
  void _seek(int seconds) {
    _controller.seekTo(_position + Duration(seconds: seconds));
  }

  // Toggle fullscreen
  void _toggleFullscreen() {
    _controller.toggleFullScreenMode();
  }

  // Show controls temporarily
  void _showControlsTemporarily() {
    _hideTimer?.cancel();
    setState(() => _showControls = true);

    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) setState(() => _showControls = false);
    });
  }

  // Show speed picker
  void _showSpeedPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.surface,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [0.5, 1.0, 1.25, 1.5, 2.0].map((s) {
            return ListTile(
              title: Text('${s}x', style: const TextStyle(color: Colors.white)),
              onTap: () {
                _controller.setPlaybackRate(s);
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        aspectRatio: widget.isVertical ? 9 / 16 : 16 / 9,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
      ),
      builder: (context, player) {
        return AppScaffold(
          overlayOpacity: 0.8,
          appBar: AppBar(
            title: AppText(text: 'Match Highlight', style: AppTextStyle.h2),
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                icon: const Icon(Icons.fullscreen),
                onPressed: _toggleFullscreen,
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _showControlsTemporarily,
                onDoubleTap: _toggleFullscreen,
                child: player,
              ),

              if (_showControls) _buildControlBar(),
              Expanded(child: SingleChildScrollView(child: _buildVideoInfo())),
            ],
          ),
        );
      },
    );
  }

  Widget _buildControlBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: AppColor.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _ControlButton(icon: Icons.replay_10, onTap: () => _seek(-10)),
              const SizedBox(width: 14),
              _ControlButton(
                icon: _isPlaying ? Icons.pause : Icons.play_arrow,
                size: 36,
                onTap: _togglePlay,
              ),
              const SizedBox(width: 14),
              _ControlButton(icon: Icons.forward_10, onTap: () => _seek(10)),
            ],
          ),
          Row(
            children: [
              _ControlButton(icon: Icons.speed, onTap: _showSpeedPicker),
              const SizedBox(width: 12),
              _ControlButton(icon: Icons.fullscreen, onTap: _toggleFullscreen),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVideoInfo() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),

          // Channel info
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: widget.channelAvatar != null
                    ? NetworkImage(widget.channelAvatar!)
                    : null,
                backgroundColor: Colors.white24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.channelName ?? 'Channel',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Subscribe'),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(color: Colors.white24),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;

  const _ControlButton({
    required this.icon,
    required this.onTap,
    this.size = 28,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: Colors.white, size: size),
    );
  }
}
