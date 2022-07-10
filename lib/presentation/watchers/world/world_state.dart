import 'package:flatlas/data/model/world.dart';
import 'package:flatlas/domain/repositories/world_repository.dart';
import 'package:flatlas/presentation/watchers/world/world_status.dart';
import 'package:flutter/material.dart';
import 'package:watchers/states/generic_state.dart';

class WorldState extends GenericState<World> {
  final WorldRepository repository;
  double scaleFactor = 1;
  Offset offset = Offset.zero;
  String highlighted = '';

  WorldState({required this.repository}) : super(const World(cities: [])) {
    loadWorld();
  }

  World get world => value;

  Future<void> loadWorld() async {
    value = await repository.loadWorld();
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

  void highlight(String value) {
    highlighted = value;
    notifyListeners();
  }

  @override
  String get currentState => world.isEmpty ? loadingWorld : showingWorld;
}
