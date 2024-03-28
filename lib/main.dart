import 'package:flutter/material.dart';
import 'package:flutter_animations/animation_types_example/implicit_aniamtions_example5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF696969),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 66, 65, 65),
          centerTitle: true,
        ),
      ),
      home: const MYIMplicitExample5(),
    );
  }
}
