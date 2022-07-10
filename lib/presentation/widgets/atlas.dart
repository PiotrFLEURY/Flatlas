import 'package:flatlas/presentation/widgets/actions.dart';
import 'package:flatlas/presentation/widgets/map.dart';
import 'package:flutter/material.dart';
import 'package:flatlas/presentation/watchers/world/world_watcher.dart';

class Atlas extends StatelessWidget {
  const Atlas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const MapActions(),
        Expanded(
          child: GestureDetector(
            onVerticalDragUpdate: (DragUpdateDetails details) {
              debugPrint('onVerticalDragUpdate');
              final offset = Offset(
                details.globalPosition.dx,
                details.globalPosition.dy,
              );
              context.worldState.updateOffset(offset);
            },
            child: LayoutBuilder(
              builder: (context, constraints) => MapView(
                maxHeight: constraints.maxHeight,
                maxWidth: constraints.maxHeight,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
