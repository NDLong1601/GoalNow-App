import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';

ImageProvider resolveAvatar(String? avatarUrl) {
  if (avatarUrl == null || avatarUrl.isEmpty) {
    return const AssetImage(AppAssetsPath.avatarDefault);
  }

  if (avatarUrl.startsWith('http')) {
    return NetworkImage(avatarUrl);
  }

  return AssetImage(avatarUrl);
}
