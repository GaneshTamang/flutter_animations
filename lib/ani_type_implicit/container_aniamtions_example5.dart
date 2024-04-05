import 'package:flutter/material.dart';

class MYIMplicitContainerExample5 extends StatefulWidget {
  const MYIMplicitContainerExample5({super.key});

  @override
  State<MYIMplicitContainerExample5> createState() =>
      _MYIMplicitContainerExample5State();
}

class _MYIMplicitContainerExample5State
    extends State<MYIMplicitContainerExample5> {
  bool _isZoomedIn = false;
  final double _defaultWidth = 100;
  final Curve _zoomInCurve = Curves.bounceInOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 9,
            child: Center(
              child: AnimatedContainer(
                // !note most satisfying duration for animation is between 300-500
                duration: const Duration(milliseconds: 350),
                curve: _isZoomedIn ? _zoomInCurve : Curves.bounceOut,

                width: _isZoomedIn
                    ? MediaQuery.of(context).size.width
                    : _defaultWidth,
                child: Image.asset('images/mountain.webp'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
                onPressed: () {
                  setState(() {
                    _isZoomedIn = !_isZoomedIn;
                  });
                },
                child: Text(
                  _isZoomedIn ? "Zoom Out" : 'Zoom In',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
