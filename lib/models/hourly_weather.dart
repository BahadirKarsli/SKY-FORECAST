import 'package:flutter/foundation.dart' show immutable;

import '/models/weather.dart';

@immutable
class HourlyWeather {
  final String cod;
  final int message;
  final int cnt;
  final List<WeatherEntry> list;
  final City? city;

  const HourlyWeather({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      cod: json['cod'] as String? ?? '',
      message: (json['message'] as num?)?.toInt() ?? 0,
      cnt: (json['cnt'] as num?)?.toInt() ?? 0,
      list: (json['list'] as List<dynamic>)
          .map((entry) => WeatherEntry.fromJson(entry as Map<String, dynamic>))
          .toList(),
      city: json['city'] != null ? City.fromJson(json['city'] as Map<String, dynamic>) : null,
    );
  }
}

@immutable
class WeatherEntry {
  final int dt;
  final Main main;
  final List<WeatherData> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Sys? sys;
  final Rain? rain;
  final String dtTxt;

  const WeatherEntry({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.rain,
    required this.dtTxt,
  });

  factory WeatherEntry.fromJson(Map<String, dynamic> json) {
    return WeatherEntry(
      dt: (json['dt'] as num?)?.toInt() ?? 0,
      main: Main.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((weatherData) => WeatherData.fromJson(weatherData as Map<String, dynamic>))
          .toList(),
      clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: (json['visibility'] as num?)?.toInt() ?? 0,
      pop: (json['pop'] as num?)?.toDouble() ?? 0.0,
      sys: json['sys'] != null ? Sys.fromJson(json['sys'] as Map<String, dynamic>) : null,
      rain: json['rain'] != null ? Rain.fromJson(json['rain'] as Map<String, dynamic>) : null,
      dtTxt: json['dt_txt'] as String? ?? '',
    );
  }
}

@immutable
class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int seaLevel;
  final int grndLevel;
  final int humidity;
  final double tempKf;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
      feelsLike: (json['feels_like'] as num?)?.toDouble() ?? 0.0,
      tempMin: (json['temp_min'] as num?)?.toDouble() ?? 0.0,
      tempMax: (json['temp_max'] as num?)?.toDouble() ?? 0.0,
      pressure: (json['pressure'] as num?)?.toInt() ?? 0,
      seaLevel: (json['sea_level'] as num?)?.toInt() ?? 0,
      grndLevel: (json['grnd_level'] as num?)?.toInt() ?? 0,
      humidity: (json['humidity'] as num?)?.toInt() ?? 0,
      tempKf: (json['temp_kf'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

@immutable
class Clouds {
  final int all;

  const Clouds({
    required this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: (json['all'] as num?)?.toInt() ?? 0,
    );
  }
}

@immutable
class Wind {
  final double speed;
  final int deg;
  final double gust;

  const Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: (json['speed'] as num?)?.toDouble() ?? 0.0,
      deg: (json['deg'] as num?)?.toInt() ?? 0,
      gust: (json['gust'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class City {
  final int id;
  final String name;
  final Coord coord;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
      country: json['country'] as String? ?? '',
      population: (json['population'] as num?)?.toInt() ?? 0,
      timezone: (json['timezone'] as num?)?.toInt() ?? 0,
      sunrise: (json['sunrise'] as num?)?.toInt() ?? 0,
      sunset: (json['sunset'] as num?)?.toInt() ?? 0,
    );
  }
}

@immutable
class Coord {
  final double lat;
  final double lon;

  const Coord({
    required this.lat,
    required this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

@immutable
class Rain {
  final double threeHours;

  const Rain({
    required this.threeHours,
  });

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      threeHours: (json['3h'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

@immutable
class Sys {
  final String pod;

  const Sys({
    required this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      pod: json['pod'] as String? ?? '',
    );
  }
}
