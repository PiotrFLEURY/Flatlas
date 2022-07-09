import 'package:flatlas/presentation/widgets/actions.dart';
import 'package:flatlas/presentation/widgets/map.dart';
import 'package:flutter/material.dart';
import 'package:flatlas/presentation/watchers/world/world_watcher.dart';

class Atlas extends StatelessWidget {
  const Atlas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onVerticalDragUpdate: (DragUpdateDetails details) {
            final offset = Offset(
              details.globalPosition.dx,
              details.globalPosition.dy,
            );
            context.worldState.updateOffset(offset);
          },
          child: MapView(
            maxHeight: MediaQuery.of(context).size.height * .9,
            maxWidth: MediaQuery.of(context).size.width,
          ),
        ),
        const MapActions(),
      ],
    );
  }
}
