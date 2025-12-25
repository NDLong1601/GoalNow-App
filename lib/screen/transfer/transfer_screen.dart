import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_textfield.dart';
import 'package:goalnow_app/screen/transfer/widget/bottom_sheet_fillter.dart';
import 'package:goalnow_app/screen/transfer/widget/transfer_card.dart';
import 'package:provider/provider.dart';
import 'package:goalnow_app/component/app_scaffold.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/provider/transfer_provider.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  // DISPOSE
  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }
  // INIT STATE
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TransferProvider>().fetchTransfers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        overlayOpacity: 0.85,
        appBar: AppBar(
          centerTitle: true,
          title: AppText(
            text: 'Transfermarket',
            style: AppTextStyle.appBarTitle,
          ),
          actions: [
            IconButton(
              onPressed: () => _showSortSheet(context),
              icon: Icon(
                Icons.filter_list_rounded,
                color: AppColor.iconPrimary,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            const Divider(height: 1),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppTextField(
                controller: _searchCtrl,
                hint: 'Search player',
                prefixIcon: Icons.search_rounded,
                textInputAction: TextInputAction.search,
                onChanged: (value) {
                  context.read<TransferProvider>().setKeyword(value);
                },
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Consumer<TransferProvider>(
                builder: (_, provider, _) {
                  if (provider.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (provider.error != null) {
                    return Center(child: AppText(text: provider.error!));
                  }
                  // Show list
                  final items = provider.processedTransfers;

                  if (items.isEmpty) {
                    return const Center(
                      child: AppText(text: 'No matching players'),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: items.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 6),
                    itemBuilder: (_, index) {
                      return TransferCard(transfer: items[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showSortSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColor.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return BottomSheetFillter();
    },
  );
}
