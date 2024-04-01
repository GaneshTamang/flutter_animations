import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_animations/additional_explicit_ani/custom_clipper.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}
// ! extenstion is the process of extending a  class char without inheriting the widget

extension on VoidCallback {
  // ! created  a explicit constructor or passing functionality to existing class  or libary
  // ! extnded  calss parameter can be accessed using this key word

  Future<void> delayed(Duration duration) {
    return Future.delayed(const Duration(seconds: 1), this);
  }
}

class _Example2State extends State<Example2>
// ! mixin for class here removed single since we using multiple animations

    with
        TickerProviderStateMixin {
  late AnimationController _counterClockWiseAnimationContoller;
  late Animation _counterClockAnimation;

  // * flip animation
  late AnimationController _flipCOntroller;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    _counterClockWiseAnimationContoller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _counterClockAnimation = Tween<double>(
      begin: 0,
      end: -(pi / 2),
    ).animate(CurvedAnimation(
      parent: _counterClockWiseAnimationContoller,
      curve: Curves.bounceOut,
    ));

// *flip animation init
    _flipCOntroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _flipAnimation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(CurvedAnimation(
      parent: _flipCOntroller,
      curve: Curves.bounceOut,
    ));

    // ! clock listener

    _counterClockWiseAnimationContoller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _flipAnimation = Tween<double>(
            begin: _flipAnimation.value,
            end: _flipAnimation.value + pi,
          ).animate(CurvedAnimation(
            parent: _flipCOntroller,
            curve: Curves.bounceOut,
          ));
          // ? after completion flip animation reset and run
          _flipCOntroller
            ..reset()
            ..forward();
        }
      },
    );
    // ! listener for  flip
    _flipCOntroller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _counterClockAnimation = Tween<double>(
          begin: _counterClockAnimation.value,
          end: _counterClockAnimation.value + -(pi / 2),
        ).animate(
          CurvedAnimation(
              parent: _counterClockWiseAnimationContoller,
              curve: Curves.bounceOut),
        );
        _counterClockWiseAnimationContoller
          ..reset()
          ..forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _counterClockWiseAnimationContoller.dispose();
    _flipCOntroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _counterClockWiseAnimationContoller
      // !!every time build called reset for animation of hot reload or it willl on play once
      ..reset()
      ..forward.delayed(
        const Duration(seconds: 1),
      );
    return Scaffold(
      body: Center(
        // ! first Animation
        child: AnimatedBuilder(
          animation: _counterClockWiseAnimationContoller,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(_counterClockAnimation.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ! when first animation is done that the rotaion make x ->y  &y->X so next rotation is Y ->X
                  AnimatedBuilder(
                    animation: _flipCOntroller,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()
                          ..rotateY(_flipAnimation.value),
                        // ! custom clipper shape
                        child: ClipPath(
                          clipper: MyHalfCircle(
                              mySidetoDraw: MyCustomCircleSideToDraw.left),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _flipCOntroller,
                    builder: (context, child) {
                      return Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()
                          ..rotateY(_flipAnimation.value),
                        child: ClipPath(
                          clipper: MyHalfCircle(
                              mySidetoDraw: MyCustomCircleSideToDraw.right),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyCircle extends StatelessWidget {
  const MyCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipPath(
          clipper: MyHalfCircle(mySidetoDraw: MyCustomCircleSideToDraw.left),
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ),
        ClipPath(
          clipper: MyHalfCircle(mySidetoDraw: MyCustomCircleSideToDraw.right),
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
