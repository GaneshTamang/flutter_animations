import 'package:flutter/material.dart';
import 'dart:math' as math;

Color _getRandomColor() => Color(
      0xFF000000 + math.Random().nextInt(0x00FFFFFF),
    );

class MyClipPathAndColorTweenAnimationExample6 extends StatefulWidget {
  const MyClipPathAndColorTweenAnimationExample6({super.key});

  @override
  State<MyClipPathAndColorTweenAnimationExample6> createState() =>
      _MyClipPathAndColorTweenAnimationExample6State();
}

class _MyClipPathAndColorTweenAnimationExample6State
    extends State<MyClipPathAndColorTweenAnimationExample6> {
  Color _color = _getRandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipPath(
          // ! this is the custom clipper we created
          clipper: MyCustomCircleClippers(),
          child: TweenAnimationBuilder(
            tween: ColorTween(
              begin: _getRandomColor(),
              end: _color,
            ),
            // ! on End  it will set prev end value to begibibg and we set new end value

            onEnd: () {
              setState(() {
                _color = _getRandomColor();
              });
            },
            duration: const Duration(seconds: 1),
            builder: (context, Color? colorForbuilder, childOfBuilder) {
              return ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    colorForbuilder!,
                    BlendMode.srcATop,
                  ),
                  child: childOfBuilder!);
            },
            child: Container(
              color: Colors.redAccent,
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomCircleClippers extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path pathDrawn = Path();
// !canvas to drawCircle
    final Rect drawRectFromCircleCenter = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 3,
    );
// ! add oval with rectangle and fill
    pathDrawn.addOval(drawRectFromCircleCenter);
    return pathDrawn;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // ! should reclipe on size change ? we say false

    return false;
  }
}
