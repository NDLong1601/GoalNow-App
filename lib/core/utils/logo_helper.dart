import 'package:goalnow_app/core/const/app_asset_path.dart';

class LogoIconMapper {
  static final Map<String, String> _logoIconMap = {
    // Premier League
    'man united': AppAssetsPath.manUtd,
    'man city': AppAssetsPath.mci,
    'arsenal': AppAssetsPath.asrenal,
    'chelsea': AppAssetsPath.chelsea,
    'liverpool': AppAssetsPath.liverpool,
    'tottenham': AppAssetsPath.tottenham,
    'newcastle': AppAssetsPath.newcastle,
    'wolves': AppAssetsPath.wolverhamton,
    'brentford': AppAssetsPath.brentford,
    'Bournemouth': AppAssetsPath.bour,
    'burnley': AppAssetsPath.burnley,
    'brighton': AppAssetsPath.brighton,
    'sunderland': AppAssetsPath.sunderland,
    'west ham': AppAssetsPath.westham,
    'leeds': AppAssetsPath.leeds,
    'crystal palace': AppAssetsPath.cry,
    'Everton': AppAssetsPath.everton,
    'Aston Villa': AppAssetsPath.aston,

    // // La Liga
    // 'real madrid': 'assets/teams/real_madrid.png',
    // 'barcelona': 'assets/teams/barcelona.png',
    // 'atletico madrid': 'assets/teams/atletico.png',

    // // Khác
    // 'bayern munich': 'assets/teams/bayern.png',
    // 'psg': 'assets/teams/psg.png',
  };

  /// Chuẩn hoá tên đội để map ổn định
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
