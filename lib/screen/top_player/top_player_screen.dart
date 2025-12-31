import 'package:flutter/material.dart';
import 'package:goalnow_app/screen/top_player/widget/league_bottom_sheet.dart';
import 'package:goalnow_app/screen/top_player/widget/top_player_empty.dart';
import 'package:goalnow_app/screen/top_player/widget/top_player_list.dart';
import 'package:goalnow_app/service/local/local_service.dart';
import 'package:provider/provider.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/component/top_player_tab_bar.dart';
import 'package:goalnow_app/core/network/api_client.dart';
import 'package:goalnow_app/provider/top_player_provider.dart';
import 'package:goalnow_app/repository/top_player_repository.dart';
import 'package:goalnow_app/service/api/top_player_service.dart';

class TopPlayerScreen extends StatelessWidget {
  const TopPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TopPlayerProvider(
        TopPlayerRepository(TopPlayerService(context.read<ApiClient>())),
        context.read<LocalService>(),
      )..init(),
      child: const _TopPlayerView(),
    );
  }
}

class _TopPlayerView extends StatelessWidget {
  const _TopPlayerView();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TopPlayerProvider>();

    return AppScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText(text: 'Top Players', style: AppTextStyle.appBarTitle),
      ),
      body: Column(
        children: [
          /// TAB BAR + FILTER
          TopPlayerTabBar(
            current: provider.currentTab,
            onChanged: (tab) {
              context.read<TopPlayerProvider>().switchTab(tab);
            },
            onFilterPressed: () {
              showLeagueBottomSheet(context, context.read<TopPlayerProvider>());
            },
          ),

          /// CONTENT
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: provider.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : provider.currentList.isEmpty
                  ? const EmptyState()
                  : TopPlayerList(
                      key: ValueKey(
                        '${provider.currentTab}_${provider.leagueId}',
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
