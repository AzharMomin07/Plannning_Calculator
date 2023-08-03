import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'HomePage.dart';

class ChildEducation extends StatefulWidget {
  const ChildEducation({super.key});

  @override
  State<ChildEducation> createState() => _ChildEducationState();
}

class _ChildEducationState extends State<ChildEducation> {
  double _currentValue = 0;
  double _currentValue2 = 100;
  double _currentValue3 = 0;

  // Assuming the current cost of higher education is 100,000 (for example)
  double currentCostOfHigherEducation = 100000;

  // Calculate the future cost based on the user's input
  String calculateFutureCost() {
    double inflationRate =
        _currentValue3 / 100; // Convert percentage to decimal
    double numberOfYears = _currentValue;
    double presentCostOfDreamHouse = _currentValue2;

    if (numberOfYears <= 0 ||
        presentCostOfDreamHouse <= 0 ||
        inflationRate <= 0) {
      throw Exception(
          "Invalid input. Please ensure all values are greater than 0.");
    }

    double futureCost = presentCostOfDreamHouse * pow(1 + inflationRate, numberOfYears);
    String formattedFutureCost = NumberFormat.decimalPattern().format(futureCost);
    return formattedFutureCost;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Child Education Planning"),
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Image.asset(
              "assets/images/educ.png",
              fit: BoxFit.cover,
              height: 200,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "How many years from now your child go for Higher Education?",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Years : ${_currentValue.toInt()}  YRS",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                  Slider(
                      value: _currentValue,
                      activeColor: Colors.indigo,
                      min: 0,
                      max: 60,
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                        });
                      }),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "How much money is required if your child has to go for Higher Education?",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Amount  : ${_currentValue2.toInt()}  RS",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                  Slider(
                      value: _currentValue2,
                      activeColor: Colors.indigo,
                      min: 100,
                      max: 50000,
                      onChanged: (value) {
                        setState(() {
                          _currentValue2 = value;
                        });
                      }),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Assumed Inflation in Higher Education cost",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Percent : ${_currentValue3.toInt()}  %",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                  Slider(
                      value: _currentValue3,
                      activeColor: Colors.indigo,
                      min: 0,
                      max: 50,
                      onChanged: (value) {
                        setState(() {
                          _currentValue3 = value;
                        });
                      }),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    child: Text(
                      "Calculate",
                    ),
                    style: TextButton.styleFrom(backgroundColor: Colors.indigo),
                    onPressed: () {
                      try {
                        String futureCost = calculateFutureCost();
                        String result =
                            "Future Cost of Dream House: $futureCost RS";
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Calculation Result"),
                              content: Text(result),
                              actions: [
                                TextButton(
                                  child: const Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Error"),
                              content: Text(e.toString()),
                              actions: [
                                TextButton(
                                  child: const Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
