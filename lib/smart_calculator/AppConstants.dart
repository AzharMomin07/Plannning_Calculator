import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  // Font Families
  static TextStyle latoFont(
      double fontSize, FontWeight fontWeight, Color color) {
    return GoogleFonts.lato(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  // Font Sizes
  static const double smallFontSize = 12.0;
  static const double mediumFontSize = 16.0;
  static const double largeFontSize = 20.0;

  // Font Weights
  static const FontWeight lightFontWeight = FontWeight.w300;
  static const FontWeight regularFontWeight = FontWeight.w400;
  static const FontWeight boldFontWeight = FontWeight.w700;

  // Colors
  static const Color primaryColor = Colors.blue;
  static const Color secondaryColor = Colors.green;
  static const Color accentColor = Colors.orange;
}
