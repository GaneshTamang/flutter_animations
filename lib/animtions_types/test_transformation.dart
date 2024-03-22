// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class TestTransformation extends StatefulWidget {
  const TestTransformation({super.key});

  @override
  State<TestTransformation> createState() => _TestTransformationState();
}

class _TestTransformationState extends State<TestTransformation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );
    _animation = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceInOut,
      ),
    );
    _animation.addListener(() {
      print("value :${_animation.value}");
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller
      ..reset()
      ..reverse();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/sky.webp'), fit: BoxFit.cover),
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                bottom: _controller.value * 1,
                left: _controller.value * 100,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.only(
                    //   topLeft: Radius.circular(15),
                    //   topRight: Radius.circular(15),
                    // ),
                    image: DecorationImage(
                      image: AssetImage(
                        'images/colz.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(18, -15),
                        blurRadius: 10,
                        spreadRadius: 12,
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class MyImageForAnimation extends StatelessWidget {
  const MyImageForAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      left: 100,
      child: Container(
        height: 250,
        width: 250,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          image: DecorationImage(
            image: AssetImage('images/colz.jpg'),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(5, 10),
              blurRadius: 10,
              spreadRadius: 12,
            )
          ],
        ),
      ),
    );
  }
}
