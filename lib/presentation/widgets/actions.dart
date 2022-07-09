import 'package:flutter/material.dart';
import 'package:flatlas/presentation/watchers/world/world_watcher.dart';

class MapActions extends StatelessWidget {
  const MapActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // zoom in
        ElevatedButton(
          onPressed: () => context.worldState.zoomIn(),
          child: const Text('Zoom in'),
        ),
        // reset zoom
        ElevatedButton(
          onPressed: () => context.worldState.resetZoom(),
          child: const Text('Reset zoom'),
        ),
        // zoom out
        ElevatedButton(
          onPressed: () => context.worldState.zoomOut(),
          child: const Text('Zoom out'),
        ),
        ElevatedButton(
          onPressed: () => context.worldState.resetZoom(),
          child: const Text('Reset location'),
        ),
      ],
    );
  }
}
