import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sip_planner/navigation_bar/HomePage.dart';

class Retirement extends StatefulWidget {
  const Retirement({Key? key}) : super(key: key);

  @override
  State<Retirement> createState() => _RetirementState();
}

class _RetirementState extends State<Retirement> {
  int presentAge = 30;
  int retirementAge = 60;
  int lifeExpectancy = 85;
  double currentMonthlyExpense = 5000;
  double assumedInflation = 0.03;
  double assumedReturns = 0.07;
  double retirementSavingsNeeded = 0.0;
  double monthlyInvestment = 0.0;
  double totalReturns = 0.0;

  @override
  void initState() {
    super.initState();
    calculateRetirementSavingsNeeded();
  }

  void calculateRetirementSavingsNeeded() {
    if (presentAge >= retirementAge) {
// Present age is greater than or equal to retirement age
// Handle this case, e.g., show an error message or set the retirementSavingsNeeded to 0.
      retirementSavingsNeeded = 0.0;
      monthlyInvestment = 0.0;
      totalReturns = 0.0;
    } else if (retirementAge <= presentAge) {
      retirementSavingsNeeded = 0.0;
      monthlyInvestment = 0.0;
      totalReturns = 0.0;
    } else {
      final yearsToRetirement = retirementAge - presentAge;
      final yearsInRetirement = lifeExpectancy - retirementAge;
      final monthlyExpenseInflation =
          pow(1 + assumedInflation, yearsToRetirement) * currentMonthlyExpense;
      final futureValueOfExpenses = monthlyExpenseInflation *
          ((pow(1 + assumedInflation, yearsInRetirement) - 1) /
              assumedInflation);
      retirementSavingsNeeded =
          futureValueOfExpenses / pow(1 + assumedReturns, yearsToRetirement);
// Calculate the monthly investment needed to achieve retirement savings goal
      monthlyInvestment = retirementSavingsNeeded / (yearsToRetirement * 12);
// Calculate the total returns using the expected returns
      totalReturns = (monthlyInvestment * yearsToRetirement * 12) *
          pow(1 + assumedReturns, yearsToRetirement);
    }
  }

  void showAgeMismatchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Info!'),
          content: Text('Present age cannot be greater than retirement age.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showRetirementMismatchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Info!'),
          content: Text('Retirement age cannot be less than present age.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showLifeExpectancyMismatchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Info!'),
          content: Text('Life expectancy cannot be less than retirement age!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
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
          },
        ),
        title: Text('Retirement Calculator',
            style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 1),
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
                      child: _buildPieChart(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Monthly investment',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.lato().fontFamily,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '₹${monthlyInvestment.toStringAsFixed(2)}',
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
                            'Total',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.lato().fontFamily,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '₹${totalReturns.toStringAsFixed(2)}',
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
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Present Age:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.lato().fontFamily,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 90,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Center(
                          child: Text(
                            '$presentAge years',
                            style: TextStyle(
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
                Slider(
                  value: presentAge.toDouble(),
                  onChanged: (newValue) {
                    if (newValue > retirementAge) {
                      showAgeMismatchDialog(context);
                    } else {
                      setState(() {
                        presentAge = newValue.toInt();
                      });
                    }
                  },
                  min: 1,
                  max: 100,
                  activeColor: Colors.indigo,
                  label: '$presentAge years',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Retirement Age:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Center(
                          child: Text(
                            ' $retirementAge years',
                            style: TextStyle(
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
                Slider(
                  value: retirementAge.toDouble(),
                  onChanged: (newValue) {
                    if (newValue < presentAge) {
                      showRetirementMismatchDialog(context);
                    } else {
                      setState(() {
                        retirementAge = newValue.toInt();
                      });
                    }
                  },
                  activeColor: Colors.indigo,
                  min: 1,
                  max: 100,
                  label: '$retirementAge years',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Life Expectancy: ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 100,
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            ' $lifeExpectancy years',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.lightBlue[800],
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.lato().fontFamily,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Slider(
                  value: lifeExpectancy.toDouble(),
                  onChanged: (newValue) {
                    if (newValue < retirementAge) {
                      showLifeExpectancyMismatchDialog(context);
                    } else {
                      setState(() {
                        lifeExpectancy = newValue.toInt();
                      });
                    }
                  },
                  activeColor: Colors.indigo,
                  min: 1,
                  max: 120,
                  label: '$lifeExpectancy years',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Current Monthly Expense:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            ' ₹${currentMonthlyExpense.toStringAsFixed(2)}',
                            style: TextStyle(
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
                Slider(
                  value: currentMonthlyExpense,
                  onChanged: (newValue) {
                    setState(() {
                      currentMonthlyExpense = newValue;
                    });
                  },
                  activeColor: Colors.indigo,
                  min: 1000,
                  max: 50000,
                  divisions: 50,
                  label: '₹${currentMonthlyExpense.toStringAsFixed(2)}',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Assumed Inflation: ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 90,
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            '${(assumedInflation * 100).toStringAsFixed(2)}%',
                            style: TextStyle(
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
                Slider(
                  value: assumedInflation * 100,
                  onChanged: (newValue) {
                    setState(() {
                      assumedInflation = newValue / 100;
                    });
                  },
                  activeColor: Colors.indigo,
                  min: 0,
                  max: 10,
                  divisions: 100,
                  label: '${(assumedInflation * 100).toStringAsFixed(2)}%',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Assumed Returns:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: 90,
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            '${(assumedReturns * 100).toStringAsFixed(2)}%',
                            style: TextStyle(
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
                Slider(
                  value: assumedReturns * 100,
                  onChanged: (newValue) {
                    setState(() {
                      assumedReturns = newValue / 100;
                    });
                  },
                  activeColor: Colors.indigo,
                  min: 0,
                  max: 20,
                  divisions: 100,
                  label: '${(assumedReturns * 100).toStringAsFixed(2)}%',
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  calculateRetirementSavingsNeeded();
                  setState(() {});
                },
                child: const Text('Calculate'),
                style: TextButton.styleFrom(backgroundColor: Colors.indigo),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: totalReturns -
                (monthlyInvestment * (retirementAge - presentAge) * 12),
            title: '',
            color: const Color(0xFF272DC0),
            showTitle: true,
          ),
          PieChartSectionData(
            value: monthlyInvestment * (retirementAge - presentAge) * 12,
            title: '',
            color: const Color(0xFF27A4C0),
            showTitle: true,
          ),
        ],
        centerSpaceRadius: 60,
      ),
    );
  }
}
