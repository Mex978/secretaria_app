import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/controllers/add_todo_item_controller.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:todo_app/themes/default.dart';
import 'package:todo_app/utils/scroll_behavior.dart';

void main() {
  GetIt.instance.registerSingleton<TodoController>(TodoController());
  GetIt.instance
      .registerSingleton<AddTodoItemController>(AddTodoItemController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        locale: Locale("pt", "BR"),
        debugShowCheckedModeBanner: false,
        title: "TodoApp",
        theme: themeDefault(),
        home: ScrollConfiguration(
          behavior: MyBehavior(),
          child: HomeScreen(),
        ),
        // home: HomeScreen(),
      ),
    );
  }
}
