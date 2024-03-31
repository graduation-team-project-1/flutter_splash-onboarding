import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(241.125, 119.113);
    path_0.cubicTo(241.125, 184.897, 191.874, 242.74, 89.3881, 262.049);
    path_0.cubicTo(26.1645, 273.96, 11.623, 231.957, 0.875, 119.113);
    path_0.cubicTo(0.875, 53.3287, 54.6568, 0, 121, 0);
    path_0.cubicTo(187.343, 0, 241.125, 53.3287, 241.125, 119.113);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(size.width * 0.5000000, 0),
        Offset(size.width * 0.2169421, size.height * 0.9715909), [
      Color(0xffF4ACC4).withOpacity(1),
      ui.Color.fromARGB(255, 220, 192, 234).withOpacity(1),
      ui.Color.fromARGB(255, 175, 203, 246).withOpacity(1)
    ], [
      0,
      0.541667,
      1
    ]);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
