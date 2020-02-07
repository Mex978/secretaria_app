import 'package:todo_app/models/todo_model.dart';

sortTodoList(List<Todo> todos) {
  List<Todo> todosSorted = todos;
  todosSorted.sort((a, b) => a.inicio.compareTo(b.inicio));
  return todosSorted;
}
