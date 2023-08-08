import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class DreamCarPlanning extends StatefulWidget {
  const DreamCarPlanning({super.key});

  @override
  State<DreamCarPlanning> createState() => _DreamCarPlanningState();
}

class _DreamCarPlanningState extends State<DreamCarPlanning> {
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
    double futureCost =
        presentCostOfDreamHouse * pow(1 + inflationRate, numberOfYears);
    String formattedFutureCost =
        NumberFormat.decimalPattern().format(futureCost);
    return formattedFutureCost;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Dream Car Planning"),
        // Back button leading to navigate back
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        child: Material(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Image.asset(
                  "assets/images/car-remove.png",
                  fit: BoxFit.cover,
                  height: 200,
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "How many years from now you want to drive car? ",
                        style: GoogleFonts.lato(
                            fontSize: 16, fontWeight: FontWeight.bold),
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
                        "Cost of your Dream Car today? ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
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
                          // inactiveColor: Colors.grey,
                          min: 100,
                          max: 10000000,
                          onChanged: (value) {
                            setState(() {
                              _currentValue2 = value;
                            });
                          }),
                      const SizedBox(height: 20.0),
                      const Text(
                        "Assumed inflation on your Dream Car cost ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
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
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.indigo),
                        onPressed: () {
                          try {
                            String futureCost = calculateFutureCost();
                            String result =
                                "Future Cost of Dream Car: $futureCost RS";
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
                      // Text(
                      //   "Calculated Data:",
                      //   style: TextStyle(
                      //       fontSize: 17,
                      //       color: Colors.red,
                      //       fontWeight: FontWeight.bold),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
