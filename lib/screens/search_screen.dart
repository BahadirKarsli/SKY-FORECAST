import 'package:flutter/material.dart';
import 'package:weather_app/views/famous_cities_weather.dart';
import 'package:weather_app/views/gradient_container.dart';

import '/constants/app_colors.dart';
import '/constants/text_styles.dart';
import '/models/famous_city.dart';
import '/widgets/round_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchController;
  List<FamousCity> filteredCities = famousCities;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    _searchController.addListener(() {
      final query = _searchController.text.toLowerCase();

      setState(() {
        filteredCities = famousCities.where((city) {
          return city.name.toLowerCase().contains(query);
        }).toList();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        children: [ 
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Pick Location',
              style: TextStyles.h1,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: RoundTextField(controller: _searchController),
              ),
              const SizedBox(width: 15),
              const LocationIcon(),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                FamousCitiesWeather(cities: filteredCities),
              ],
            ),
          )
        ],
      ),
    );
  }

}

class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: AppColors.accentBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.location_on_outlined,
        color: AppColors.grey,
      ),
    );
  }
}
