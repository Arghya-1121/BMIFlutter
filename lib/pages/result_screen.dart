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
    double minBMI = 10;
    double maxBMI = 40;
    double arrowPosition = ((bmi - minBMI) / (maxBMI - minBMI)).clamp(0.0, 1.0);
    final Text comment;
    if (bmi < 18.5) {
      comment = Text(
        'Under Weight!',
        style: TextStyle(
          fontSize: 23,
          color: Colors.blueAccent,
          fontWeight: FontWeight.w700,
        ),
      );
    } else if (bmi < 24.9) {
      comment = Text(
        'Normal!',
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Colors.green,
        ),
      );
    } else if (bmi < 29.9) {
      comment = Text(
        'Over Weight!',
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Colors.yellow.shade700,
        ),
      );
    } else if (bmi < 34.9) {
      comment = Text(
        'Obese!',
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Colors.deepOrangeAccent,
        ),
      );
    } else {
      comment = Text(
        'Extremely Obese!',
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: Colors.red,
        ),
      );
    }
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
          children: [
            Text(
              'Your BMI is: ${bmi.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),

            SizedBox(height: 30),

            Text(
              'You are',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
            ),

            comment,

            SizedBox(height: 30),
            //needs to understand!
            Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                padding: EdgeInsets.only(left:10,right:10),
                width: 300,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue, // Underweight
                      Colors.green, // Normal
                      Colors.yellow, // Overweight
                      Colors.red, // Obese
                    ],
                    stops: [0.25, 0.50, 0.75, 1.0],
                  ),
                ),
              ),
              Positioned(
                left: arrowPosition * 280, // Adjust position within scale
                top: -10,
                child: Icon(Icons.arrow_drop_up_sharp, size: 40, color: Colors.black),
              ),
            ],
          ),

          ],
        ),
      ),
    );
  }
}
