import 'package:flutter/material.dart';
import 'package:goalnow_app/model/match_detail/match_section.dart';
import 'package:goalnow_app/screen/match/widget/statistics_tab/match_stat_center_bar_row.dart';
import 'package:goalnow_app/screen/match/widget/statistics_tab/match_stat_section_header.dart';

class MatchStatSectionExpandable extends StatefulWidget {
  final MatchStatSection section;

  final bool initialExpanded;

  const MatchStatSectionExpandable({
    super.key,
    required this.section,
    this.initialExpanded = false,
  });

  @override
  State<MatchStatSectionExpandable> createState() =>
      _MatchStatSectionExpandableState();
}

class _MatchStatSectionExpandableState extends State<MatchStatSectionExpandable> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initialExpanded;
  }

  void _toggle() => setState(() => _expanded = !_expanded);

  @override
  Widget build(BuildContext context) {
    final items = widget.section.items.where((i) => i.type != 'title').toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MatchStatSectionHeader(
          title: widget.section.title,
          expanded: _expanded,
          onToggle: _toggle,
        ),

        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Column(
            children: items
                .map((item) => MatchStatCenterBarRow(item: item))
                .toList(),
          ),
          crossFadeState:
              _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}
