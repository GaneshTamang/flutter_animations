import 'package:flutter/material.dart';
import 'package:flutter_animations/ani_implicit_animations/container_aniamtions_example5.dart';
import 'package:flutter_animations/ani_implicit_animations/custom_clipper_clippath_color_tween_example6.dart';
import 'package:flutter_animations/anim_type_explicit/custom_painter_example7.dart';
import 'package:flutter_animations/anim_type_explicit/hero_animation_hero_example4.dart';
import 'package:flutter_animations/anim_type_explicit/three_d_animations_example3.dart';
import 'package:flutter_animations/anim_type_explicit/_transom_flip_example2.dart';
import 'package:flutter_animations/anim_type_explicit/test_transformation.dart';
import 'package:flutter_animations/anim_type_explicit/transform_animation_example1.dart';
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
              buttonNAme: "My Test Tansformations",
              pageClass: TestTransformation(),
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
              buttonNAme: '3d box animation example 3 ',
              pageClass: ThreeDAnimationExample3(),
            ),
            MCMaterialButton(
              buttonNAme: 'hero Explicit Animation example 4 ',
              pageClass: HeroAnimationExample4(),
            ),
            MCMaterialButton(
              buttonNAme: 'Custom painter and  Animation example 7 ',
              pageClass: MyCustomPainterExample7(),
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
            buttonNAme: 'implicit Container example 5 ',
            pageClass: MYIMplicitContainerExample5(),
          ),
          MCMaterialButton(
            buttonNAme: "Color Tween Animation exampple6",
            pageClass: MyClipPathAndColorTweenAnimationExample6(),
          ),
        ],
      ),
    );
  }
}
