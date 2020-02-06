import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:todo_app/themes/default.dart';
import 'package:todo_app/utils/scroll_behavior.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TodoApp",
      theme: themeDefault(),
      home: ScrollConfiguration(
        behavior: MyBehavior(),
        child: HomeScreen(),
      ),
      // home: HomeScreen(),
    );
  }
}
