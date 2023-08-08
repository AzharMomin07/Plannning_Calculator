import 'package:flutter/cupertino.dart';
import 'package:sip_planner/navigation_bar/HomePage.dart';
import 'package:sip_planner/smart_calculator/DreamHousePlanning.dart';
import 'package:sip_planner/smart_calculator/RetirementPlanning.dart';
import 'package:sip_planner/smart_calculator/SipOMeter.dart';
import '../smart_calculator/ChildEducationPlanning.dart';
import '../smart_calculator/DreamCarPlanning.dart';
import '../smart_calculator/DreamVacationPlanning.dart';

final Map<String, WidgetBuilder> routing = {
  'home_page': (context) => const HomePage(),
  'DreamCarPlanning': (context) => const DreamCarPlanning(),
  'ChildEducationPlanning': (context) => const ChildEducation(),
  'SIP': (context) => const SIPCalculatorScreen(),
  'DreamHousePlanning': (context) => const DreamHousePlanning(),
  'DreamVacationPlanning': (context) => const DreamVacationPlanning(),
  'RetirementPlanning': (context) => const Retirement(),
};
