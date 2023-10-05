import 'package:flutter/material.dart';

class CurvedShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    print('device height ${size.height}');
    print('device width ${size.width}');

    //top curve shape
    path.moveTo(0, size.height / 3);
    path.quadraticBezierTo(size.width / 2, 0, size.width, size.height / 3);
    path.close();
    path.moveTo(0, size.height / 3);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CurvedShapeClipper oldClipper) => true;
}
