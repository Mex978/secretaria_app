import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/screens/home/components/add_item_button.dart';
import 'package:todo_app/screens/home/components/custom_app_bar.dart';
import 'package:todo_app/screens/home/components/custom_card.dart';
import 'package:todo_app/screens/home/components/grid_view.dart';
import 'package:todo_app/screens/section/section_screen.dart';

class HomeScreen extends StatelessWidget {
  final TodoController _todoController = GetIt.I.get<TodoController>();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Scaffold(
      key: _key,
      drawer: Drawer(),
      backgroundColor: _theme.backgroundColor,
      appBar: customAppBar(
          key: _key, description: "Bem-vindo ao TodoApp", icon: Icons.menu),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Total de 26 tarefas",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            child: CustomGridView(
              items: <Widget>[
                Center(
                  child: Observer(
                    builder: (_) {
                      return CustomCard(
                        description: "To Do",
                        count: "${_todoController.todos.length} items",
                        icon: Icons.assignment,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SectionScreen()));
                        },
                      );
                    },
                  ),
                ),
                Center(
                  child: CustomCard(
                    icon: Icons.event_note,
                    description: "Eventos",
                    count: "5 items",
                    onPressed: () {},
                  ),
                ),
                Center(
                  child: CustomCard(
                    icon: Icons.content_paste,
                    description: "Notas",
                    count: "15 items",
                    onPressed: () {},
                  ),
                ),
                Center(
                  child: AddItemButton(),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
