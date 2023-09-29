import 'package:flutter/material.dart';

extension StringUtils on String {
  bool get isValidPassword => RegExp(
          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
      .hasMatch(this);

  bool get isValidEmail =>
      RegExp(r'^[a-zA-Z\d._%+-]+@[a-zA-Z\d.-]+\.[a-zA-Z]{2,}$').hasMatch(this);

  ThemeMode toThemeMode() {
    switch (this) {
      case 'light':
        return ThemeMode.light;

      case 'dark':
        return ThemeMode.dark;

      case 'system':
        return ThemeMode.system;

      default:
        throw ArgumentError('Invalid theme argument : $this');
    }
  }
}
