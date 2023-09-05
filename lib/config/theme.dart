import 'package:flutter/material.dart';
import 'package:flutter_ulmo/config/constants.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.poppins().fontFamily,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: b1Medium.copyWith(color: black),
  ),
);
