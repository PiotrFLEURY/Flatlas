import 'package:flatlas/data/model/world.dart';
import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  final World world;
  final double scaleFactor;
  final Offset offset;
  final double maxHeight;
  final double maxWidth;

  const MapView({
    Key? key,
    required this.world,
    required this.scaleFactor,
    required this.offset,
    this.maxHeight = double.infinity,
    this.maxWidth = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: MapPainter(
            world: world,
            scaleFactor: scaleFactor,
            offset: offset,
          ),
          child: maxHeight == double.infinity
              ? const SizedBox.expand()
              : SizedBox(
                  width: maxWidth,
                  height: maxHeight,
                ),
        ),
        ...world.cities
            .map(
              (e) => Positioned(
                left: offset.dx + e.x.toDouble() * scaleFactor,
                top: offset.dy + e.y.toDouble() * scaleFactor,
                child: Text(e.name),
              ),
            )
            .toList(),
      ],
    );
  }
}

class MapPainter extends CustomPainter {
  final World world;
  final double scaleFactor;
  final Offset offset;

  const MapPainter({
    required this.world,
    required this.scaleFactor,
    required this.offset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var element in world.cities) {
      final paint = Paint()
        ..color = Colors.black
        ..strokeWidth = 2
        ..style = PaintingStyle.fill;
      canvas.drawCircle(
        Offset(
          offset.dx + element.x.toDouble() * scaleFactor,
          offset.dy + element.y.toDouble() * scaleFactor,
        ),
        4,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
