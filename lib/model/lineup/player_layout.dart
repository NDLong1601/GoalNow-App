class PlayerLayout {
  final double x;
  final double y;
  final double width;
  final double height;

  PlayerLayout({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  factory PlayerLayout.fromJson(Map<String, dynamic> json) {
    return PlayerLayout(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      width: (json['width'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
    );
  }

  PlayerLayout copyWith({double? x, double? y, double? width, double? height}) {
    return PlayerLayout(
      x: x ?? this.x,
      y: y ?? this.y,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }
}
