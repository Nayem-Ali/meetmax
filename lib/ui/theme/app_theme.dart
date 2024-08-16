import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData lightTheme(context) => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFFBFBFD).withOpacity(0.98),
        colorScheme: const ColorScheme.light(),
        appBarTheme: const AppBarTheme(),
        tabBarTheme: const TabBarTheme(),
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
              ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      );
}
