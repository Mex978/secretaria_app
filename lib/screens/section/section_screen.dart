import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/screens/home/components/custom_app_bar.dart';
import 'package:todo_app/screens/section/components/section_month.dart';
import 'package:todo_app/screens/section/components/section_today.dart';
import 'package:todo_app/screens/section/components/section_week.dart';
import 'package:todo_app/services/dados_mockados.dart';
import 'package:todo_app/utils/absolute.dart';
import './components/custom_card.dart';
import 'package:todo_app/screens/section/components/custom_checkbox.dart';

class SectionScreen extends StatefulWidget {
  @override
  _SectionScreenState createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  Alignment alignment = Alignment.centerLeft;
  double widthIndicator = 50;
  bool value = false;
  int page = 0;

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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Row(
                  children: <Widget>[
                    _itemsTab(
                        context: context,
                        content: "Hoje",
                        align: Alignment.centerLeft,
                        onPressed: () {
                          setState(() {
                            alignment = Alignment.centerLeft;
                            widthIndicator = 50;
                            page = 0;
                          });
                        }),
                    _itemsTab(
                        context: context,
                        content: "Semana",
                        align: Alignment.center,
                        onPressed: () {
                          setState(() {
                            alignment = Alignment.center;
                            widthIndicator = 80;
                            page = 1;
                          });
                        }),
                    _itemsTab(
                        context: context,
                        content: "Mês",
                        align: Alignment.centerRight,
                        onPressed: () {
                          setState(() {
                            alignment = Alignment.centerRight;
                            widthIndicator = 50;
                            page = 2;
                          });
                        }),
                  ],
                ),
              ),
            ),
            Padding(
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
                    alignment: alignment,
                    child: Container(
                      margin: EdgeInsets.only(top: 4),
                      decoration: BoxDecoration(
                          color: Color(0xFFE3E2E5),
                          borderRadius: BorderRadius.circular(50)),
                      width: widthIndicator,
                      height: 2,
                    ),
                  )
                ],
              ),
            ),
            page == 0
                ? SectionToday(
                    items: todos.where((todo) {
                    print(todo);
                    // DateTime today = DateTime.now();
                    DateTime today = DateTime(2020, 2, 7);
                    bool isToday = todo.inicio.year == today.year
                        ? todo.inicio.month == today.month
                            ? todo.inicio.day == today.day
                            : false
                        : false;
                    return isToday;
                  }).toList())
                : page == 1
                    ? SectionWeek(
                        items: todos
                            .where((todo) =>
                                todo.inicio.difference(DateTime.now()).inDays <
                                7)
                            .toList(),
                      )
                    : page == 2
                        ? SectionMonth(
                            items: todos,
                          )
                        : Container()
          ],
        ),
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
        child: InkWell(
          highlightColor: Colors.transparent,
          splashFactory: InkRipple.splashFactory,
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
