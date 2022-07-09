import 'package:flatlas/domain/repositories/world_repository.dart';
import 'package:flatlas/presentation/watchers/world/world_state.dart';
import 'package:flatlas/presentation/watchers/world/world_watcher.dart';
import 'package:flatlas/presentation/widgets/atlas.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WorldWatcher(
        state: WorldState(repository: WorldRepository()),
        builder: (context) {
          if (context.world.isEmpty) {
            context.loadWorld();
            return const Center(child: CircularProgressIndicator());
          } else {
            return Atlas(
              key: ValueKey('atlas#${DateTime.now()}'),
            );
          }
        },
      ),
    );
  }
}
