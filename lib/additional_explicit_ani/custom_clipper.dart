import 'package:flutter/material.dart';

// !Enum for clipper
enum MyCustomCircleSide { left, right }

// ! extension of path to clipper
// ! created drawer but widget is not created yet
extension ToPath on MyCustomCircleSide {
  Path toPath(Size widgetSize) {
    final pathTODrawArc = Path();
    late Offset offset;
    late bool penMovementClockwiseOrAnti;
    switch (this) {
      case MyCustomCircleSide.left:
        /*
         * for x pencil moving position from where we need to clip offfset
         !for left side  clipping circle
         *  _________________**(x distance moved from left in x , and 0 in Y ) so move pen to clip at startingposition (x,0)
         * |   box we drew   |
         * |_________________|(x distance moved from left in x , and Y distance in Y ) so to  offset
         *                   **                                                     at  which distance pen stops to clip (x,y)
            
         */
        // ? we move the pencil or pen  to tell from where to start clipping
        pathTODrawArc.moveTo(widgetSize.width, 0);
        // ? at which offset point pen stops width and height
        offset = Offset(widgetSize.width, widgetSize.height);
        // ? since cliping right circle we will move anti clock-wise
        penMovementClockwiseOrAnti = false;
        break;

      /*
         * for x pencil moving position from where we need to clip offfset
         !for right  side  clipping circle
         *  (0,0) since pen moviing postion is at origin
         * ** _______________
         * |   box we drew   |
         * |_________________|
         * **   (0 in x, and Y distance in Y ) so to  offset at  which distance pen stops to clip (x,y)
         */
      case MyCustomCircleSide.right:
        // ? we move the pencil or pen  to tell from where to start clipping
        pathTODrawArc.moveTo(0, 0);
        // ? at which offset point pen stops width and height
        offset = Offset(0, widgetSize.height);
        // ? since cliping right circle we will move anti clock-wise
        penMovementClockwiseOrAnti = true;
        break;
    }
    // !draw arc to a point
    pathTODrawArc.arcToPoint(
      offset,
      radius: Radius.elliptical(widgetSize.width / 2, widgetSize.height / 2),
      clockwise: penMovementClockwiseOrAnti,
    );
    // ! close the path or we just drew the line
    pathTODrawArc.close();
    return pathTODrawArc;
  }
}

// ! now draw widget
class MyHalfCircle extends CustomClipper<Path> {
  final MyCustomCircleSide mySidetoDraw;
  // !costructor to choose side to draw from enum

  MyHalfCircle({required this.mySidetoDraw});
  @override
  Path getClip(Size size) {
    return mySidetoDraw.toPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
