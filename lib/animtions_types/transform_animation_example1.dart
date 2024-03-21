import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_animations/custom_widgets/app_bar.dart';

class MCTransformAnimationExample extends StatefulWidget {
  const MCTransformAnimationExample({super.key});

  @override
  State<MCTransformAnimationExample> createState() =>
      _MCTransformAnimationExampleState();
}

class _MCTransformAnimationExampleState
// ! singleTickerProviderState mixin for vsync
    extends State<MCTransformAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late final Animation _animation;
  @override
  void initState() {
    /*
    0    0   degree
    0.5  180 degree
    1    360 degree
    */
    // !for animation created controller with vsync

    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          seconds: 10,
        ));
    // !  get given tween value i.e. 0-360 or 2*pi .then animate with controller
    _animation =
        Tween<double>(begin: 0, end: 2 * pi).animate(_animationController);
    // ! initiate animate controller  duration for animation duration
    _animationController.repeat();

    super.initState();
  }

  // !always dispose  for consistency of app system usage
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MCAppBAr(appBarTitle: "Tasnform Animation container "),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeadingWidget(headings: "Pivot Z-Axis \n Trasnform"),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Center(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.center,
                        // ! here take ididentity matriz of object ..then rotate pivot from z axis
                        transform: Matrix4.identity()
                          ..rotateZ(
                            _animation.value,
                          ),
                        child: const B0xForAnimation(),
                      );
                    },
                  ),
                ),
              ),
              const HeadingWidget(headings: "Pivot Y-Axis \n Trasnform"),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.center,
                        // ! here take ididentity matriz of object ..then rotate pivot from z axis
                        transform: Matrix4.identity()
                          ..rotateY(
                            _animation.value,
                          ),
                        child: const B0xForAnimation(),
                      );
                    },
                  ),
                ),
              ),
              const HeadingWidget(headings: "Pivot X-Axis \n Trasnform"),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Center(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.center,
                        // ! here take ididentity matriz of object ..then rotate pivot from z axis
                        transform: Matrix4.identity()
                          ..rotateX(
                            _animation.value,
                          ),
                        child: const B0xForAnimation(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeadingWidget extends StatelessWidget {
  final String headings;
  const HeadingWidget({
    super.key,
    required this.headings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            // ! from what  distance from object  shadow will strat to blur
            blurRadius: 5,
            //! radius of shadow that will spread
            spreadRadius: 12,
            // !distance for shadow how far the shadow will offset
            offset: const Offset(25, 25),
          ),
        ],
      ),
      child: Text(
        headings,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class B0xForAnimation extends StatelessWidget {
  const B0xForAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFADA),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            // ! from what  distance from object  shadow will strat to blur
            blurRadius: 5,
            //! radius of shadow that will spread
            spreadRadius: 12,
            // !distance for shadow how far the shadow will offset
            offset: const Offset(25, 25),
          ),
        ],
      ),
    );
  }
}
