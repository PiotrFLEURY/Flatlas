import 'package:flatlas/data/model/world.dart';
import 'package:flatlas/domain/viewmodel/world_view_model.dart';
import 'package:flatlas/presentation/widgets/map.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final WorldViewModel viewModel;
  const HomePage({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, _) {
          final world = viewModel.world;
          if (world == null) {
            viewModel.loadWorld();
            return const Center(child: CircularProgressIndicator());
          } else {
            return _buildContent(
              context,
              world,
              viewModel.scaleFactor,
              viewModel.offset,
            );
          }
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    World world,
    double scaleFactor,
    Offset offset,
  ) {
    return Column(children: [
      GestureDetector(
        onVerticalDragUpdate: (DragUpdateDetails details) {
          final offset = Offset(
            details.globalPosition.dx,
            details.globalPosition.dy,
          );
          debugPrint(details.globalPosition.toString());
          debugPrint(offset.toString());
          viewModel.updateOffset(offset);
        },
        child: MapView(
          world: world,
          scaleFactor: scaleFactor,
          offset: offset,
          maxHeight: MediaQuery.of(context).size.height * .9,
          maxWidth: MediaQuery.of(context).size.width,
        ),
      ),
      Row(
        children: [
          // zoom in
          ElevatedButton(
            onPressed: _zoomIn,
            child: const Text('Zoom in'),
          ),
          // reset zoom
          ElevatedButton(
            onPressed: _resetZoom,
            child: const Text('Reset zoom'),
          ),
          // zoom out
          ElevatedButton(
            onPressed: _zoomOut,
            child: const Text('Zoom out'),
          ),
          ElevatedButton(
            onPressed: _resetLocation,
            child: const Text('Reset location'),
          ),
        ],
      )
    ]);
  }

  void _zoomIn() {
    viewModel.zoomIn();
  }

  void _zoomOut() {
    viewModel.zoomOut();
  }

  void _resetZoom() {
    viewModel.resetZoom();
  }

  void _resetLocation() {
    viewModel.resetLocation();
  }
}
