import 'package:flatlas/data/model/world.dart';
import 'package:flatlas/domain/repositories/world_repository.dart';
import 'package:flutter/cupertino.dart';

class WorldViewModel with ChangeNotifier {
  final WorldRepository repository;
  World? _world;
  double scaleFactor = 1;
  Offset offset = Offset.zero;

  WorldViewModel({required this.repository});

  World? get world => _world;

  Future<void> loadWorld() async {
    _world = await repository.loadWorld();
    notifyListeners();
  }

  void zoomIn() {
    scaleFactor += .1;
    notifyListeners();
  }

  void zoomOut() {
    scaleFactor -= .1;
    notifyListeners();
  }

  void resetZoom() {
    scaleFactor = 1;
    notifyListeners();
  }

  void updateOffset(Offset offset) {
    this.offset = offset;
    notifyListeners();
  }

  void resetLocation() {
    offset = Offset.zero;
    notifyListeners();
  }
}
