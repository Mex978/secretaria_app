import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/components/custom_app_bar.dart';
import 'package:todo_app/screens/section/components/section_month.dart';
import 'package:todo_app/screens/section/components/section_today.dart';
import 'package:todo_app/screens/section/components/section_week.dart';
import 'package:todo_app/services/dados_mockados.dart';

class SectionScreen extends StatefulWidget {
  @override
  _SectionScreenState createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  double widthIndicator = 50;
  bool value = false;
  int page = 0;
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
        child: Column(
          children: <Widget>[
            _tabBar(),
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    page = value;
                  });
                },
                controller: _pageController,
                children: <Widget>[
                  SectionToday(
                      items: todos.where((todo) {
                    //todo Modificar essa linha para DateTime.now()
                    DateTime today = DateTime(2020, 2, 7);
                    bool isToday = todo.inicio.year == today.year
                        ? todo.inicio.month == today.month
                            ? todo.inicio.day == today.day
                            : false
                        : false;
                    return isToday;
                  }).toList()),
                  SectionWeek(
                    items: todos
                        .where((todo) =>
                            todo.inicio.difference(DateTime.now()).inDays < 7)
                        .toList(),
                  ),
                  SectionMonth(
                    items: todos,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
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
