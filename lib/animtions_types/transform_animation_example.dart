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
    return Scaffold(
      appBar: const MCAppBAr(appBarTitle: "appBarTitle"),
      body: Container(),
    );
  }
}
