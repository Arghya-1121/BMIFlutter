import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double feet;
  final double inches;
  final double weight;

  const ResultScreen(
      {super.key,
      required this.feet,
      required this.inches,
      required this.weight});
  @override
  Widget build(BuildContext context) {
    double bmi = (weight /
        (((feet * 0.3048) + (inches * 0.0254)) *
            ((feet * 0.3048) + (inches * 0.0254))));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your BMI!',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        elevation: 10,
        centerTitle: true,
        shadowColor: Colors.blue.shade400,
        backgroundColor: Colors.blue.shade600,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            Text(
              'Your BMI is: ${bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ),
    );
  }
}
