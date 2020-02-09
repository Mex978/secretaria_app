import 'package:flutter/widgets.dart';

class Todo {
  DateTime inicio;
  String title;
  String descricao;
  bool completed;

  Todo(
      {this.inicio,
      @required this.title,
      this.descricao,
      this.completed: false});
}
