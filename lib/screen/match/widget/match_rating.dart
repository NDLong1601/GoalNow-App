// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:goalnow_app/component/app_text.dart';
// import 'package:goalnow_app/component/app_textstyle.dart';
// import 'package:goalnow_app/core/const/app_color.dart';
// import 'package:goalnow_app/model/lineup/lineup_player.dart';
// import 'package:goalnow_app/model/lineup/team_lineup.dart';
// import 'package:goalnow_app/provider/lineup_provider.dart';

// class MatchRatings extends StatelessWidget {
//   const MatchRatings({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<LineupProvider>(
//       builder: (_, provider, _) {
//         if (provider.loading) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         final TeamLineup? lineup = provider.currentLineup;
//         if (lineup == null || lineup.starters.isEmpty) {
//           return const Center(child: Text('No ratings available'));
//         }

//         final players = [...lineup.starters]
//           ..sort((a, b) => (b.rating ?? 0).compareTo(a.rating ?? 0));

//         return ListView.separated(
//           padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
//           itemCount: players.length,
//           separatorBuilder: (_, _) =>
//               Divider(height: 1, color: AppColor.divider),
//           itemBuilder: (_, index) => PlayerRatingRow(player: players[index]),
//         );
//       },
//     );
//   }
// }

// class PlayerRatingRow extends StatelessWidget {
//   final LineupPlayer player;

//   const PlayerRatingRow({super.key, required this.player});

//   @override
//   Widget build(BuildContext context) {
//     final rating = player.rating;

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children: [
//           // Avatar
//           CircleAvatar(
//             radius: 18,
//             backgroundColor: AppColor.surface,
//             child: AppText(
//               text: player.shirtNumber,
//               style: AppTextStyle.bodySmall,
//             ),
//           ),
//           const SizedBox(width: 12),

//           // Name
//           Expanded(
//             child: AppText(
//               text: player.name,
//               style: AppTextStyle.bodySmall.copyWith(
//                 color: AppColor.white.withValues(alpha: 0.9),
//               ),
//               maxLines: 1,
//               textOverflow: TextOverflow.ellipsis,
//             ),
//           ),

//           // Rating
//           SizedBox(
//             width: 44,
//             child: Align(
//               alignment: Alignment.centerRight,
//               child: AppText(
//                 text: rating != null ? rating.toStringAsFixed(1) : '-',
//                 style: AppTextStyle.h3.copyWith(
//                   fontWeight: FontWeight.w700,
//                   color: _ratingColor(rating),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Color _ratingColor(double? rating) {
//     if (rating == null) return AppColor.textSecondary;
//     if (rating >= 7) return const Color(0xFF3CCF91);
//     if (rating >= 6) return const Color(0xFFF5B942);
//     return const Color(0xFFE5533D);
//   }
// }
