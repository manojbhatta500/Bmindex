import 'package:flutter/material.dart';
import 'package:bmindex/inputpage.dart';

void main() {
  runApp(Bmi_calculator());
}

class Bmi_calculator extends StatelessWidget {
  const Bmi_calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Inputpage(),
    );
  }
}
