import 'package:flutter/material.dart';
import 'package:flutter_animations/animtions_types/animated_container_example.dart';
import 'package:flutter_animations/animtions_types/transform_animation_example.dart';
import 'package:flutter_animations/custom_widgets/custom_naviagtion_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MCMaterialButton(
            buttonNAme: 'AnimatedContainer',
            pageClass: MCAnimatedContainerExample(),
          ),
          MCMaterialButton(
            buttonNAme: 'Transform ',
            pageClass: MCTransformAnimationExample(),
          ),
        ],
      ),
    );
  }
}
