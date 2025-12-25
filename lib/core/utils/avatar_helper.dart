import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';

/// Resolve avatar image provider
ImageProvider resolveAvatar(String? avatarUrl) {
  // Default avatar
  if (avatarUrl == null || avatarUrl.isEmpty) {
    return const AssetImage(AppAssetsPath.avatarDefault);
  }
  // Network or Asset image
  if (avatarUrl.startsWith('http')) {
    return NetworkImage(avatarUrl);
  }
  // Assume it's a local asset path
  return AssetImage(avatarUrl);
}
