import 'package:flatlas/data/model/city.dart';
import 'package:flatlas/data/model/world.dart';
import 'package:flutter/services.dart' show rootBundle;

class WorldRepository {
  /// load city.dat from assets
  Future<String> loadCityFileFromAsset() async {
    return rootBundle.loadString('assets/data/city.data');
  }

  /// load world from data file
  Future<World> loadWorld() async {
    final cities = await loadCities();
    return World(cities: cities);
  }

  Future<List<City>> loadCities() async {
    final cityData = await loadCityFileFromAsset();
    final lines = cityData.split('\n').where((element) => element.isNotEmpty);
    return lines.map((line) {
      final columns = line.split(';');
      return City(
        name: columns[0],
        code: columns[1],
        x: int.parse(columns[2]),
        y: int.parse(columns[3]),
      );
    }).toList();
  }
}
