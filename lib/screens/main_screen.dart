import 'package:flutter/material.dart';
import 'package:flutter_animations/animtions_types_exmples/three_d_animations_example3.dart';
import 'package:flutter_animations/animtions_types_exmples/animated_container_example.dart';
import 'package:flutter_animations/animtions_types_exmples/example2.dart';
import 'package:flutter_animations/animtions_types_exmples/test_transformation.dart';
import 'package:flutter_animations/animtions_types_exmples/transform_animation_example1.dart';
import 'package:flutter_animations/custom_widgets/custom_naviagtion_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: const [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MCMaterialButton(
              buttonNAme: "MyTestTansformations",
              pageClass: TestTransformation(),
            ),
            MCMaterialButton(
              buttonNAme: 'AnimatedContainer',
              pageClass: MCAnimatedContainerExample(),
            ),
            MCMaterialButton(
              buttonNAme: 'Transform Example1',
              pageClass: MCTransformAnimationExample1(),
            ),
            MCMaterialButton(
              buttonNAme: 'Clipper Example2',
              pageClass: Example2(),
            ),
            MCMaterialButton(
              buttonNAme: '3d animation ',
              pageClass: ThreeDAnimationExample3(),
            ),
          ],
        ),
      ]),
    );
  }
}
