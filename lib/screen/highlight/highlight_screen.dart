import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:provider/provider.dart';
import 'package:goalnow_app/provider/highlight_provider.dart';
import 'package:goalnow_app/screen/highlight/video_screen.dart';
import 'package:goalnow_app/screen/highlight/widget/video_grid_card.dart';
import 'package:goalnow_app/screen/highlight/widget/video_grid_skeleton.dart';

class HighlightScreen extends StatefulWidget {
  const HighlightScreen({super.key});

  @override
  State<HighlightScreen> createState() => _HighlightScreenState();
}

class _HighlightScreenState extends State<HighlightScreen> {
  final ScrollController _scrollController = ScrollController();

  
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final provider = context.read<HighlightProvider>();
    if (_scrollController.position.pixels >
        _scrollController.position.maxScrollExtent - 200) {
      provider.loadMore();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_loaded) {
      _loaded = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<HighlightProvider>().loadHighlights();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HighlightProvider>();

    if (provider.isLoading) {
      return _buildSkeleton();
    }

    if (provider.error != null) {
      return const Center(child: Text('Load failed'));
    }

    final channel = provider.channel;
    if (channel == null) {
      return const Center(child: Text('No data'));
    }

    return AppScaffold(
      overlayOpacity: 0.5,
      appBar: AppBar(
        title: AppText(text: 'Matches', style: AppTextStyle.h2),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              provider.loadHighlights();
            },
          ),
        ],
      ),
      body: GridView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.78,
        ),
        itemCount: channel.videos.length + 1,
        itemBuilder: (context, index) {
          if (index == channel.videos.length) {
            return provider.isLoadingMore
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox();
          }

          final video = channel.videos[index];
          return VideoGridCard(
            video: video,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      VideoScreen(videoId: video.videoId, title: video.title),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Build skeleton UI
  Widget _buildSkeleton() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.78,
      ),
      itemCount: 6,
      itemBuilder: (_, _) => const VideoGridSkeleton(),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
