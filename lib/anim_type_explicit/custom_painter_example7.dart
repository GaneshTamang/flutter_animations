import 'dart:math';

import 'package:flutter/material.dart';

class MyCustomPainterExample7 extends StatefulWidget {
  const MyCustomPainterExample7({super.key});

  @override
  State<MyCustomPainterExample7> createState() =>
      _MyCustomPainterExample7State();
}

class _MyCustomPainterExample7State extends State<MyCustomPainterExample7>
    with TickerProviderStateMixin {
  // * side controller
  late AnimationController _sidesController;
  late Animation _sideAnimation;

  // * radius Controller
  late AnimationController _radiusController;
  late Animation _radiusAnimation;
  // * rotarioncontroller
  late AnimationController _rotationController;
  late Animation _rotationAnimation;

  @override
  void initState() {
    // * side Controller
    _sidesController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _sideAnimation = IntTween(begin: 3, end: 10).animate(_sidesController);

    // * radius Controller
    _radiusController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _radiusAnimation = Tween(begin: 60.0, end: 400.0)
        .chain(
          CurveTween(curve: Curves.bounceInOut),
        )
        .animate(_radiusController);
// * rotationcontroller
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _rotationAnimation = Tween(begin: 0.0, end: 2 * pi)
        .chain(
          CurveTween(curve: Curves.easeInOut),
        )
        .animate(_rotationController);

    super.initState();
  }

// ! this is better to use for better handling
  @override
  void didChangeDependencies() {
    _sidesController.repeat(reverse: true);
    _radiusController.repeat(reverse: true);
    _rotationController.repeat(reverse: true);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _sidesController.dispose();
    _radiusController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: AnimatedBuilder(
      animation: Listenable.merge(
        [
          _sidesController,
          _radiusController,
          _rotationController,
        ],
      ),
      builder: (context, child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateX(_rotationAnimation.value)
            ..rotateY(_rotationAnimation.value)
            ..rotateZ(_rotationAnimation.value),
          child: Center(
            child: CustomPaint(
              painter: Polygon(
                polygonSides: _sideAnimation.value,
              ),
              child: SizedBox(
                height: _radiusAnimation.value,
                width: _radiusAnimation.value,
              ),
            ),
          ),
        );
      },
    )));
  }
}

// ! painter class for drawing custom paint with sides

class Polygon extends CustomPainter {
  final int polygonSides;

  Polygon({
    super.repaint,
    required this.polygonSides,
  });

  @override
  void paint(Canvas canvas, Size size) {
    //  ! how to paint style  ,cap intersection width color
    final Paint paint = Paint()
      // ! fill or line?
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5
      ..color = Colors.blue;

    // ! center point of canvas
    final Offset center = Offset(size.width / 2, size.height / 2);
    // !each angle movement according to side
    // * i.e. 360/no of sides
    final eachSideAngleMustHave = (2 * pi) / polygonSides;
    // ! generate no of sides with angles
    // ? make list  here  eg 60 then at 0 penmoventangle is 0 ,at 1 is 60 ,at 2 is 120 and so on
    final List<double> angles =
        List.generate(polygonSides, (index) => index * eachSideAngleMustHave);

    final double radius = size.width / 2;

// ! here all neceesary mats are ready tto draw now  command
    // ! path to move pen
    final Path path = Path();

    //  ! move pen to draw at initial point

    path.moveTo(
      center.dx + radius * cos(0),
      center.dy + radius * sin(0),
    );
    /*
    * x->center.dx + radius * cos(angle),
    *y->center.dy + radius * sin(angle),
    
    */
    //! for every list point move pen
    for (var angle in angles) {
      path.lineTo(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
    }
    //! close initial and final point
    path.close();
    // !finally draw with path movement and paint
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is Polygon && oldDelegate.polygonSides != polygonSides;
}
