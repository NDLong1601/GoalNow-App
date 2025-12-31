class TeamColors {
  final String? darkMode;
  final String? lightMode;
  final String? fontDarkMode;
  final String? fontLightMode;

  TeamColors({
    this.darkMode,
    this.lightMode,
    this.fontDarkMode,
    this.fontLightMode,
  });

  factory TeamColors.fromJson(Map<String, dynamic> json) {
    return TeamColors(
      darkMode: json['darkMode'],
      lightMode: json['lightMode'],
      fontDarkMode: json['fontDarkMode'],
      fontLightMode: json['fontLightMode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'darkMode': darkMode,
      'lightMode': lightMode,
      'fontDarkMode': fontDarkMode,
      'fontLightMode': fontLightMode,
    };
  }
}
