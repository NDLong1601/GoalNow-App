import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/screen/favourites/widget/bell_button.dart';
import 'package:goalnow_app/screen/favourites/widget/match_card.dart';
import 'package:goalnow_app/screen/favourites/widget/setting_toggle_row.dart';
import 'package:goalnow_app/screen/favourites/widget/team_avatar.dart';

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


