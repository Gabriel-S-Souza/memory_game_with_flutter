import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomInfoBanner extends StatelessWidget {
  final double width;
  const CustomInfoBanner({Key? key, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, (width*0.11848341232227488).toDouble()),
      painter: RPSCustomPainter(),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
      @override
      void paint(Canvas canvas, Size size) {
              
  Path path_0 = Path();
      path_0.moveTo(size.width*0.5009425,size.height*0.7240150);
      path_0.cubicTo(size.width*0.5002305,size.height*0.7244900,size.width*0.4995154,size.height*0.7244900,size.width*0.4988033,size.height*0.7240150);
      path_0.lineTo(size.width*0.1718347,size.height*0.5062350);
      path_0.cubicTo(size.width*0.1551321,size.height*0.4951110,size.width*0.1551321,size.height*0.2885640,size.width*0.1718347,size.height*0.2774395);
      path_0.lineTo(size.width*0.4988033,size.height*0.05965800);
      path_0.cubicTo(size.width*0.4995154,size.height*0.05918400,size.width*0.5002305,size.height*0.05918400,size.width*0.5009425,size.height*0.05965800);
      path_0.lineTo(size.width*0.8279088,size.height*0.2774395);
      path_0.cubicTo(size.width*0.8446149,size.height*0.2885640,size.width*0.8446149,size.height*0.4951115,size.width*0.8279088,size.height*0.5062350);
      path_0.lineTo(size.width*0.5009425,size.height*0.7240150);
      path_0.close();

  Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
  paint_0_fill.color = Color(0xff6564DB).withOpacity(1.0);
  canvas.drawPath(path_0,paint_0_fill);

  Path path_1 = Path();
      path_1.moveTo(size.width*0.5139680,size.height*0.9364750);
      path_1.lineTo(size.width*0.6184597,size.height*0.4851965);
      path_1.cubicTo(size.width*0.6466765,size.height*0.3633335,size.width*0.6364100,size.height*0.003691865,size.width*0.6047097,size.height*0.003691865);
      path_1.lineTo(size.width*0.3957275,size.height*0.003691865);
      path_1.cubicTo(size.width*0.3640314,size.height*0.003691865,size.width*0.3537618,size.height*0.3633340,size.width*0.3819787,size.height*0.4851965);
      path_1.lineTo(size.width*0.4864704,size.height*0.9364750);
      path_1.cubicTo(size.width*0.4951037,size.height*0.9737600,size.width*0.5053341,size.height*0.9737600,size.width*0.5139680,size.height*0.9364750);
      path_1.close();

  Paint paint_1_stroke = Paint()..style=PaintingStyle.stroke..strokeWidth=size.width*0.0008748341;
  paint_1_stroke.color=Color(0xffBABABA).withOpacity(1.0);
  canvas.drawPath(path_1,paint_1_stroke);

  Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
  paint_1_fill.color = Color(0xff6564DB).withOpacity(1.0);
  canvas.drawPath(path_1,paint_1_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
      return true;
  }
}