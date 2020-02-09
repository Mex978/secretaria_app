import 'package:flutter/material.dart';
import 'package:todo_app/customs/custom_ink_well.dart';
import 'package:todo_app/screens/home/components/add_item_dialog.dart';

class AddItemButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                colors: [Color(0xFFF12C43), Color(0xFFD75C29)],
                stops: [0.2, 0.8],
              )),
          child: CustomInkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                showDialog(context: context, child: AddItemDialog());
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ),
              ))),
    );
  }
}
