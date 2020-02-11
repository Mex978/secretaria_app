import 'package:mobx/mobx.dart';
import 'package:todo_app/models/todo_model.dart';
part 'add_todo_item_controller.g.dart';

class AddTodoItemController = _AddTodoItemControllerBase
    with _$AddTodoItemController;

abstract class _AddTodoItemControllerBase with Store {
  @observable
  String title;

  @observable
  String description;

  @observable
  DateTime date = DateTime.now();

  @computed
  bool get validate => title != null && date != null;

  Todo get toObject => Todo(title: title, descricao: description, inicio: date);

  @action
  changeTitle(String newTitle) {
    title = newTitle;
  }

  @action
  changeDescription(String newDescription) {
    description = newDescription;
  }

  @action
  changeDate(DateTime newDate) {
    date = newDate;
  }
}
