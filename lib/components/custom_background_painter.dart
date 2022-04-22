// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomBackgroungImage extends StatelessWidget {
  final double width;
  const CustomBackgroungImage({Key? key, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, (width * 1.7786666666666666).toDouble()),
      painter: _CustomBackgroundPainter(),
    );
  }
}

class _CustomBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xffC4C4C4).withOpacity(0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * -0.5423493, size.height * 0.4271079);
    path_1.cubicTo(
        size.width * -0.4511973,
        size.height * 0.5298936,
        size.width * -0.1153109,
        size.height * 0.5397796,
        size.width * 0.2078725,
        size.height * 0.4491874);
    path_1.cubicTo(
        size.width * 0.5310560,
        size.height * 0.3585952,
        size.width * 0.7191547,
        size.height * 0.2018306,
        size.width * 0.6280027,
        size.height * 0.09904408);
    path_1.cubicTo(
        size.width * 0.5368507,
        size.height * -0.003742324,
        size.width * 0.2009653,
        size.height * -0.01362768,
        size.width * -0.1222181,
        size.height * 0.07696447);
    path_1.cubicTo(
        size.width * -0.4454027,
        size.height * 0.1675562,
        size.width * -0.6335013,
        size.height * 0.3243208,
        size.width * -0.5423493,
        size.height * 0.4271079);
    path_1.close();
    path_1.moveTo(size.width * 0.7163360, size.height * 0.7128606);
    path_1.cubicTo(
        size.width * 0.4798640,
        size.height * 0.7791469,
        size.width * 0.2340976,
        size.height * 0.7719145,
        size.width * 0.1674019,
        size.height * 0.6967061);
    path_1.cubicTo(
        size.width * 0.1007061,
        size.height * 0.6214963,
        size.width * 0.2383373,
        size.height * 0.5067931,
        size.width * 0.4748107,
        size.height * 0.4405067);
    path_1.cubicTo(
        size.width * 0.7112827,
        size.height * 0.3742204,
        size.width * 0.9570480,
        size.height * 0.3814543,
        size.width * 1.023744,
        size.height * 0.4566627);
    path_1.cubicTo(
        size.width * 1.090440,
        size.height * 0.5318711,
        size.width * 0.9528080,
        size.height * 0.6465742,
        size.width * 0.7163360,
        size.height * 0.7128606);
    path_1.close();
    path_1.moveTo(size.width * 1.083979, size.height * 0.9116822);
    path_1.cubicTo(
        size.width * 0.9117493,
        size.height * 0.9599595,
        size.width * 0.7327520,
        size.height * 0.9546912,
        size.width * 0.6841760,
        size.height * 0.8999145);
    path_1.cubicTo(
        size.width * 0.6356000,
        size.height * 0.8451394,
        size.width * 0.7358400,
        size.height * 0.7615967,
        size.width * 0.9080693,
        size.height * 0.7133193);
    path_1.cubicTo(
        size.width * 1.080299,
        size.height * 0.6650420,
        size.width * 1.259296,
        size.height * 0.6703088,
        size.width * 1.307872,
        size.height * 0.7250855);
    path_1.cubicTo(
        size.width * 1.356448,
        size.height * 0.7798621,
        size.width * 1.256208,
        size.height * 0.8634033,
        size.width * 1.083979,
        size.height * 0.9116822);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.3773947, size.height * 0.01499250),
        Offset(size.width * 0.3773947, size.height * 0.9447076), [
      const Color(0xff6564DB).withOpacity(0.3),
      const Color(0xff31E981).withOpacity(0.3)
    ], [
      0,
      1
    ]);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
