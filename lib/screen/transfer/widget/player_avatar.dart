import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';
import 'package:goalnow_app/core/const/app_color.dart';
import 'package:goalnow_app/core/utils/logo_helper.dart';

class PlayerAvatar extends StatelessWidget {
  final String playerKey;
  final String clubName;
  final double size;
  final String? avatarUrl;

  const PlayerAvatar({
    super.key,
    required this.playerKey,
    required this.clubName,
    this.size = 60,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final logoSize = size * 0.38;
    final key = playerKey.isNotEmpty ? playerKey : clubName;
    final avatarAsset = _randomAvatar(key);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.white),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: avatarUrl != null
                  ? NetworkImage(avatarUrl!)
                  : AssetImage(avatarAsset) as ImageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: logoSize,
            height: logoSize,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColor.surface,
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.primaryDark),
            ),
            child: LogoHelper.clubLogo(clubName, size: logoSize - 8),
          ),
        ),
      ],
    );
  }

  static String _randomAvatar(String key) {
    final index = key.hashCode.abs() % 2;
    return index == 0
        ? AppAssetsPath.avatarDefault
        : AppAssetsPath.avatarDefault1;
  }
}
