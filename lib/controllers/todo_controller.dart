import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_app/controllers/add_todo_item_controller.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/utils/date_parser.dart';
import 'package:todo_app/utils/group_functions.dart';
import 'package:todo_app/utils/sort_todo_list.dart';
part 'todo_controller.g.dart';

class TodoController = _TodoControllerBase with _$TodoController;

abstract class _TodoControllerBase with Store {
  final AddTodoItemController _addTodoItemController =
      GetIt.I.get<AddTodoItemController>();

  @observable
  ObservableMap<int, dynamic> sections = ObservableMap<int, dynamic>();

  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @action
  insertTodo(Todo todo) {
    todos.add(todo);
    _addTodoItemController.changeDate(DateTime.now());
  }

  @action
  changeCompleted(Todo todo) => todo.completed = !todo.completed;

  @action
  onInit() {
    List<Todo> itemsOfToday = todos.where((todo) {
      DateTime todoDate = todo.inicio;

      DateTime todayDate = DateTime.now();
      // DateTime todayDate = DateTime(2020, 2, 7);
      return todayDate.year == todoDate.year
          ? todayDate.month == todoDate.month
              ? todayDate.day == todoDate.day
              : false
          : false;
    }).toList();

    List<Todo> itemsOfWeek = todos.where((todo) {
      DateTime todoDate = todo.inicio;

      //todo Trocar por DateTime.now()
      DateTime todayDate = DateTime(2020, 2, 7);
      return todoDate.difference(todayDate).inDays < 7;
    }).toList();

    sections.addAll({
      0: {
        "items": groupByTime(sortTodoList(itemsOfToday)),
        "parser": timeParser
      },
      1: {
        "items": groupByWeek(sortTodoList(itemsOfWeek)),
        "parser": weekParser
      },
      2: {"items": groupByMonth(sortTodoList(todos)), "parser": monthParser}
    });
    return sections;
  }
}
