import 'package:flutter/material.dart';
import 'package:flutter_animations/custom_widgets/app_bar.dart';

class MCTransformAnimationExample extends StatefulWidget {
  const MCTransformAnimationExample({super.key});

  @override
  State<MCTransformAnimationExample> createState() =>
      _MCTransformAnimationExampleState();
}

class _MCTransformAnimationExampleState
    extends State<MCTransformAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MCAppBAr(appBarTitle: "appBarTitle"),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF4B371C),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
