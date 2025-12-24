import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/provider/lineup_provider.dart';
import 'package:goalnow_app/screen/match/widget/line_up_tab/lineup_pitch.dart';

class MatchLineups extends StatefulWidget {
  final int eventId;
  const MatchLineups({super.key, required this.eventId});

  @override
  State<MatchLineups> createState() => _MatchLineupsState();
}

class _MatchLineupsState extends State<MatchLineups> {
  bool _loaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_loaded) return;
    _loaded = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LineupProvider>().load(widget.eventId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LineupProvider>(
      builder: (_, provider, _) {
        if (provider.loading) {
          return const Padding(
            padding: EdgeInsets.only(top: 32),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (provider.error != null) {
          return Center(child: Text(provider.error!));
        }

        final lineup = provider.currentLineup;
        if (lineup == null) {
          return const Center(child: Text('No lineup'));
        }

        final isAway = provider.currentSide == LineupSide.away;

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          children: [
            // HEADER
            Row(
              children: [
                Icon(Icons.stacked_bar_chart, color: AppColor.iconPrimary),
                SizedBox(width: 4),
                AppText(
                  text: '${lineup.name} · ${lineup.formation}',
                  style: AppTextStyle.h3.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColor.white.withValues(alpha: 0.85),
                  ),
                ),
                Spacer(),
                IconButton(
                  tooltip: 'Swap team',
                  onPressed: () {
                    provider.switchSide(
                      provider.currentSide == LineupSide.home
                          ? LineupSide.away
                          : LineupSide.home,
                    );
                  },
                  icon: Icon(
                    Icons.swap_vert,
                    color: AppColor.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // CONTENT
            if (lineup.starters.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(child: Text('Lineup not available')),
              )
            else
              LineupPitch(players: lineup.starters, flip: isAway),
              
          ],
        );
      },
    );
  }
}
