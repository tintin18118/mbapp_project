 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.cream,
    colorScheme: ColorScheme.light(
      primary: AppColors.dustyRose,
      secondary: AppColors.caramel,
      surface: AppColors.cream,
    ),
    textTheme: GoogleFonts.cormorantGaramondTextTheme().copyWith(
      displayLarge: GoogleFonts.cormorantGaramond(
        fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.chocolate,
      ),
      titleLarge: GoogleFonts.cormorantGaramond(
        fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.chocolate,
      ),
      bodyMedium: GoogleFonts.lato(fontSize: 14, color: AppColors.textDark),
      bodySmall: GoogleFonts.lato(fontSize: 12, color: AppColors.textMuted),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.cream,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.chocolate),
      titleTextStyle: GoogleFonts.cormorantGaramond(
        fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.chocolate,
      ),
    ),
  );
}