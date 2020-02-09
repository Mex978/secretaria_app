import 'package:flutter/material.dart';

themeDefault() {
  return ThemeData(
      backgroundColor: const Color(0xFF242133),
      fontFamily: "OpenSans",
      brightness: Brightness.dark,
      splashColor: Colors.blue[600],
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }));
}
