import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/screens/section/components/custom_card.dart';
import 'package:todo_app/screens/section/components/field_task.dart';
import 'package:todo_app/services/dados_mockados.dart';
import 'package:todo_app/utils/sort_todo_list.dart';
import 'package:todo_app/utils/update_date.dart';

_groupByTime(List<Todo> todos) {
  Map<DateTime, List<Todo>> map;

  todos.forEach((todo) {});

  DateTime first = todos.first.inicio;
  DateTime keyAtual = first.minute < 30
      ? updateDate(first, minute: 0)
      : updateDate(first, minute: 30);
  map[keyAtual] = <Todo>[];
  todos.

  return map;
}

class SectionToday extends StatelessWidget {
  final List<Todo> items;

  const SectionToday({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
          padding: const EdgeInsets.all(20),
          children: sortTodoList(todos).map<Widget>((todo) {}).toList()

          // <Widget>[
          //   fieldTask(
          //           hasNext: true,
          //           dateTime: DateTime(2020, 2, 6, 17, 30),
          //           items: <Widget>[
          //             CustomCard(
          //               task: "Tarefa aleatória 1! boa demais",
          //             ),
          //             CustomCard(
          //               task: "Tarefa aleatória 2!",
          //               isCompleted: true,
          //             ),
          //             CustomCard(
          //               task: "Tarefa aleatória 3!",
          //               isCompleted: true,
          //             )
          //           ]),
          //   fieldTask(
          //       hasNext: true,
          //       dateTime: DateTime(2020, 2, 6, 18, 0),
          //       items: <Widget>[
          //         CustomCard(
          //           task: "Tarefa aleatória 4!",
          //         ),
          //       ]),
          //   fieldTask(
          //       hasNext: false,
          //       dateTime: DateTime(2020, 2, 6, 18, 30),
          //       items: <Widget>[
          //         CustomCard(
          //           task: "Tarefa aleatória 5!",
          //         ),
          //         CustomCard(
          //           task: "Tarefa aleatória 6!",
          //         )
          //       ])
          // ],
          ),
    );
  }
}
