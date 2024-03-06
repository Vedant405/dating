import 'package:flutter/material.dart';

class GradientHelper {
  static final List<Color> colors = [Color(0xFFFB9245), Color(0xFFF54E6B)];

  static final LinearGradient backgroundGradient = LinearGradient(
    colors: colors,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}