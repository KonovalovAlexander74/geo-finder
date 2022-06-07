import 'package:flutter/material.dart';

abstract class AppTheme {
  static final theme = ThemeData(
    primarySwatch: Colors.blueGrey,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
  );
}

abstract class AppColors {
  static const Color scaffoldColor = Color.fromARGB(239, 252, 252, 252);
}
