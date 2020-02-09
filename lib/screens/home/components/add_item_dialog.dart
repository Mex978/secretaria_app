import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/controllers/add_todo_item_controller.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/customs/custom_dialog.dart';
import 'package:todo_app/customs/custom_ink_well.dart';
import 'package:todo_app/customs/custom_raised_button.dart';
import 'package:todo_app/customs/custom_text_field.dart';

class AddItemDialog extends StatefulWidget {
  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final AddTodoItemController _addTodoItemController =
      GetIt.I.get<AddTodoItemController>();
  final TodoController _todoController = GetIt.I.get<TodoController>();
  DateTime selectedDate = DateTime.now();
  int _category = 0;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: "Adicionar Item",
      children: <Widget>[
        _buildDivider(),
        _selectCategory(),
        _buildDivider(),
        _category == 0 ? _addTodo() : _category == 2 ? _addNote() : Container(),
        _buildDivider(h: 32),
        Observer(
          builder: (_) {
            return CustomRaisedButton(
                text: "Salvar",
                enabled: _addTodoItemController.validate,
                onPressed: () {
                  if (_category == 0) {
                    _todoController.insertTodo(_addTodoItemController.toObject);
                  }
                  Navigator.pop(context);
                });
          },
        ),
      ],
    );
  }

  _buildDivider({double h: 16}) {
    return SizedBox(
      height: h,
    );
  }

  _selectCategory() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Categoria:",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.white30)),
              child: DropdownButton(
                underline: Container(),
                isExpanded: true,
                value: _category,
                onChanged: (value) {
                  setState(() {
                    _category = value;
                  });
                },
                items: [
                  DropdownMenuItem(
                    child: Text("To-Do"),
                    value: 0,
                  ),
                  DropdownMenuItem(
                    child: Text("Evento"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Nota"),
                    value: 2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _addTodo() {
    return Column(
      children: <Widget>[
        CustomTextField(
          labelText: "Título",
          hintText: "Digite o título",
          onChanged: (value) {
            _addTodoItemController.changeTitle(value);
          },
        ),
        SizedBox(
          height: 16,
        ),
        CustomTextField(
          labelText: "Descrição",
          hintText: "Digite a descrição (opcional)",
          onChanged: (value) {
            _addTodoItemController.changeDescription(value);
          },
        ),
        SizedBox(
          height: 16,
        ),
        _selectDate(),
      ],
    );
  }

  _addNote() {
    return Column(
      children: <Widget>[
        CustomTextField(
          labelText: "Título",
          hintText: "Digite o título",
          onChanged: (value) {},
        ),
        SizedBox(
          height: 16,
        ),
        CustomTextField(
          labelText: "Descrição",
          hintText: "Digite a descrição (opcional)",
          onChanged: (value) {},
        ),
      ],
    );
  }

  _selectDate() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Data de início:",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white30),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                      "${selectedDate.day < 10 ? "0" + selectedDate.day.toString() : selectedDate.day}/${selectedDate.month < 10 ? "0" + selectedDate.month.toString() : selectedDate.day}/${selectedDate.year}"),
                ),
                CustomInkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      showDatePicker(
                              locale: Locale("pt", "BR"),
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2050))
                          .then((date) {
                        if (date != null)
                          _addTodoItemController.changeDate(date);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.edit,
                        size: 25,
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
