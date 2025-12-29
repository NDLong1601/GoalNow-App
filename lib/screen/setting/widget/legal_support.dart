import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_divider.dart';
import 'package:goalnow_app/component/app_navigation_item.dart';

class LegalItem {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;

  const LegalItem({required this.title, required this.onTap, this.icon});
}

class LegalSupportSection extends StatelessWidget {
  const LegalSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<LegalItem> items = [
      LegalItem(
        title: 'Privacy Policy',
        icon: Icons.privacy_tip_outlined,
        onTap: () {},
      ),
      LegalItem(
        title: 'Terms of Service',
        icon: Icons.description_outlined,
        onTap: () {},
      ),
      LegalItem(
        title: 'Support & FAQs',
        icon: Icons.help_outline,
        onTap: () {},
      ),
    ];

    return ListView.separated(
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, _) => const AppDivider(),
      itemBuilder: (context, index) {
        final item = items[index];
        return AppNavigationItem(
          title: item.title,
          leadingIcon: item.icon,
          onTap: item.onTap,
        );
      },
    );
  }
}
