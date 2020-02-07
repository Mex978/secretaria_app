import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/components/custom_app_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Scaffold(
      backgroundColor: _theme.backgroundColor,
      appBar: customAppBar(
          description: "Bem-vindo ao TodoApp",
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
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: <Widget>[
                  _fieldTask(
                          hasNext: true,
                          dateTime: DateTime(2020, 2, 6, 17, 30),
                          items: <Widget>[
                            CustomCard(
                              task: "Tarefa aleatória 1! boa demais",
                            ),
                            CustomCard(
                              task: "Tarefa aleatória 2!",
                              isCompleted: true,
                            ),
                            CustomCard(
                              task: "Tarefa aleatória 3!",
                              isCompleted: true,
                            )
                          ]),
                  _fieldTask(
                      hasNext: true,
                      dateTime: DateTime(2020, 2, 6, 18, 0),
                      items: <Widget>[
                        CustomCard(
                          task: "Tarefa aleatória 4!",
                        ),
                      ]),
                  _fieldTask(
                      hasNext: false,
                      dateTime: DateTime(2020, 2, 6, 18, 30),
                      items: <Widget>[
                        CustomCard(
                          task: "Tarefa aleatória 5!",
                        ),
                        CustomCard(
                          task: "Tarefa aleatória 6!",
                        )
                      ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _fieldTask({bool hasNext: false, DateTime dateTime, List<Widget> items}) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 16,
          bottom: 0,
          left: 8,
          child: hasNext
              ? Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Container(
                    width: 2,
                    height: 50,
                    color: Color(0xFF312E3F),
                  ),
                )
              : Container(),
        ),
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    CustomCheckBox(
                        value: value,
                        color: Color(0xFF312E3F),
                        onPressed: () {
                          setState(() {
                            value = !value;
                          });
                        })
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Text(
                    "${dateTime.hour}:${dateTime.minute == 0 ? "00" : dateTime.minute} ${dateTime.hour > 12 ? "pm" : "am"}",
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: "OpenSans",
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: items,
                ),
              )),
            ],
          ),
        ),
      ],
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
