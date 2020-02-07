import 'package:flutter/widgets.dart';

class Todo {
  DateTime inicio;
  String tile;
  String descricao;
  bool completed;

  Todo(
      {this.inicio,
      @required this.tile,
      this.descricao,
      this.completed: false});
}
