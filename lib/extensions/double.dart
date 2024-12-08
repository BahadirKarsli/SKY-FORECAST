// m/s openweathermap deki varsayılan rüzgar hızı ama km/h ye çevirmemiz gerekiyor.

extension ConvertWindSpeed on double {
  String get kmh => (this * 3.6).toStringAsFixed(2);
}
