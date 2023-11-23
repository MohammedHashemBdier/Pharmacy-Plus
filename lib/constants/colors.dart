import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color c1 = Color(0xff9E9E9E);
  static const Color c2 = Color(0xff4184C5);
  static const Color c3 = Colors.white;
  static const Color c4 = Color(0xff6F91B1);
}

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE8F0F8),
  100: Color(0xFFC6D9ED),
  200: Color(0xFFA1C0E1),
  300: Color(0xFF7BA7D5),
  400: Color(0xFF5E94CC),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF3C79BD),
  700: Color(0xFF336EB5),
  800: Color(0xFF2B64AE),
  900: Color(0xFF1D51A1),
});
const int _primaryPrimaryValue = 0xFF4281C3;

const MaterialColor primaryAccent =
    MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFDAE7FF),
  200: Color(_primaryAccentValue),
  400: Color(0xFF74A6FF),
  700: Color(0xFF5A96FF),
});
const int _primaryAccentValue = 0xFFA7C7FF;
