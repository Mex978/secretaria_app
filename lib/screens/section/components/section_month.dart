import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/screens/section/components/custom_card.dart';
import 'package:todo_app/screens/section/components/field_task.dart';
import 'package:todo_app/utils/sort_todo_list.dart';

Map<int, List<Todo>> _groupByMonth(List<Todo> todos) {
  Map<int, List<Todo>> map = {};

  todos.forEach((todo) {
    DateTime first = todo.inicio;
    int keyAtual = first.month;

    map.containsKey(keyAtual)
        ? map[keyAtual].add(todo)
        : map[keyAtual] = <Todo>[todo];
  });

  Map<int, List<Todo>> sortedMap = {};

  List sortedKeys = map.keys.toList()..sort();
  sortedKeys.forEach((key) {
    sortedMap[key] = map[key];
  });

  return sortedMap;
}

headerTimeParser(int month) {
  switch (month) {
    case DateTime.january:
      return "Janeiro     ";
    case DateTime.february:
      return "Fevereiro ";
    case DateTime.march:
      return "Março       ";
    case DateTime.april:
      return "Abril          ";
    case DateTime.may:
      return "Maio          ";
    case DateTime.june:
      return "Junho         ";
    case DateTime.july:
      return "Julho          ";
    case DateTime.august:
      return "Agosto       ";
    case DateTime.september:
      return "Setembro  ";
    case DateTime.october:
      return "Outubro    ";
    case DateTime.november:
      return "Novembro";
    case DateTime.december:
      return "Dezembro";
      break;
    default:
  }
}

class SectionMonth extends StatelessWidget {
  final List<Todo> items;

  const SectionMonth({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, List<Todo>> map = _groupByMonth(sortTodoList(items));
    return Expanded(
      child: ListView(
          padding: const EdgeInsets.all(20),
          children: map.keys.map<Widget>((key) {
            return fieldTask(
                headTime: headerTimeParser(key),
                hasNext: !(map.keys.last == key),
                items: map[key]
                    .map((todo) => CustomCard(
                          task: todo.tile,
                        ))
                    .toList());
          }).toList()),
    );
  }
}
