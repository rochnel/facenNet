


import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final width =  size.width;
    final height = size.height;
    Path path = Path();

    Offset controlPoint = Offset(0.0, 0.0);
    Offset targetPoint = Offset(0.0, 0.0);

    path.moveTo(0, height * 0.5);

    controlPoint = Offset(width* 0, height /1.5);
    targetPoint = Offset(width * 0.3, height * 0.60);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, targetPoint.dx, targetPoint.dy);

controlPoint = Offset(width* 0.80, height *  0.4);
    targetPoint = Offset(width * 0.82, height * 0.5);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, targetPoint.dx, targetPoint.dy);

    controlPoint = Offset(width* 0.72, height* 0.4);
    targetPoint = Offset(width , height * 0.65);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, targetPoint.dx, targetPoint.dy);
 
    path.lineTo(width, height);
    path.lineTo(0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this; 
  }
}

class WaveClipperSplach2 extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final width =  size.width;
    final height = size.height;
    Path path = Path();

    Offset controlPoint = Offset(0.0, 0.0);
    Offset targetPoint = Offset(0.0, 0.0);

    path.moveTo(0, height * 0.5);

    controlPoint = Offset(width* 0, height * 0.3);
    targetPoint = Offset(width * 0.3, height * 0.5);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, targetPoint.dx, targetPoint.dy);

controlPoint = Offset(width* 0.3, height *  0.5);
    targetPoint = Offset(width * 0.6, height * 0.6);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, targetPoint.dx, targetPoint.dy);

    controlPoint = Offset(width, height* 0.4);
    targetPoint = Offset(width , height * 0.4);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, targetPoint.dx, targetPoint.dy);
 
    path.lineTo(width, height);
    path.lineTo(0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this; 
  }
}

class WaveClipperHome extends CustomClipper<Path> {
  final double waveDeep;
  final double waveDeep2;


  WaveClipperHome({this.waveDeep = 100,this.waveDeep2 = 0});
  @override
  Path getClip(Size size) {
    final double sw = size.width;
    final double sh = size.height;

    final Offset controlPoint1 = Offset(sw * .25 , sh -waveDeep2*2);
    final Offset destinationPoint1 = Offset(sw * .5  , sh - waveDeep- waveDeep2);

    final Offset controlPoint2 = Offset(sw * .75 , sh  - waveDeep*2 );
    final Offset destinationPoint2 = Offset(sw  , sh - waveDeep);

    final Path path = Path()
      ..lineTo(0, size.height-waveDeep2)
      ..quadraticBezierTo(controlPoint1.dx, controlPoint1.dy, destinationPoint1.dx, destinationPoint1.dy
          )
      ..quadraticBezierTo(controlPoint2.dx, controlPoint2.dy ,destinationPoint2.dx, destinationPoint2.dy
          )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}







class WaveClipperOnb1 extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final width =  size.width;
    final height = size.height;
    Path path = Path();

    Offset controlPoint = Offset(0.0, 0.0);
    Offset targetPoint = Offset(0.0, 0.0);

   // path.moveTo(0, height * 0.1);

    controlPoint = Offset(width* 0, 0);
    targetPoint = Offset(width * 0.2 , height * 0.58);
    path.cubicTo(controlPoint.dx, controlPoint.dy, targetPoint.dx, targetPoint.dy, width  , height * 0.61);

    path.lineTo(width, height);
    path.lineTo(0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this; 
  }
}
class WaveClipperOnb2 extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final width =  size.width;
    final height = size.height;
    Path path = Path();

    Offset controlPoint = Offset(0.0, 0.0);
    Offset targetPoint = Offset(0.0, 0.0);

   path.moveTo(0, height * 0.61);

    controlPoint = Offset(width*0.2, height * 0.7);
    targetPoint = Offset(width * 0.3 , height * 0.9);
    path.cubicTo(controlPoint.dx, controlPoint.dy, targetPoint.dx, targetPoint.dy, width  , height * 0.8);

    path.lineTo(width, height);
    path.lineTo(0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this; 
  }
}

class WaveClipperOnb3 extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final width =  size.width;
    final height = size.height;
    Path path = Path();

    Offset controlPoint = Offset(0.0, 0.0);
    Offset targetPoint = Offset(0.0, 0.0);

   path.moveTo(width*0, height * 0.8);

    controlPoint = Offset(width* 0.4, height * 0.8);
    targetPoint = Offset(width * 0.3 , height * 0.4);
    path.cubicTo(controlPoint.dx, controlPoint.dy, targetPoint.dx, targetPoint.dy, width, height * 0.3);
 

    path.lineTo(width, height);
    path.lineTo(0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this; 
  }
}


class WaveClipperOnb4 extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    final width =  size.width;
    final height = size.height;
    Path path = Path();

    Offset controlPoint = Offset(0.0, 0.0);
    Offset targetPoint = Offset(0.0, 0.0);

   path.moveTo(width*0, height * 0.3);

    controlPoint = Offset(width* 0.4, height * 0.1);
    targetPoint = Offset(width * 0.3 , height * 0.1);
    path.cubicTo(controlPoint.dx, controlPoint.dy, targetPoint.dx, targetPoint.dy, width, height * 0.1);
 

    path.lineTo(width, height);
    path.lineTo(0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this; 
  }
}