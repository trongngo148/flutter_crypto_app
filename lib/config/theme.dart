import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: kPrimaryColor,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        caption: TextStyle(
      color: kCaptionColor,
      fontSize: 16.0,
    )),
    appBarTheme: AppBarTheme(elevation: 0.0, color: kPrimaryColor),
  );
}
