class PlatformWeather {
  final String? condition;
  final bool? isDayLight;
  final double? temperature;

  PlatformWeather({required this.condition, required this.isDayLight, required this.temperature});

  factory PlatformWeather.fromJson(Map<Object?, Object?> json) {
    return PlatformWeather(
      condition: json['condition'] as String?,
      isDayLight: json['isDayLight'] as bool?,
      temperature: json['temperature'] as double?,
    );
  }
}
