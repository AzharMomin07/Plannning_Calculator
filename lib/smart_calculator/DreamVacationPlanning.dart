import 'dart:math'; // Import the math library for pow function
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DreamVacationPlanning extends StatefulWidget {
  const DreamVacationPlanning({super.key});

  @override
  State<DreamVacationPlanning> createState() => _DreamHousePlanningState();
}

class _DreamHousePlanningState extends State<DreamVacationPlanning> {
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
        backgroundColor: Colors.indigo,
        title: const Text("Dream Vacation Planning"),
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
                // Text(
                //   "Dream House Planning",
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                // ),
                const SizedBox(
                  height: 10.0,
                ),
                Image.asset(
                  "assets/images/vacation.png",
                  fit: BoxFit.cover,
                  height: 200,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "After how many years from now, you plan to go for your Dream Vacation?",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
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
                        "How much is the present cost of your Dream Vacation",
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
                          max: 1500000,
                          onChanged: (value) {
                            setState(() {
                              _currentValue2 = value;
                            });
                          }),
                      const SizedBox(height: 20.0),
                      const Text(
                        "Assumed Inflation in Dream Vacation cost",
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
        ),
      ),
    );
  }
}
