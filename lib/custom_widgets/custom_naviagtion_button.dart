import 'package:flutter/material.dart';

class MCMaterialButton extends StatelessWidget {
  final String buttonNAme;
  // final Function()? actionOnButtonPress;
  final Widget pageClass;
  const MCMaterialButton({
    super.key,
    required this.buttonNAme,
    required this.pageClass,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
      child: Material(
        // ! 100% opacity
        color: const Color(0x00000000),
        child: MaterialButton(
          color: Colors.blueAccent,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => pageClass,
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              buttonNAme,
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
