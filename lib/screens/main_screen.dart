import 'package:flutter/material.dart';
import 'package:flutter_animations/animation_types_example/hero_animation_hero_example4.dart';
import 'package:flutter_animations/animation_types_example/three_d_animations_example3.dart';
import 'package:flutter_animations/animation_types_example/animated_container_example0.dart';
import 'package:flutter_animations/animation_types_example/example2.dart';
import 'package:flutter_animations/animation_types_example/test_transformation.dart';
import 'package:flutter_animations/animation_types_example/transform_animation_example1.dart';
import 'package:flutter_animations/custom_widgets/custom_naviagtion_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MCMaterialButton(
              buttonNAme: "Explcit Animations",
              pageClass: MyExplicitAniMations(),
            ),
            MCMaterialButton(
              buttonNAme: 'ImplicitAnimations',
              pageClass: MyImplicitAnimations(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyExplicitAniMations extends StatelessWidget {
  const MyExplicitAniMations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: const [
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
            MCMaterialButton(
              buttonNAme: 'Explicit customAnimation ',
              pageClass: HeroAnimationExample4(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyImplicitAnimations extends StatelessWidget {
  const MyImplicitAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MCMaterialButton(
            buttonNAme: 'Explicit customAnimation ',
            pageClass: MyImplicitAnimations(),
          ),
        ],
      ),
    );
  }
}
