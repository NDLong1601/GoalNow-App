import 'package:flutter/material.dart';
import 'package:goalnow_app/core/const/app_asset_path.dart';

class LogoIconMapper {

  static final Map<String, String> _logoIconMap = {
    // Premier League
    'man united': AppAssetsPath.manchesterUnited,
    'man city': AppAssetsPath.manchesterCity,
    'arsenal': AppAssetsPath.arsenal,
    'chelsea': AppAssetsPath.chelsea,
    'liverpool': AppAssetsPath.liverpool,
    'tottenham': AppAssetsPath.tottenham,
    'newcastle': AppAssetsPath.newcastle,
    'wolves': AppAssetsPath.wolverhampton,
    'brentford': AppAssetsPath.brentford,
    'bournemouth': AppAssetsPath.bournemouth,
    'burnley': AppAssetsPath.burnley,
    'brighton': AppAssetsPath.brighton,
    'sunderland': AppAssetsPath.sunderland,
    'west ham': AppAssetsPath.westHam,
    'leeds': AppAssetsPath.leedsUnited,
    'crystal palace': AppAssetsPath.crystalPalace,
    'everton': AppAssetsPath.everton,
    'aston villa': AppAssetsPath.astonVilla,

    // // La Liga
    // 'real madrid': 'assets/teams/real_madrid.png',
    // 'barcelona': 'assets/teams/barcelona.png',
    // 'atletico madrid': 'assets/teams/atletico.png',

    // // Khác
    // 'bayern munich': 'assets/teams/bayern.png',
    // 'psg': 'assets/teams/psg.png',
  };
  
  /// Normalize team name to key
  static String _normalize(String name) {
    return name
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9 ]'), '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  /// Public API
  static String? getLogo(String teamName) {
    final key = _normalize(teamName);
    return _logoIconMap[key];
  }
}

/// Helper class for club logos
class LogoHelper {
  static Widget clubLogo(String clubName, {double size = 24}) {
    final assetPath = LogoIconMapper.getLogo(clubName);

    return Image.asset(
      assetPath ?? AppAssetsPath.logoDefault,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}


