import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/screens/section/components/custom_card.dart';
import 'package:todo_app/screens/section/components/field_task.dart';
import 'package:todo_app/utils/sort_todo_list.dart';
import 'package:todo_app/utils/update_date.dart';

Map<DateTime, List<Todo>> _groupByTime(List<Todo> todos) {
  // print(todos);
  Map<DateTime, List<Todo>> map = {};

  todos.forEach((todo) {
    DateTime first = todo.inicio;
    DateTime keyAtual = first.minute < 30
        ? updateDate(first, minute: 0)
        : updateDate(first, minute: 30);

    map.containsKey(keyAtual)
        ? map[keyAtual].add(todo)
        : map[keyAtual] = <Todo>[todo];
  });

  return map;
}

headTimeParser(DateTime date) {
  return "${date.hour < 10 ? "0" + date.hour.toString() : date.hour}:${date.minute < 10 ? "0" + date.minute.toString() : date.minute} ${date.hour >= 12 ? "pm" : "am"}";
}

class SectionToday extends StatelessWidget {
  final List<Todo> items;

  const SectionToday({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(items);
    Map<DateTime, List<Todo>> map = _groupByTime(sortTodoList(items));
    return ListView(
        padding: const EdgeInsets.all(20),
        children: map.keys.map<Widget>((key) {
          return fieldTask(
              headTime: headTimeParser(key),
              hasNext: !(map.keys.last == key),
              items: map[key]
                  .map((todo) => CustomCard(
                        task: todo.tile,
                      ))
                  .toList());
        }).toList());
  }
}
