import 'package:flutter/material.dart';
import 'package:imc/page/home-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
