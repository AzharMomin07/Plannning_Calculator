import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'HomePage.dart';

class SIPCalculatorScreen extends StatefulWidget {
  const SIPCalculatorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SIPCalculatorScreenState createState() => _SIPCalculatorScreenState();
}

class _SIPCalculatorScreenState extends State<SIPCalculatorScreen> {
// Default values for the SIP calculator
  double monthlyInvestment = 5000;
  int sipDuration = 10;
  double expectedReturns = 12; // In percentage

// Variables to hold the calculated values
  double totalInvestment = 0;
  double totalReturns = 0;
  @override
  void initState() {
    super.initState();
    calculateSIP(); // Calculate the initial values
  }
// Function to calculate SIP values
  void calculateSIP() {
    totalInvestment = monthlyInvestment * sipDuration * 12;
    double interestRate = expectedReturns / 100;
    double futureValue = totalInvestment * pow(1 + interestRate, sipDuration);
    totalReturns = futureValue - totalInvestment;

// Update the pie chart with the new data
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            } // Navigate back to the previous screen
            ),
        title:
            const Text('SIP Calculator', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Card(
            color: Colors.grey[100],
            elevation: 15.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            shadowColor: Colors.cyan,
// Change the shadow color to your desired color
            margin: const EdgeInsets.all(10.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              value: totalInvestment,
                              title: ' ',
                              color: const Color(0xFF272DC0),
                              showTitle: true,
                            ),
                            PieChartSectionData(
                              value: totalReturns,
                              title: ' ',
                              color: const Color(0xFF27A4C0),
                              showTitle: true,
                            ),
                          ],
                          centerSpaceRadius: 60,
                        ),
                      ),
                    ),
                  ),

// Display principal and returns below the names

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Principal:',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹${totalInvestment.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Returns:',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF27A4C0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '₹${totalReturns.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Monthly Investment: ₹${monthlyInvestment.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Positioned(
                  right: 20,
                  child: Slider(
                    value: monthlyInvestment,
                    onChanged: (newValue) {
                      setState(() {
                        monthlyInvestment = newValue;
                      });
                    },
                    activeColor: Colors.indigo,
                    min: 1000,
                    max: 10000,
// divisions: 18,
                    label: '\₹${monthlyInvestment.toStringAsFixed(2)}',
                  ),
                ),
                Text(
                  'SIP Duration: $sipDuration years',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Slider(
                  value: sipDuration.toDouble(),
                  onChanged: (newValue) {
                    setState(() {
                      sipDuration = newValue.toInt();
                    });
                  },
                  activeColor: Colors.indigo,
                  min: 1,
                  max: 30,
// divisions: 29,
                  label: '$sipDuration years',
                ),
                Text(
                  'Expected Returns: $expectedReturns%',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Slider(
                  value: expectedReturns,
                  onChanged: (newValue) {
                    setState(() {
                      expectedReturns = newValue;
                    });
                  },
                  activeColor: Colors.indigo,
                  min: 5,
                  max: 20,
                  divisions: 15,
                  label: '$expectedReturns%',
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: calculateSIP,
                style:
                TextButton.styleFrom(backgroundColor: Colors.indigo),
                child: const Text('Calculate'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
