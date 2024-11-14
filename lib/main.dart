import 'package:flutter/material.dart';
import 'calculator_page.dart'; // Import de la page principale

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculatrice Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(), // Affiche la page de la calculatrice
    );
  }
}
