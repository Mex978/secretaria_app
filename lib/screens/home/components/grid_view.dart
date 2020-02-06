import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/components/custom_card.dart';

class CustomGridView extends StatelessWidget {
  final List<Widget> items;

  const CustomGridView({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 20,
      padding: EdgeInsets.all(20),
      crossAxisSpacing: 20,
      crossAxisCount: 2,
      children: items,
    );
  }
}
