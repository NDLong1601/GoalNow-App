import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/model/match_detail/match_stat_item.dart';

class MatchStatCenterBarRow extends StatelessWidget {
  final MatchStatItem item;

  const MatchStatCenterBarRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final double home = _toDouble(item.home);
    final double away = _toDouble(item.away);
    final double total = home + away;

    final double homeRatio = total == 0 ? 0 : home / total;
    final double awayRatio = total == 0 ? 0 : away / total;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          // VALUES + LABEL
          Row(
            children: [
              _valueText(item.home, isHome: true),
              Expanded(
                child: Center(
                  child: AppText(
                    text: item.title,
                    style: AppTextStyle.bodySmall.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
              _valueText(item.away, isHome: false),
            ],
          ),

          const SizedBox(height: 6),

          // BAR AREA (NO GRAY CENTER)
          SizedBox(
            height: 6,
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      _grayBar(),
                      FractionallySizedBox(
                        widthFactor: homeRatio,
                        child: _greenBar(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),
                // ---------- RIGHT HALF ----------
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      _grayBar(),
                      FractionallySizedBox(
                        widthFactor: awayRatio,
                        child: _greenBar(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // VALUE TEXT
  Widget _valueText(dynamic value, {required bool isHome}) {
    final String text = value?.toString() ?? '-';
    final bool highlight =
        (item.highlighted == 'home' && isHome) ||
        (item.highlighted == 'away' && !isHome);

    return SizedBox(
      width: 64,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: isHome ? TextAlign.start : TextAlign.end,
        style: AppTextStyle.bodySmall.copyWith(
          fontWeight: FontWeight.w600,
          color: highlight ? AppColor.success : Colors.white,
        ),
      ),
    );
  }

  // BAR STYLES
  Widget _grayBar() {
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _greenBar() {
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  // UTILS
  double _toDouble(dynamic v) {
    if (v == null) return 0;
    if (v is num) return v.toDouble();
    return double.tryParse(v.toString()) ?? 0;
  }
}
