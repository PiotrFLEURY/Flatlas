import 'package:flutter/material.dart';
import 'package:flatlas/presentation/watchers/world/world_watcher.dart';

class MapActions extends StatelessWidget {
  const MapActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
            width: MediaQuery.of(context).size.width * .1,
            child: TextField(
              onSubmitted: (value) => context.worldState.highlight(value),
            ),
          ),
          // zoom in
          OutlinedButton(
            onPressed: () => context.worldState.zoomIn(),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Zoom in',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          // reset zoom
          OutlinedButton(
            onPressed: () => context.worldState.resetZoom(),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Reset zoom',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          // zoom out
          OutlinedButton(
            onPressed: () => context.worldState.zoomOut(),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Zoom out',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () => context.worldState.resetLocation(),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Reset location',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
