import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/model/match.dart';

class MatchDetailScreen extends StatelessWidget {
  final MatchModel match;

  const MatchDetailScreen({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      overlayOpacity: 0.95,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        elevation: 0,
        title: AppText(text: 'Match Detail', style: AppTextStyle.h3),
      ),
      body: Column(
        children: [
          _buildHeader(),
          _buildStatus(),
          const Divider(height: 1),
          Expanded(child: _buildOverview()),
        ],
      ),
    );
  }

  // ===================================================
  // HEADER: Teams + Score
  // ===================================================
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Row(
        children: [
          _teamBlock(
            name: match.home.name,
            score: match.home.score,
            alignRight: false,
          ),

          Expanded(
            child: Column(
              children: [
                AppText(
                  text: '${match.home.score} - ${match.away.score}',
                  style: AppTextStyle.h1,
                ),
                const SizedBox(height: 4),
                AppText(
                  text: match.status.finished ? 'Full Time' : 'Live',
                  style: AppTextStyle.bodySmall.copyWith(
                    color: match.status.finished ? Colors.white54 : Colors.red,
                  ),
                ),
              ],
            ),
          ),

          _teamBlock(
            name: match.away.name,
            score: match.away.score,
            alignRight: true,
          ),
        ],
      ),
    );
  }

  Widget _teamBlock({
    required String name,
    required int score,
    required bool alignRight,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: alignRight
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColor.surface,
            child: Text(name.characters.first, style: AppTextStyle.bodyLarge),
          ),
          const SizedBox(height: 8),
          AppText(
            text: name,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            style: AppTextStyle.bodySmall,
          ),
        ],
      ),
    );
  }

  // ===================================================
  // STATUS BAR
  // ===================================================
  Widget _buildStatus() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _statusChip(
            match.status.finished ? 'FT' : 'LIVE',
            match.status.finished ? Colors.white54 : Colors.red,
          ),
          const SizedBox(width: 12),
          AppText(
            text: match.time.toLocal().toString(),
            style: AppTextStyle.bodySmall.copyWith(color: Colors.white54),
          ),
        ],
      ),
    );
  }

  Widget _statusChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: AppText(
        text: text,
        style: AppTextStyle.bodySmall.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ===================================================
  // OVERVIEW TAB (Core)
  // ===================================================
  Widget _buildOverview() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _infoRow('League', match.leagueId.toString()),
        _infoRow('Kick-off', match.time.toLocal().toString()),
        _infoRow('Score', '${match.home.score} - ${match.away.score}'),
        _infoRow('Status', match.status.finished ? 'Finished' : 'Live'),
      ],
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: label,
            style: AppTextStyle.bodySmall.copyWith(color: Colors.white54),
          ),
          AppText(text: value, style: AppTextStyle.bodySmall),
        ],
      ),
    );
  }
}
