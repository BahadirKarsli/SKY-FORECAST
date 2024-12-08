import 'package:flutter/material.dart';

import '/models/famous_city.dart';
import '/screens/weather_detail_screen.dart';
import '/widgets/city_weather_tile.dart';

class FamousCitiesWeather extends StatelessWidget {
  final List<FamousCity> cities; // Filtrelenmiş veya tüm şehir listesi

  const FamousCitiesWeather({
    super.key,
    required this.cities,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cities.length, // Filtrelenmiş listeye göre gösterim
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final city = cities[index];

        return InkWell(
          onTap: () {
            // Detay ekranına yönlendirme
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => WeatherDetailScreen(
                  cityName: city.name,
                ),
              ),
            );
          },
          child: CityWeatherTile(
            index: index,
            city: city,
          ),
        );
      },
    );
  }
}
