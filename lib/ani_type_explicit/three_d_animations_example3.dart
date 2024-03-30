import 'dart:math';

import 'package:flutter/material.dart';
// ! shows only vector 3 part
import 'package:vector_math/vector_math_64.dart' show Vector3;

class ThreeDAnimationExample3 extends StatefulWidget {
  const ThreeDAnimationExample3({super.key});

  @override
  State<ThreeDAnimationExample3> createState() =>
      _ThreeDAnimationExample3State();
}

class _ThreeDAnimationExample3State extends State<ThreeDAnimationExample3>
    with TickerProviderStateMixin {
  late AnimationController xController;
  late AnimationController yController;
  late AnimationController zController;
  late Tween<double> _animation;
  @override
  void initState() {
    xController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 30,
      ),
    );
    yController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 40,
      ),
    );
    zController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 50,
      ),
    );
    _animation = Tween<double>(begin: 0, end: 2 * pi);
    super.initState();
  }

  @override
  void dispose() {
    xController.dispose();
    yController.dispose();
    zController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double? heightAndWidt = 150;
    xController
      ..reset()
      ..repeat();
    yController
      ..reset()
      ..repeat();
    zController
      ..reset()
      ..repeat();
    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge([
          xController,
          yController,
          zController,
        ]),
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateY(_animation.evaluate(yController))
              ..rotateX(_animation.evaluate(xController))
              ..rotateZ(_animation.evaluate(zController)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                  width: double.infinity,
                ),
                // TutorialStyle3DBox(heightAndWidt: heightAndWidt),

                MyStyle3DBox(heightAndWidt: heightAndWidt)
              ],
            ),
          );
        },
      ),
    );
  }
}

class TutorialStyle3DBox extends StatelessWidget {
  const TutorialStyle3DBox({
    super.key,
    required this.heightAndWidt,
  });

  final double? heightAndWidt;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // !front
        Container(
          height: heightAndWidt,
          width: heightAndWidt,
          color: Colors.amber,
        ),
        //!back
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..translate(Vector3(0, 0, -heightAndWidt!)),
          child: Container(
            height: heightAndWidt,
            width: heightAndWidt,
            color: Colors.green,
          ),
        ),
        // !left
        Transform(
          alignment: Alignment.centerLeft,
          transform: Matrix4.identity()..rotateY((pi / 2)),
          child: Container(
            height: heightAndWidt,
            width: heightAndWidt,
            color: const Color.fromARGB(255, 255, 99, 26),
          ),
        ),
        // ! right side
        Transform(
          alignment: Alignment.centerRight,
          transform: Matrix4.identity()..rotateY(-(pi / 2)),
          child: Container(
            height: heightAndWidt,
            width: heightAndWidt,
            color: Colors.blue,
          ),
        ), // ! top side
        Transform(
          alignment: Alignment.topCenter,
          transform: Matrix4.identity()..rotateX(-(pi / 2)),
          child: Container(
            height: heightAndWidt,
            width: heightAndWidt,
            color: Colors.blueGrey,
          ),
        ),
        // ! bottom
        Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.identity()..rotateX((pi / 2)),
          child: Container(
            height: heightAndWidt,
            width: heightAndWidt,
            color: Colors.indigo,
          ),
        ),
      ],
    );
  }
}

class MyStyle3DBox extends StatelessWidget {
  const MyStyle3DBox({
    super.key,
    required this.heightAndWidt,
  });

  final double? heightAndWidt;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // !behind
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.translationValues(00.0, 0.0, -heightAndWidt!),
          child: Container(
            height: heightAndWidt,
            width: heightAndWidt,
            color: Colors.purple,
          ),
        ), // !frnt
        Container(
          height: heightAndWidt,
          width: heightAndWidt,
          color: Colors.amber,
        ),
        // !right
        Transform(
          alignment: Alignment.centerRight,
          transform: Matrix4.identity()..rotateY(-(pi / 2)),
          child: Container(
            height: heightAndWidt,
            width: heightAndWidt,
            color: Colors.blue,
          ),
        ),
        // !left
        Transform(
          alignment: Alignment.bottomLeft,
          transform: Matrix4.identity()..rotateY((pi / 2)),
          child: Container(
            height: heightAndWidt,
            width: heightAndWidt,
            color: Colors.black54,
          ),
        ),

        // !top
        Transform(
          alignment: Alignment.topCenter,
          transform: Matrix4.identity()..rotateX(-(pi / 2)),
          child: Container(
            height: heightAndWidt,
            width: heightAndWidt,
            color: const Color.fromARGB(255, 73, 104, 15),
          ),
        ),
        // !bootom
        Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.identity()..rotateX((pi / 2)),
          child: Container(
            height: heightAndWidt,
            width: heightAndWidt,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
