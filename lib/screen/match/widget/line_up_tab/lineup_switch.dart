import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:goalnow_app/provider/lineup_provider.dart';
import 'package:goalnow_app/core/const/app_color.dart';

/// LINEUP SWITCH BUTTON
class LineupSwitch extends StatelessWidget {
  const LineupSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LineupProvider>();

    final bool canSwitch = provider.home != null && provider.away != null;

    return IconButton(
      tooltip: 'Switch team',
      onPressed: canSwitch
          ? () {
              provider.switchSide(
                provider.currentSide == LineupSide.home
                    ? LineupSide.away
                    : LineupSide.home,
              );
            }
          : null,
      icon: AnimatedRotation(
        duration: const Duration(milliseconds: 200),
        turns: provider.currentSide == LineupSide.away ? 0.5 : 0,
        child: Icon(
          Icons.swap_vert,
          size: 20,
          color: canSwitch
              ? AppColor.white.withValues(alpha: 0.85)
              : AppColor.white.withValues(alpha: 0.3),
        ),
      ),
    );
  }
}
