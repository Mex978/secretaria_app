import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/components/add_item_dialog.dart';

class AddItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 80,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [Color(0xFFF12C43), Color(0xFFD75C29)],
              stops: [0.2, 0.8],
            )),
        child: FlatButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            showDialog(context: context, child: AddItemDialog());
          },
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
