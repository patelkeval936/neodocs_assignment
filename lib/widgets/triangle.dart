import 'package:flutter/material.dart';
import 'package:neodocs_assignment/widgets/painters/triangle_painter.dart';

class Triangle extends StatelessWidget {
  const Triangle({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrianglePainter(),
      child: const SizedBox(
        height: 15,
        width: 30,
      ),
    );
  }
}





