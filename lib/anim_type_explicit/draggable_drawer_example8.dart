import 'package:flutter/material.dart';
import 'dart:math' show pi;

class MydraggableDrawer extends StatefulWidget {
  const MydraggableDrawer(
      {super.key, required this.childForScreen, required this.drawerWidget});
  final Widget childForScreen;
  final Widget drawerWidget;

  @override
  State<MydraggableDrawer> createState() => _MydraggableDrawerState();
}

class _MydraggableDrawerState extends State<MydraggableDrawer>
    with TickerProviderStateMixin {
  // ! widget animation
  late AnimationController _childWidgetRotationController;
  late Animation __childWidgetAnimation;
  // ! dragcontroller;
  late AnimationController _dragController;
  late Animation _draganimation;

  @override
  void initState() {
    // * widget controller
    _childWidgetRotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    __childWidgetAnimation = Tween<double>(begin: 0.0, end: -pi / 2)
        .animate(_childWidgetRotationController);

    // * drag controller

    _dragController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _draganimation =
        Tween<double>(begin: pi / 2.7, end: 0).animate(_dragController);
    super.initState();
  }

  @override
  void dispose() {
    _childWidgetRotationController.dispose();
    _dragController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double maxDrag = screenWidth * 0.8;
    return GestureDetector(
      /*
      * to calculate drag first calculate screen size with mediaquery
      * calculate the off set movement with details  with x movement or y divide by screen size for 0-1 value
      * here delta movement x due to horizontal is calculated
      * update contrroller value with calculated
      */
      onHorizontalDragUpdate: (details) {
        // ! offset movement in double
        final double dragDelta = details.delta.dx / maxDrag;
        _childWidgetRotationController.value =
            dragDelta + _childWidgetRotationController.value;
        _dragController.value = dragDelta + _dragController.value;
      },
      onHorizontalDragEnd: (details) {
        if (_childWidgetRotationController.value < 0.5) {
          _childWidgetRotationController.reverse();
          _dragController.reverse();
        } else {
          _childWidgetRotationController.forward();
          _dragController.forward();
        }
      },
      child: AnimatedBuilder(
        animation:
            Listenable.merge([_childWidgetRotationController, _dragController]),
        builder: (context, child) {
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFF1a1b26),
              ),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..translate(_childWidgetRotationController.value * maxDrag)
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(__childWidgetAnimation.value),
                child: widget.childForScreen,
              ),
              Transform(
                transform: Matrix4.identity()
                  ..translate(-screenWidth + _dragController.value * maxDrag)
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(_draganimation.value),
                alignment: Alignment.centerRight,
                child: widget.drawerWidget,
              )
            ],
          );
        },
      ),
    );
  }
}

class MyMainDragableDrawerScreen extends StatelessWidget {
  const MyMainDragableDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MydraggableDrawer(
        childForScreen: Scaffold(
          backgroundColor: const Color(0xff414868),
          appBar: AppBar(
            title: const Text('Main body'),
          ),
          body: const Center(child: Text('abc')),
        ),
        drawerWidget: Scaffold(
          body: Container(
            color: const Color(0xff414868),
            child: ListView.builder(
              itemCount: 20,
              padding: const EdgeInsets.only(top: 10, left: 100),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Item $index',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
