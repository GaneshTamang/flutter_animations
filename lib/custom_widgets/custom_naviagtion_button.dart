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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        child: MaterialButton(
          color: Colors.blueAccent,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => pageClass,
                ));
          },
          child: Text(buttonNAme),
        ),
      ),
    );
  }
}
