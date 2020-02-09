import 'package:flutter/material.dart';
import 'package:todo_app/customs/custom_dialog.dart';
import 'package:todo_app/customs/custom_ink_well.dart';
import 'package:todo_app/models/todo_model.dart';

class CustomCard extends StatelessWidget {
  final Todo todo;
  final bool isCompleted;

  const CustomCard({Key key, this.todo, this.isCompleted: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: isCompleted
                ? LinearGradient(
                    colors: [Color(0xFF433977), Color(0xFF534C76)],
                    stops: [0.2, 0.8],
                  )
                : LinearGradient(
                    colors: [Color(0xFFF12C43), Color(0xFFD75C29)],
                    stops: [0.2, 0.8],
                  )),
        child: CustomInkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () => _showTodo(context),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              todo.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  decoration: isCompleted
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

  _showTodo(BuildContext context) {
    showDialog(
        context: context,
        child: CustomDialog(
          title: "Informações",
          children: <Widget>[Container()],
        ));
  }
}
