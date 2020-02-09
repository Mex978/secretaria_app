import 'package:flutter/material.dart';
import 'package:todo_app/customs/custom_ink_well.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/screens/home/components/custom_app_bar.dart';
import 'package:todo_app/screens/section/components/custom_card.dart';
import 'package:todo_app/screens/section/components/field_task.dart';
import 'package:todo_app/services/dados_mockados.dart';
import 'package:todo_app/utils/date_parser.dart';
import 'package:todo_app/utils/group_functions.dart';
import 'package:todo_app/utils/sort_todo_list.dart';

class SectionScreen extends StatefulWidget {
  @override
  _SectionScreenState createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  int page = 0;
  Map<int, dynamic> _sections = {};

  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    _onInit();

    return Scaffold(
      backgroundColor: _theme.backgroundColor,
      appBar: customAppBar(
          description: "Essa é sua lista de to-do's",
          icon: Icons.arrow_back,
          onLeadingPress: () => Navigator.pop(context)),
      body: SafeArea(
        child: Column(
          children: <Widget>[_tabBar(), _body()],
        ),
      ),
    );
  }

  _onInit() {
    List<Todo> itemsOfToday = todos.where((todo) {
      DateTime todoDate = todo.inicio;

      //todo Trocar por DateTime.now()
      DateTime todayDate = DateTime(2020, 2, 7);
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

    _sections[0] = {
      "items": groupByTime(sortTodoList(itemsOfToday)),
      "parser": timeParser
    };
    _sections[1] = {
      "items": groupByWeek(sortTodoList(itemsOfWeek)),
      "parser": weekParser
    };
    _sections[2] = {
      "items": groupByMonth(sortTodoList(todos)),
      "parser": monthParser
    };
  }

  _tabs() {
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
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            alignment: page == 0
                ? Alignment.centerLeft
                : page == 1 ? Alignment.center : Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                  color: Color(0xFFE3E2E5),
                  borderRadius: BorderRadius.circular(50)),
              width: page == 1 ? 50 : 80,
              height: 2,
            ),
          )
        ],
      ),
    );
  }

  _tabBar() {
    return Column(
      children: <Widget>[_tabs(), _indicator()],
    );
  }

  _body() {
    return Expanded(
      child: PageView(
        onPageChanged: (value) {
          setState(() {
            page = value;
          });
        },
        controller: _pageController,
        children: _sections.keys.map<Widget>((index) {
          Map<dynamic, List<Todo>> items = _sections[index]["items"];
          Function parser = _sections[index]["parser"];
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
        }).toList(),
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
