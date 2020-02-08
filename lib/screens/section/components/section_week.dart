import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/screens/section/components/custom_card.dart';
import 'package:todo_app/screens/section/components/field_task.dart';
import 'package:todo_app/services/dados_mockados.dart';
import 'package:todo_app/utils/sort_todo_list.dart';
import 'package:todo_app/utils/update_date.dart';

Map<int, List<Todo>> _groupByWeek(List<Todo> todos) {
  Map<int, List<Todo>> map = {};

  todos.forEach((todo) {
    DateTime first = todo.inicio;
    int keyAtual = first.weekday;

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

headerTimeParser(int week) {
  switch (week) {
    case DateTime.monday:
      return "Segunda-feira";
    case DateTime.tuesday:
      return "Terça-feira      ";
    case DateTime.wednesday:
      return "Quarta-feira   ";
    case DateTime.thursday:
      return "Quinta-feira   ";
    case DateTime.friday:
      return "Sexta-feira      ";
    case DateTime.saturday:
      return "Sábado             ";
    case DateTime.sunday:
      return "Domingo          ";
      break;
    default:
  }
}

class SectionWeek extends StatelessWidget {
  final List<Todo> items;

  const SectionWeek({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, List<Todo>> map = _groupByWeek(sortTodoList(items));
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
