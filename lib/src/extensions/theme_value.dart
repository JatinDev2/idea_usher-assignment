import 'package:flutter/material.dart';

extension ThemeValue<T> on BuildContext {
  T themeValue({required T light, T? dark}) {
    return Theme.of(this).brightness == Brightness.light ? light : dark ?? light;
  }
}
