import 'package:flutter/material.dart';

class Theme {
  const Theme(); // end var

  static const Color gradientStart = const Color(0xFF514a9d);
  static const Color gradientEnd = const Color(0xFF24c6dc);

  static const gradient = const LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
  );
}
