import 'package:flutter/material.dart';
import 'package:goalnow_app/core/data/data.dart';
import 'package:provider/provider.dart';

import 'package:goalnow_app/core/enum/enum.dart';
import 'package:goalnow_app/core/utils/format_helper.dart';
import 'package:goalnow_app/provider/match_provider.dart';

import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';

import 'widget/match_detail/match_detail_list_view.dart';

class MatchsScreen extends StatefulWidget {
  const MatchsScreen({super.key});

  @override
  State<MatchsScreen> createState() => _MatchsScreenState();
}

class _MatchsScreenState extends State<MatchsScreen> {
  MatchTab _currentTab = MatchTab.live;
  bool _loaded = false;

  DateTime _selectedDate = DateTime.now();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_loaded) return;
    _loaded = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MatchProvider>().fetchMatches(
        FormatHelper.apiDate(_selectedDate),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      overlayOpacity: 0.9,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        elevation: 0,
        title: AppText(text: 'Matches', style: AppTextStyle.h2),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: _pickDate,
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(height: 1),
          SizedBox(height: 8),
          _buildTabs(),
          const SizedBox(height: 8),
          Expanded(
            child: Consumer<MatchProvider>(
              builder: (context, provider, _) {
                if (provider.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.error != null) {
                  return Center(child: Text(provider.error!));
                }

                return MatchListView(
                  tab: _currentTab,
                  matches: provider.matches,
                  leagueNameMap: Data.leagueNameMap,
                  leaguePriority: Data.leaguePriority,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: MatchTab.values.map((tab) {
          final active = tab == _currentTab;

          return Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => setState(() => _currentTab = tab),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: active ? AppColor.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColor.primaryDark, width: 1),
                ),
                child: Center(
                  child: AppText(
                    text: _tabTitle(tab),
                    style: AppTextStyle.bodySmall.copyWith(
                      color: active
                          ? AppColor.white
                          : AppColor.white.withValues(alpha: 0.6),
                      fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _tabTitle(MatchTab tab) {
    switch (tab) {
      case MatchTab.finished:
        return 'Finished';
      case MatchTab.live:
        return 'Live';
      case MatchTab.upcoming:
        return 'Upcoming';
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked == null) return;

    setState(() {
      _selectedDate = picked;
      _loaded = false;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MatchProvider>().fetchMatches(
        FormatHelper.apiDate(_selectedDate),
      );
    });
  }
}
