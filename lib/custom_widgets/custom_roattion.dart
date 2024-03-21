import 'dart:math';

import 'package:flutter/material.dart';

class CustomRoatatingContainer extends StatefulWidget {
  const CustomRoatatingContainer({super.key});

  @override
  State<CustomRoatatingContainer> createState() =>
      _CustomRoatatingContainerState();
}

class _CustomRoatatingContainerState extends State<CustomRoatatingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _aniamtion;
  // ! initizlization for animations
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 5,
        ));
    _aniamtion = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
    _controller.repeat();
    super.initState();
  }

  @override
  // ! dispose after controller  is exited
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: ((context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..rotateZ(_aniamtion.value),
            child: Container(
              height: 200,
              width: 300,
              color: Colors.black,
            ),
          );
        }));
  }
}
