import 'package:flatlas/presentation/watchers/world/world_status.dart';
import 'package:flatlas/presentation/watchers/world/world_watcher.dart';
import 'package:flatlas/presentation/widgets/atlas.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WorldWatcher(
        builders: {
          loadingWorld: _loading,
          showingWorld: _idle,
        },
      ),
    );
  }

  Widget _loading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _idle(BuildContext context) {
    return Atlas(
      key: ValueKey('atlas#${DateTime.now()}'),
    );
  }
}
