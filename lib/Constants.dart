import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const Color primaryColor = Colors.indigo;
  static const Color backgroundColor = Colors.white;

  static final TextStyle titleTextStyle = GoogleFonts.lato(
    color: primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle titleTextStyle1 = GoogleFonts.lato(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const double minSliderValue = 0;
  static const double maxSliderValue = 60;

  static const EdgeInsets defaultPadding =
  EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0);

  // static BoxDecoration containerDecoration(String imagePath, Color color) {
  //   return BoxDecoration(
  //     borderRadius: BorderRadius.circular(15),
  //     color: color,
  //     image: DecorationImage(
  //       image: AssetImage(imagePath),
  //     ),
  //   );
  // }
}
