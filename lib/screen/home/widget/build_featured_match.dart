// import 'package:flutter/material.dart';
// import 'package:goalnow_app/component/app_match_card.dart';
// import 'package:goalnow_app/provider/match_provider.dart';
// import 'package:provider/provider.dart';

// class BuildFeaturedMatch extends StatelessWidget {
//   const BuildFeaturedMatch({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<MatchProvider>(
//       builder: (context, provider, _) {
//         if (provider.loading) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (provider.error != null) {
//           return Center(child: Text(provider.error!));
//         }

//         return 
//       },
//     );
//   }
// }