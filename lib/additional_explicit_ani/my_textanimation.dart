// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class MyTextAnimation extends StatefulWidget {
  const MyTextAnimation({super.key});

  @override
  State<MyTextAnimation> createState() => _MyTextAnimationState();
}

class _MyTextAnimationState extends State<MyTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  String myName = "GANESH TAMANG_";
  late List<String> splittedText;

  List<String> splitText() {
    List<String> myStringArray = myName.split('');

    return myStringArray;
  }

  String currentText = "";

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    splittedText = splitText();
    _animation = IntTween(begin: 0, end: splittedText.length - 1)
        .animate(_animationController);
    _animationController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(
          const Duration(seconds: 2),
        );
        _animationController.reverse();
      }
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  int count = 0;
  @override
  Widget build(BuildContext context) {
    _animationController.forward();

    // print(myAnimationStyle());
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  int index = _animation.value.toInt();
                  count = ++count;
                  // ! here sublist is used to filter the  elements then join the  elements as string
                  currentText = splittedText.sublist(0, index + 1).join();
                  // print(
                  //     "called  controller:\n ${_animation.value} \n count :$count");
                  return Text(
                    currentText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 70,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 174, 190, 197),
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const Center(
                child: Text(
                  'Hello World!!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Color.fromARGB(255, 53, 60, 63),
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
