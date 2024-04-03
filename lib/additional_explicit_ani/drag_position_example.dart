import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DraggExample extends StatefulWidget {
  const DraggExample({super.key});

  @override
  State<DraggExample> createState() => _DraggExampleState();
}

class _DraggExampleState extends State<DraggExample> {
  late Offset _initialPositon;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initialPositon = calculateCenterPosition(context);
  }

  Offset calculateCenterPosition(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    const double imageWidth = 200; // Width of your image
    const double imageHeight = 200; // Height of your image
    return Offset(
        screenWidth / 2 - imageWidth / 2, screenHeight / 2 - imageHeight / 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onPanStart: (details) {
                _initialPositon = calculateCenterPosition(context);
              },
              onPanUpdate: (details) {
                final double deltaX = details.delta.dx;
                final double deltaY = details.delta.dy;
                setState(() {
                  _initialPositon += Offset(deltaX, deltaY);
                });
              },
              child: Stack(
                children: [
                  Positioned(
                    left: _initialPositon.dx,
                    top: _initialPositon.dy,
                    child: const SizedBox(
                      width: 200,
                      height: 200,
                      child: Image(
                        image: AssetImage('images/mountain.webp'),
                      ),
                    ),
                  ),
                  Positioned(
                    left: _initialPositon.dx + 20,
                    top: _initialPositon.dy + 30,
                    child: const SizedBox(
                      width: 200,
                      height: 200,
                      child: Image(
                        image: AssetImage('images/sky.webp'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
