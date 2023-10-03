import 'package:flutter/material.dart';
import '../constands/colors.dart';

class BottomPaint  extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorConstants.APPPRIMARYCOLOR, // Start color
        ColorConstants.APPPRIMARYCOLOR, // Start color
        // Color(0xFF00CCFF), // Middle color
        ColorConstants.APPPRIMARYCOLOR2, // End color
      ],
      // stops: [0.0, 0.5, 1.0], // Adjust the color distribution along the gradient
    );


    final paint = Paint();
    paint.color = ColorConstants.APPPRIMARYBLACKCOLOR;
    // paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.fill;
    //  paint.shader = gradient.createShader(Rect.fromPoints(Offset(5, 2), Offset(size.width, size.height)));
    paint.strokeWidth = 7;

    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width-12, size.height*0.35, size.width-50, size.height*0.30);
    path.lineTo(size.width-size.width+50, size.height*0.34);
    path.quadraticBezierTo(size.width-size.width+16,size.height*0.34, size.width-size.width, size.height-size.height);
    path.close();

    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DetailPaints extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint();
    paint.color = ColorConstants.APPPRIMARYLIGHTGREYCOLOR.withOpacity(0.2);
    paint.strokeWidth = 7;


    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
  canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate

      ) {
    // TODO: implement shouldRepaint
   return false;
  }

}

class SpecialPricePaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint();
    paint.color = ColorConstants.APPSECONDARYCOLOR.withOpacity(0.1);
    paint.strokeWidth = 7;
    paint.style = PaintingStyle.fill;


    path.lineTo(0, size.height);
    path.lineTo(size.width-20, size.height);
    path.lineTo(size.width, 0);
    path.close();
  canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate

      ) {
    // TODO: implement shouldRepaint
   return false;
  }

}






class DetailPaints2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final paint = Paint();

    // Set the paint properties
    paint.color = ColorConstants.APPSECONDARYCOLOR; // Color for the stroke
    paint.strokeWidth = 3; // Width of the stroke
    paint.style = PaintingStyle.stroke; // Style of painting (stroke)

    path.moveTo(0, 0); // Move to the top-left corner
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.9, size.width, size.height); // Create a quadratic Bezier curve to the bottom-right corner

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return false;
  }
}


class BottomSheetPaint  extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorConstants.APPSECONDARYCOLOR.withOpacity(0.9),
        ColorConstants.APPPRIMARYBLACKCOLOR,
        ColorConstants.APPPRIMARYBLACKCOLOR,
      ],
      // stops: [0.0, 0.5, 1.0], // Adjust the color distribution along the gradient
    );


    final paint = Paint();
    paint.color =  Colors.amber;
    paint.strokeCap = StrokeCap.round;
    paint.style = PaintingStyle.fill;
    paint.shader = gradient.createShader(Rect.fromPoints(Offset(5, 2), Offset(size.width, size.height)));
    paint.strokeWidth = 8;
    final path = Path();
    path.lineTo(0, size.height *0.45);
    path.quadraticBezierTo(size.width *0.12, size.height/-7, size.width *0.19, size.height *0.30);
    path.quadraticBezierTo(size.width *0.27, size.height *0.70, size.width *0.31, size.height *0.45);
    path.quadraticBezierTo(size.width *0.38, size.height *0.05, size.width *0.44, size.height *0.50);
    path.quadraticBezierTo(size.width*0.56,size.height/ 1+ 30, size.width*0.70, size.height*0.60);
    path.quadraticBezierTo(size.width*0.81,size.height/-7, size.width*0.86, size.height*0.45);
    path.quadraticBezierTo(size.width *0.91, size.height *0.95, size.width, size.height *0.41);
    path.lineTo(size.width , 0);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


class ProfilePagePaint extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorConstants.APPPRIMARYCOLOR, // Start color
        // Color(0xFF00CCFF), // Middle color
        ColorConstants.APPPRIMARYCOLOR2, // End color
      ],
      // stops: [0.0, 0.5, 1.0], // Adjust the color distribution along the gradient
    );

    // final painrt = Paint()..shader = gradient.createShader(Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)));

    final paint = Paint();
    paint.shader = gradient.createShader(Rect.fromPoints(Offset(5, 2), Offset(size.width, size.height)));
    paint.color = ColorConstants.APPPRIMARYCOLOR;
    paint.style = PaintingStyle.fill;
    final path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height-30);
    // path.quadraticBezierTo(size.width/4, size.height, size.width /2, size.height);
    // path.quadraticBezierTo(size.width-(size.width/4), size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}




class ProfilePagePaint2 extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorConstants.APPPRIMARYBLACKCOLOR, // Start color
        ColorConstants.APPPRIMARYBLACKCOLOR, // Start color

        ColorConstants.APPSECONDARYCOLOR, // End color
      ],
      // stops: [0.0, 0.5, 1.0], // Adjust the color distribution along the gradient
    );



    final paint = Paint();
    paint.color = ColorConstants.APPPRIMARYCOLOR;
    paint.style = PaintingStyle.fill;
    paint.shader = gradient.createShader(Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height)));



    final path = Path();
    path.lineTo(0.0, size.height-30);
    path.quadraticBezierTo(size.width/4, size.height, size.width /2, size.height);
    path.quadraticBezierTo(size.width-(size.width/4), size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0.0);
    path.close();


    canvas.drawPath(path, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}




class CardPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.grey.withOpacity(0.5),

        ColorConstants.APPSECONDARYCOLOR,
      ],
      // stops: [0.0, 0.5, 1.0], // Adjust the color distribution along the gradient
    );

    final paint = Paint();
    paint.shader = gradient.createShader(
        Rect.fromPoints(Offset(5, 2), Offset(size.width, size.height)));
    // paint.color = ColorConstants.APPPRIMARYCOLOR;
    paint.style = PaintingStyle.fill;
    final path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    final shadowPaint = Paint()
      ..color = ColorConstants.APPSECONDARYCOLOR.withOpacity(0.2)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 15.0);
    // canvas.drawShadow(path, ColorConstants.APPPRIMARYCOLOR.withOpacity(0.5), 5.0, true);

    // Draw shadows on all sides
    canvas.drawPath(path.shift(Offset(5.0, 5.0)), shadowPaint);
    canvas.drawPath(path.shift(Offset(-5.0, -5.0)), shadowPaint);
    canvas.drawPath(path.shift(Offset(5.0, -5.0)), shadowPaint);
    canvas.drawPath(path.shift(Offset(-5.0, 5.0)), shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


class HorizentalCardPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()..color = Colors.white.withOpacity(0.1);
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width *0.5, 0);
    path.lineTo(0, size.height *0.8);
    path.close();

    final path2 = Path();

    path2.moveTo(size.width, 0);
    path2.lineTo(size.width *0.8, 0);
    path2.lineTo(size.width *0.2,size.height );
    path2.lineTo(size.width,size.height );
    path2.close();

    canvas.drawPath(path,paint);
    canvas.drawPath(path2,paint);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false ;  }
}
