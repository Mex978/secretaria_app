import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/customs/custom_dialog.dart';
import 'package:todo_app/customs/custom_ink_well.dart';
import 'package:todo_app/customs/custom_raised_button.dart';
import 'package:todo_app/models/todo_model.dart';

class CustomCard extends StatelessWidget {
  final Todo todo;
  const CustomCard({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: _decoration(),
        child: CustomInkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () => _showTodo(context, todo: todo),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              todo.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  decoration: todo.completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w600),
            ),
          ),
        ));
  }

  _decoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: todo.completed
            ? LinearGradient(
                colors: [Color(0xFF433977), Color(0xFF534C76)],
                stops: [0.2, 0.8],
              )
            : LinearGradient(
                colors: [Color(0xFFF12C43), Color(0xFFD75C29)],
                stops: [0.2, 0.8],
              ));
  }

  _showTodo(BuildContext context, {Todo todo}) {
    final TodoController _todoController = GetIt.I.get<TodoController>();
    showDialog(
        context: context,
        child: CustomDialog(
          title: "Informações",
          children: <Widget>[
            customLabelText(
              labelText: "Título",
              text: Text(todo.title),
            ),
            SizedBox(
              height: 16,
            ),
            customLabelText(
              labelText: "Descrição",
              text: Text(
                todo.descricao ?? "Sem informações",
                style: TextStyle(
                    fontStyle: todo.descricao == null
                        ? FontStyle.italic
                        : FontStyle.normal),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Finalizado:",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: () => _todoController.changeCompleted(todo),
                    child: Switch(
                      activeColor: Colors.red,
                      value: todo.completed,
                      onChanged: (newValue) {
                        todo.completed = newValue;
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            CustomRaisedButton(
              text: "Ok",
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }

  customLabelText({String labelText, Widget text}) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  labelText + ":",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 12),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.white54),
                              borderRadius: BorderRadius.circular(4)),
                          child: text),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
