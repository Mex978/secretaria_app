import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/controllers/page_view_controller.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/customs/custom_ink_well.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/screens/home/components/custom_app_bar.dart';
import 'package:todo_app/screens/section/components/custom_card.dart';
import 'package:todo_app/screens/section/components/field_task.dart';

class SectionScreen extends StatelessWidget {
  final PageViewController _pageViewController =
      GetIt.I.get<PageViewController>();
  final TodoController _todoController = GetIt.I.get<TodoController>();

  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Scaffold(
      backgroundColor: _theme.backgroundColor,
      appBar: customAppBar(
          description: "Essa é sua lista de to-do's",
          icon: Icons.arrow_back,
          onLeadingPress: () => Navigator.pop(context)),
      body: SafeArea(
        child: Center(
          child: Observer(
            builder: (_) {
              if (_todoController.todos == null ||
                  _todoController.todos.isEmpty)
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.cancel,
                      size: 70,
                      color: Colors.deepOrange,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Sem To-Do's por aqui!",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )
                  ],
                );
              else {
                return Column(
                  children: <Widget>[_tabBar(context), _body()],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  _tabs(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Row(
          children: <Widget>[
            _itemsTab(
                context: context,
                content: "Hoje",
                align: Alignment.centerLeft,
                onPressed: () {
                  _pageController.animateToPage(0,
                      curve: Curves.ease,
                      duration: Duration(milliseconds: 500));
                }),
            _itemsTab(
                context: context,
                content: "Semana",
                align: Alignment.center,
                onPressed: () {
                  _pageController.animateToPage(1,
                      curve: Curves.ease,
                      duration: Duration(milliseconds: 500));
                }),
            _itemsTab(
                context: context,
                content: "Mês",
                align: Alignment.centerRight,
                onPressed: () {
                  _pageController.animateToPage(2,
                      curve: Curves.ease,
                      duration: Duration(milliseconds: 500));
                }),
          ],
        ),
      ),
    );
  }

  _indicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 5),
                    color: Color(0xFF312E3F),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Observer(
            builder: (_) {
              int _page = _pageViewController.page;
              return AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
                alignment: _page == 0
                    ? Alignment.centerLeft
                    : _page == 1 ? Alignment.center : Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                      color: Color(0xFFE3E2E5),
                      borderRadius: BorderRadius.circular(50)),
                  width: _page == 1 ? 80 : 50,
                  height: 2,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  _tabBar(BuildContext context) {
    return Column(
      children: <Widget>[_tabs(context), _indicator()],
    );
  }

  _body() {
    return Expanded(
      child: Observer(
        builder: (_) {
          return PageView(
            onPageChanged: (value) => _pageViewController.changePage(value),
            controller: _pageController,
            children: _todoController.sections.keys.map<Widget>((index) {
              return Observer(
                builder: (_) {
                  Map<dynamic, List<Todo>> items =
                      _todoController.sections[index]["items"];
                  Function parser = _todoController.sections[index]["parser"];
                  return ListView(
                      padding: const EdgeInsets.all(20),
                      children: items.keys.map<Widget>((key) {
                        return fieldTask(
                            headTime: parser(key),
                            hasNext: !(items.keys.last == key),
                            items: items[key]
                                .map((todo) => CustomCard(
                                      todo: todo,
                                    ))
                                .toList());
                      }).toList());
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }

  _itemsTab(
      {BuildContext context,
      String content,
      Alignment align,
      Function onPressed}) {
    return Expanded(
      child: Align(
        alignment: align,
        child: CustomInkWell(
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Text(content,
                style: TextStyle(
                    fontFamily: "OpenSans",
                    color: Colors.white,
                    fontWeight: FontWeight.w900)),
          ),
          onTap: onPressed,
        ),
      ),
    );
  }
}
