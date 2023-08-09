import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import '../navigation_bar/HomePage.dart';

class SIPCalculatorScreen extends StatefulWidget {
  const SIPCalculatorScreen({super.key});

  @override
  _SIPCalculatorScreenState createState() => _SIPCalculatorScreenState();
}

class _SIPCalculatorScreenState extends State<SIPCalculatorScreen> {
  double monthlyInvestment = 5000;
  int sipDuration = 10;
  double expectedReturns = 12; // In percentage

  double totalInvestment = 0;
  double totalReturns = 0;

  @override
  void initState() {
    super.initState();
    calculateSIP(); // Calculate the initial values
  }

  void calculateSIP() {
    totalInvestment = monthlyInvestment * sipDuration * 12;
    double interestRate = expectedReturns / 100;
    double futureValue = totalInvestment * pow(1 + interestRate, sipDuration);
    totalReturns = futureValue - totalInvestment;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: const Center(
          child: Text('SIP Calculator', style: TextStyle(color: Colors.white)),
        ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Investment',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.lato().fontFamily,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '₹ ${totalInvestment.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.lato().fontFamily,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gain',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF27A4C0),
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.lato().fontFamily,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '₹ ${totalReturns.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.lato().fontFamily,
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
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.indigo[800],
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.lato().fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Slider(
                  value: monthlyInvestment,
                  onChanged: (newValue) {
                    setState(() {
                      monthlyInvestment = newValue;
                      calculateSIP(); // Automatically recalculate and update the UI
                    });
                  },
                  activeColor: Colors.indigo,
                  min: 1000,
                  max: 10000,
                  label: '\₹ ${monthlyInvestment.toStringAsFixed(2)}',
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
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.indigo[800],
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
                          calculateSIP();
                        });
                      },
                      activeColor: Colors.indigo,
                      min: 1,
                      max: 30,
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
                                '$expectedReturns %',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.indigo[800],
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
                Slider(
                  value: expectedReturns,
                  onChanged: (newValue) {
                    setState(() {
                      expectedReturns = newValue;
                      calculateSIP();
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
        ],
      ),
    );
  }
}
