class ForecastWeather {
  final List<dynamic> day;
  final List<dynamic> condition;
  final List<dynamic> minTemp;
  final List<dynamic> maxTemp;
  const ForecastWeather({
    required this.day,
    required this.condition,
    required this.minTemp,
    required this.maxTemp,
  });

  factory ForecastWeather.fromJson(Map<String, dynamic> json) {
    return ForecastWeather(
      day: json['daily']['time'],
      condition: json['daily']['weather_code'],
      minTemp: json['daily']['temperature_2m_min'],
      maxTemp: json['daily']['temperature_2m_max'],
    );
  }
}
