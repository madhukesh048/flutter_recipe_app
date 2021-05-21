import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static TextStyle get titleText => GoogleFonts.condiment(
        fontSize: 52,
        letterSpacing: 2,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get redText => GoogleFonts.montserrat(
        fontSize: 16,
        color: Colors.red,
      );
  static TextStyle get blackText => GoogleFonts.montserrat(
        fontSize: 16,
        letterSpacing: 2,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );
  static TextStyle get simpleText => GoogleFonts.montserrat(
        fontSize: 12,
        letterSpacing: 2,
        color: Colors.black,
      );
}
