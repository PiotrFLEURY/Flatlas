import 'package:flatlas/data/model/city.dart';

class World {
  final List<City> cities;

  const World({
    required this.cities,
  });

  get isEmpty => cities.isEmpty;

  get isNotEmpty => cities.isNotEmpty;
}
