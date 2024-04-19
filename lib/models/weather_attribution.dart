class WeatherAttribution {
  final String legalPageUrlString;
  final String legalAttributionText;
  final String serviceName;

  WeatherAttribution({
    required this.legalPageUrlString,
    required this.legalAttributionText,
    required this.serviceName,
  });

  factory WeatherAttribution.fromJson(Map<Object?, Object?> json) => WeatherAttribution(
        legalPageUrlString: json['legalPageURL'] as String? ?? '',
        legalAttributionText: json['legalAttributionText'] as String? ?? '',
        serviceName: json['serviceName'] as String? ?? '',
      );
}
