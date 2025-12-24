import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/extension/context_extension.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool _matchReminder = false;
  bool _liveScoreUpdates = false;
  bool _halfFullTime = false;

  // Mock data
  final matches = const [
    MatchCardData(
      isLive: true,
      statusRightText: '75\'',
      league: 'La Liga',
      homeTeam: 'Real Madrid',
      awayTeam: 'Barcelona',
      homeScore: 2,
      awayScore: 1,
    ),
    MatchCardData(
      isLive: false,
      statusRightText: 'Sat 15:00',
      league: 'Copa del Rey',
      homeTeam: 'Real Madrid',
      awayTeam: 'Atletico',
      homeScore: 0,
      awayScore: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      overlayOpacity: 0.85,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        elevation: 0,
        title: AppText(text: 'Favourites', style: AppTextStyle.h2),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: AppColor.iconPrimary),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(height: 1),

              const SizedBox(height: 14),

              // Header: avatar + team name + bell + active count
              Row(
                children: [
                  TeamAvatar(
                    size: 42,
                    child: const Text(
                      'R',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: AppText(
                      text: 'Real Madrid',
                      style: AppTextStyle.h2,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(width: 10),
                  BellIconButton(onTap: () {}),
                  const SizedBox(width: 8),
                  AppText(
                    text: '2 Active',
                    style: AppTextStyle.bodySmall.copyWith(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              AppText(text: 'Upcoming & Live Matches', style: AppTextStyle.h2),
              const SizedBox(height: 12),

              SizedBox(
                height: 150,

                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: matches.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final m = matches[index];
                    return MatchCard(data: m);
                  },
                ),
              ),

              const SizedBox(height: 22),

              AppText(text: 'Notification Settings', style: AppTextStyle.h2),
              const SizedBox(height: 12),

              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.surface.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColor.primaryDark.withValues(alpha: 0.6),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    SettingToggleRow(
                      title: '· Match Reminder',
                      value: _matchReminder,
                      onChanged: (value) =>
                          setState(() => _matchReminder = value),
                    ),
                    const SizedBox(height: 10),
                    SettingToggleRow(
                      title: '· Live Score Updates',
                      value: _liveScoreUpdates,
                      onChanged: (value) =>
                          setState(() => _liveScoreUpdates = value),
                    ),
                    const SizedBox(height: 10),
                    SettingToggleRow(
                      title: '· Half-time & Full-time',
                      value: _halfFullTime,
                      onChanged: (value) =>
                          setState(() => _halfFullTime = value),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MatchCardData {
  final bool isLive;
  final String statusRightText;
  final String league;

  final String homeTeam;
  final String awayTeam;

  final int? homeScore;
  final int? awayScore;

  const MatchCardData({
    required this.isLive,
    required this.statusRightText,
    required this.league,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
  });
}

class MatchCard extends StatelessWidget {
  final MatchCardData data;
  const MatchCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // push live screen if status = live or null
      },
      child: Container(
        width: context.sw * 260 / 375,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColor.surface.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: AppColor.primaryDark.withValues(alpha: 0.6),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status row
            Row(
              children: [
                _StatusPill(
                  text: data.isLive ? 'Live' : 'Upcoming',
                  isLive: data.isLive,
                ),
                const Spacer(),
                AppText(
                  text: data.statusRightText,
                  style: AppTextStyle.bodySmall.copyWith(
                    color: Colors.white60,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Teams rows
            TeamRow(
              teamName: data.homeTeam,
              score: data.homeScore,
              highlightScore: data.isLive,
            ),
            const SizedBox(height: 10),
            TeamRow(
              teamName: data.awayTeam,
              score: data.awayScore,
              highlightScore: data.isLive,
            ),

            const Spacer(),

            AppText(
              text: data.league,
              style: AppTextStyle.bodySmall.copyWith(
                color: Colors.white60,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamRow extends StatelessWidget {
  final String teamName;
  final int? score;
  final bool highlightScore;

  const TeamRow({
    super.key,
    required this.teamName,
    required this.score,
    required this.highlightScore,
  });

  @override
  Widget build(BuildContext context) {
    final scoreText = score?.toString() ?? '';
    return Row(
      children: [
        TeamAvatar(
          size: 26,
          child: Text(
            teamName.isNotEmpty ? teamName.characters.first : '?',
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
          ),
        ),
        const SizedBox(width: 10),
        AppText(
          text: teamName,
          style: AppTextStyle.bodyLarge.copyWith(fontWeight: FontWeight.w700),
          maxLines: 1,
        ),
        Spacer(),
        if (score != null)
          AppText(
            text: scoreText,
            style: AppTextStyle.h2.copyWith(
              color: highlightScore ? AppColor.primary : Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
      ],
    );
  }
}

class _StatusPill extends StatelessWidget {
  final String text;
  final bool isLive;

  const _StatusPill({required this.text, required this.isLive});

  @override
  Widget build(BuildContext context) {
    final bg = isLive
        ? const Color(0xFFE74C3C).withValues(alpha: 0.95)
        : Colors.white.withValues(alpha: 0.12);

    final fg = isLive ? Colors.white : Colors.white70;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: AppText(
        text: text,
        style: AppTextStyle.bodySmall.copyWith(
          color: fg,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class SettingToggleRow extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingToggleRow({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          text: title,
          style: AppTextStyle.bodyLarge.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white.withValues(alpha: 0.9),
          ),
        ),
        Spacer(),
        Switch(
          value: value,
          onChanged: onChanged,
          activeThumbColor: AppColor.primary,
          inactiveThumbColor: Colors.white70,
          inactiveTrackColor: Colors.white24,
        ),
      ],
    );
  }
}

class TeamAvatar extends StatelessWidget {
  final double size;
  final Widget child;

  const TeamAvatar({super.key, required this.size, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.9),
        border: Border.all(
          color: Colors.black.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.black),
        child: child,
      ),
    );
  }
}

class BellIconButton extends StatelessWidget {
  final VoidCallback onTap;

  const BellIconButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
          color: AppColor.surface.withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColor.primary.withValues(alpha: 0.6),
            width: 1,
          ),
        ),
        child: Icon(
          Icons.notifications_none_rounded,
          size: 18,
          color: AppColor.primary,
        ),
      ),
    );
  }
}
