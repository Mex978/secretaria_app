import 'package:mobx/mobx.dart';
import 'package:todo_app/models/todo_model.dart';
part 'todo_controller.g.dart';

class TodoController = _TodoControllerBase with _$TodoController;

abstract class _TodoControllerBase with Store {
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @action
  insertTodo(Todo todo) {
    todos.add(todo);
  }
}
