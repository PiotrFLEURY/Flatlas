import 'package:flatlas/data/model/world.dart';
import 'package:flatlas/presentation/watchers/world/world_state.dart';
import 'package:flutter/widgets.dart';
import 'package:watchers/watchers/watcher.dart';

class WorldWatcher extends Watcher<WorldState> {
  WorldWatcher({super.key, required super.state, required super.builder});

  static WorldWatcher of(BuildContext context) =>
      Watcher.of<WorldWatcher>(context);
}

extension WorldWatcherExtension on BuildContext {
  WorldWatcher get worldWatcher => WorldWatcher.of(this);

  WorldState get worldState => worldWatcher.state;

  World get world => worldState.world;

  void loadWorld() => worldState.loadWorld();
}
