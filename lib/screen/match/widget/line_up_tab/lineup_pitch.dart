import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/model/lineup/lineup_player.dart';
import 'package:goalnow_app/screen/match/widget/line_up_tab/pitch_painter.dart';
import 'package:goalnow_app/screen/match/widget/line_up_tab/player_node.dart';

class LineupPitch extends StatelessWidget {
  final List<LineupPlayer> players;
  final bool flip;

  const LineupPitch({super.key, required this.players, this.flip = false});

  static const double _avatarRadius = 14;
  static const double _nameWidth = 64;
  static const double _gap = 4;

  /// Text 1 dòng + avatar
  static const double _nodeHeight = (_avatarRadius * 2) + _gap + 16;

  static const double _nodeWidth = _nameWidth;
  static const double _safePadding = 6;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.65,
      child: LayoutBuilder(
        builder: (context, c) {
          final w = c.maxWidth;
          final h = c.maxHeight;

          return Container(
            decoration: BoxDecoration(
              color: AppColor.primaryDark.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                CustomPaint(size: Size(w, h), painter: PitchPainter()),

                ...players.map((p) {
                  final l = p.verticalLayout;

                  // Flip sân nếu cần
                  final y = flip ? (1 - l.y) : l.y;

                  double left = (l.x * w) - (_nodeWidth / 2);
                  double top = (y * h) - (_nodeHeight / 2);

                  // Clamp CHUẨN
                  left = left.clamp(
                    _safePadding,
                    w - _nodeWidth - _safePadding,
                  );

                  top = top.clamp(_safePadding, h - _nodeHeight - _safePadding);

                  return Positioned(
                    left: left,
                    top: top,
                    width: _nodeWidth,
                    height: _nodeHeight,
                    child: PlayerNode(player: p),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
