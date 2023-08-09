import 'package:flutter/cupertino.dart';
import 'package:sip_planner/calculators/DreamCarPlanning.dart';
import 'package:sip_planner/navigation_bar/HomePage.dart';

import '../calculators/ChildEducationPlanning.dart';
import '../calculators/DreamHousePlanning.dart';
import '../calculators/DreamVacationPlanning.dart';
import '../calculators/RetirementPlanning.dart';
import '../calculators/Sip.dart';


final Map<String, WidgetBuilder> routing = {
  'HomePage': (context) => const HomePage(),
  'DreamCarPlanning': (context) => const DreamCarPlanning(),
  'ChildEducationPlanning': (context) => const ChildEducation(),
  'SIP': (context) => const SIPCalculatorScreen(),
  'DreamHousePlanning': (context) => const DreamHousePlanning(),
  'DreamVacationPlanning': (context) => const DreamVacationPlanning(),
  'RetirementPlanning': (context) => const Retirement(),
};
