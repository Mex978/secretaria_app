import 'package:flutter/material.dart';

themeDefault() {
  return ThemeData(
      backgroundColor: Color(0xFF242133),
      fontFamily: "OpenSans",
      brightness: Brightness.dark,
      splashColor: Colors.blue[600],
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }));
}
