import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sip_planner/Constants.dart';

class DreamCarPlanning extends StatefulWidget {
  const DreamCarPlanning({super.key});

  @override
  State<DreamCarPlanning> createState() => _DreamCarPlanningState();
}

class _DreamCarPlanningState extends State<DreamCarPlanning> {
  double _currentValue = 0;
  double _currentValue2 = 100;
  double _currentValue3 = 0;

  double currentCostOfHigherEducation = 100000;

  String calculateFutureCost() {
    double inflationRate =
        _currentValue3 / 100; // Convert percentage to decimal
    double numberOfYears = _currentValue;
    double presentCostOfDreamHouse = _currentValue2;

    void showInvalidInputAlert(BuildContext context, String message) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Invalid Input",
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              message,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
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
    }

    if (numberOfYears <= 0 && inflationRate <= 0) {
      showInvalidInputAlert(
        context,
        "Number of Years and InflationRate should be greater than 0.",
      );
    } else if (numberOfYears <= 0) {
      showInvalidInputAlert(
        context,
        "Please ensure Number of Years is greater than 0.",
      );
    } else if (inflationRate <= 0) {
      showInvalidInputAlert(
        context,
        "Please ensure InflationRate is greater than 0.",
      );
    }
    double futureCost =
        presentCostOfDreamHouse * pow(1 + inflationRate, numberOfYears);
    int futureCostInt = futureCost.toInt();
    String formattedFutureCost =
        NumberFormat.decimalPattern().format(futureCostInt);
    return formattedFutureCost;
  }

  String _calculatedResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Dream Car Planning"),
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
                  height: 5.0,
                ),
                Image.asset(
                  "assets/images/car-remove.png",
                  fit: BoxFit.cover,
                  height: 170,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: Constants.defaultPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "How many years from now you want to drive car? ",
                        style: Constants.titleTextStyle1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Years : ${_currentValue.toInt()} ",
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
                      Text(
                        "Cost of your Dream Car today? ",
                        style: Constants.titleTextStyle1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Amount  :  ₹ ${_currentValue2.toInt()} ",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                      ),
                      Slider(
                          value: _currentValue2,
                          activeColor: Colors.indigo,
                          min: 100,
                          max: 1500000,
                          onChanged: (value) {
                            setState(() {
                              _currentValue2 = value;
                            });
                          }),
                      const SizedBox(height: 20.0),
                      Text(
                        "Assumed inflation in your Dream Car cost ",
                        style: Constants.titleTextStyle1,
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
                      ElevatedButton(
                        child: Text(
                          "Calculate",
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.indigo),
                        onPressed: () {
                          try {
                            String futureCostInt = calculateFutureCost();
                            String result =
                                // "Future Cost of Dream House:" " $futureCost ";
                                'Future Cost of Dream House: ₹ ${futureCostInt}';
                            setState(() {
                              _calculatedResult = result;
                            });
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Error !",
                                      style: TextStyle(color: Colors.red)),
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
                      const SizedBox(height: 10),
                      // Display calculated result at the bottom of the screen
                      Center(
                        child: Text(
                          _calculatedResult,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
