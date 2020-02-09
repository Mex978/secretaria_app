import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/utils/update_date.dart';

Map<DateTime, List<Todo>> groupByTime(List<Todo> todos) {
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

Map<int, List<Todo>> groupByWeek(List<Todo> todos) {
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

Map<int, List<Todo>> groupByMonth(List<Todo> todos) {
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
