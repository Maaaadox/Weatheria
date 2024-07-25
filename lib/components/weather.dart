class CurrentWeather {
  final double lat;
  final double lon;
  final String country;
  final double tempC;
  final String name;
  final int isDay;
  final double windKph;
  final double precipMm;
  final int humidity;
  final String weatherCode;
  final String sunrise;
  final String sunset;
  final List<dynamic> hours;
  final int willItRain;
  const CurrentWeather(
      {required this.lat,
      required this.lon,
      required this.country,
      required this.tempC,
      required this.name,
      required this.isDay,
      required this.windKph,
      required this.precipMm,
      required this.humidity,
      required this.weatherCode,
      required this.sunrise,
      required this.sunset,
      required this.hours,
      required this.willItRain});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      lat: json['location']['lat'],
      lon: json['location']['lon'],
      name: json['location']['name'],
      country: json['location']['country'],
      tempC: json['current']['temp_c'],
      isDay: json['current']['is_day'],
      windKph: json['current']['wind_kph'],
      precipMm: json['current']['precip_mm'],
      humidity: json['current']['humidity'],
      weatherCode: json['current']['condition']['text'],
      sunrise: json['forecast']['forecastday'][0]['astro']['sunrise'],
      sunset: json['forecast']['forecastday'][0]['astro']['sunset'],
      hours: json['forecast']['forecastday'][0]['hour'],
      willItRain: json['forecast']['forecastday'][0]['day']
          ['daily_chance_of_rain'],
    );
  }
}

//build second class for forecaast part
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

class NextDays {
  final String day;
  final String icon;
  final String condition;
  final String minTemp;
  final String maxTemp;
  NextDays(
      {required this.day,
      required this.icon,
      required this.condition,
      required this.minTemp,
      required this.maxTemp});
}

class SearchLocation {
  final String city;
  final String country;
  final String lat;
  final String lng;
  SearchLocation({
    required this.city,
    required this.country,
    required this.lat,
    required this.lng,
  });
}
