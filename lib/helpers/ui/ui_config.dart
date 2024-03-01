
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UiConfig {
  
  UiConfig._();
  
  static ThemeData get theme => ThemeData(
    textTheme: GoogleFonts.montserratTextTheme(),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1A3260))
  );
}