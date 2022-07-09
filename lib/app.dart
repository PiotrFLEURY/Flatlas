import 'package:flatlas/presentation/pages/home.dart';
import 'package:flutter/material.dart';

class Flatlass extends StatelessWidget {
  const Flatlass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flatlas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
