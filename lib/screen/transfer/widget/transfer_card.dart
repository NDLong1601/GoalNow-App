import 'package:flutter/material.dart';
import 'package:goalnow_app/component/app_text.dart';
import 'package:goalnow_app/component/app_textstyle.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/utils/date_helper.dart';
import 'package:goalnow_app/core/utils/format_helper.dart';
import 'package:goalnow_app/core/utils/logo_helper.dart';
import 'package:goalnow_app/model/transfer/transfer.dart';
import 'package:goalnow_app/screen/transfer/widget/player_header.dart';
import 'package:goalnow_app/screen/transfer/widget/transfer_card_content.dart';

class TransferCard extends StatelessWidget {
  final TransferModel transfer;

  const TransferCard({super.key, required this.transfer});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => showTransferDetail(context, transfer),
        child: Container(
          height: 120,
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColor.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColor.primaryDark),
          ),
          child: TransferCardContent(transfer: transfer),
        ),
      ),
    );
  }
}

void showTransferDetail(BuildContext context, TransferModel transfer) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return TransferDetailBottomSheet(transfer: transfer);
    },
  );
}

class TransferDetailBottomSheet extends StatelessWidget {
  final TransferModel transfer;

  const TransferDetailBottomSheet({super.key, required this.transfer});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: DraggableScrollableSheet(
        initialChildSize: 0.65,
        minChildSize: 0.45,
        maxChildSize: 0.9,
        builder: (_, controller) {
          return Container(
            decoration: const BoxDecoration(
              color: AppColor.surface,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: SingleChildScrollView(
              controller: controller,
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _DragHandle(),
                  PlayerHeader(transfer),
                  const SizedBox(height: 28),
                  _SectionTitle('🏟️ Transfer path'),
                  const SizedBox(height: 16),

                  /// From → To
                  _TransferPath(
                    fromClub: transfer.fromClub,
                    toClub: transfer.toClub,
                  ),

                  const SizedBox(height: 28),

                  _SectionTitle('⚡ Transfer details'),
                  const SizedBox(height: 12),

                  _DetailTile(
                    label: 'Transfer type',
                    value: transfer.transferType.text.toUpperCase(),
                  ),
                  _DetailTile(
                    label: 'Fee',
                    value: transfer.fee.feeText.toUpperCase(),
                  ),
                  _DetailTile(
                    label: 'Market value',
                    value: FormatHelper.formatCurrency(transfer.marketValue),
                  ),
                  _DetailTile(
                    label: 'Contract',
                    value: DateHelper.formatRange(
                      transfer.fromDate,
                      transfer.toDate,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DetailTile extends StatelessWidget {
  final String label;
  final String value;

  const _DetailTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: label.toUpperCase(),
            style: AppTextStyle.caption.copyWith(color: AppColor.white),
          ),
          AppText(text: value, style: AppTextStyle.bodySmall),
        ],
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppColor.textSecondary.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return AppText(
      text: title.toUpperCase(),
      style: AppTextStyle.h3.copyWith(
        color: AppColor.white,
        letterSpacing: 0.6,
      ),
    );
  }
}

class _TransferPath extends StatelessWidget {
  final String fromClub;
  final String toClub;

  const _TransferPath({required this.fromClub, required this.toClub});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ClubBlock(name: fromClub),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(
            Icons.arrow_forward_rounded,
            size: 20,
            color: AppColor.white,
          ),
        ),
        _ClubBlock(name: toClub),
      ],
    );
  }
}

class _ClubBlock extends StatelessWidget {
  final String name;

  const _ClubBlock({required this.name});

  static const double _logoSize = 26;
  static const double _width = 92;
  static const double _textHeight = 34;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      child: Column(
        children: [
          LogoHelper.clubLogo(name, size: _logoSize),
          const SizedBox(height: 6),
          SizedBox(
            height: _textHeight,
            child: Center(
              child: AppText(
                text: name,
                style: AppTextStyle.bodySmall,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
