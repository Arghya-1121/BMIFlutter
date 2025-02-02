import 'package:bmi/pages/result_screen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<StatefulWidget> createState() => _IntroScreen();
}

class _IntroScreen extends State<StatefulWidget> {
  // ✅ Make controllers non-nullable
  TextEditingController heightControllerFt = TextEditingController();
  TextEditingController heightControllerIn = TextEditingController();
  TextEditingController weightControllerKg = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
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
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text(
                'Enter Your Height',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: heightControllerFt,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Height in Feet',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: heightControllerIn,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Height in Inches',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Enter Your Weight',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  controller: weightControllerKg,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Weight in Kilograms',
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    hoverColor: Colors.blue,
                  ),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // ✅ Debugging: Print actual values
                  print(
                      'Height (ft): ${heightControllerFt.text}, Height (in): ${heightControllerIn.text}, Weight (kg): ${weightControllerKg.text}');

                  // ✅ Check if text fields are not empty
                  if (heightControllerFt.text.isNotEmpty &&
                      heightControllerIn.text.isNotEmpty &&
                      weightControllerKg.text.isNotEmpty) {
                    // ✅ Correct parsing to double
                    double heightft = double.parse(heightControllerFt.text);
                    double heightin = double.parse(heightControllerIn.text);
                    double weightkg = double.parse(weightControllerKg.text);

                    // ✅ Navigate correctly
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          feet: heightft,
                          inches: heightin,
                          weight: weightkg,
                        ),
                      ),
                    );
                  } else {
                    // Show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Please enter all the values correctly!',
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      );
}
