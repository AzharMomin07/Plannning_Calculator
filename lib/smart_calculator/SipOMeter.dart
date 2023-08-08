import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sip_planner/navigation_bar/HomePage.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: ListView(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Monthly Investment:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.lato().fontFamily,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 115,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Center(
                          child: Text(
                            '₹${monthlyInvestment.toStringAsFixed(2)}',
                            style:  TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.lato().fontFamily,
                                color: Colors.lightBlue[800]
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15), // Add some spacing between the rows
                Slider(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SIP Duration:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.lato().fontFamily,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 90,
                          child: Card(
                            color: Colors.white,
                            elevation: 5,
                            child: Center(
                              child: Text(
                                '$sipDuration years',
                                style:  TextStyle(
                                  fontSize: 18,
                                  color: Colors.lightBlue[800],
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.lato().fontFamily,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Expected Returns',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.lato().fontFamily,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: 70,
                          child: Card(
                            color: Colors.white,
                            elevation: 5,
                            child: Center(
                              child: Text(
                                '$expectedReturns%',
                                style:  TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: GoogleFonts.lato().fontFamily,
                                    color: Colors.lightBlue[800]
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
                Center(
                  child: ElevatedButton(
                    onPressed: calculateSIP,
                    child: const Text('Calculate'),
                    style: TextButton.styleFrom(backgroundColor: Colors.indigo),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
