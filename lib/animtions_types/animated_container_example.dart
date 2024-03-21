import 'package:flutter/material.dart';

class MCAnimatedContainerExample extends StatefulWidget {
  const MCAnimatedContainerExample({super.key});

  @override
  State<MCAnimatedContainerExample> createState() =>
      _MCAnimatedContainerExampleState();
}

class _MCAnimatedContainerExampleState
    extends State<MCAnimatedContainerExample> {
  double _width = 200.0;
  Color _color = Colors.blue;

  void _changeSizeAndColor() {
    setState(() {
      _width = _width == 200.0 ? 300.0 : 200.0;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: Center(
        // !implicit animation
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut, // Adjust timing curve as needed
          width: _width,
          // height: _height, // Add height animation if needed
          color: _color,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Container animates size and color.',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeSizeAndColor,
        child: const Icon(Icons.transform),
      ),
    );
  }
}
