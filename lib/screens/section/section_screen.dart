import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/components/custom_app_bar.dart';

class SectionScreen extends StatefulWidget {
  @override
  _SectionScreenState createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  Alignment alignment = Alignment.centerLeft;
  double widthIndicator = 50;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Container(
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
              Stack(
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
              Expanded(
                child: Column(
                  children: <Widget>[_fieldTask()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _fieldTask() {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Flexible(
                child: Container(
                    child: Column(
              children: <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 15,
                ),
                SizedBox(
                  height: 140,
                  width: 1.5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: Color(0xFF312E3F),
                  ),
                )
              ],
            )))
          ],
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          children: <Widget>[
            Flexible(
                child: Container(
                    child: Column(
              children: <Widget>[
                Text("9:30 am",
                    style: TextStyle(
                        fontSize: 10,
                        fontFamily: "OpenSans",
                        color: Colors.white,
                        fontWeight: FontWeight.w600)),
              ],
            )))
          ],
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          children: <Widget>[
            Card(
              elevation: 0,
              child: Container(
                  padding: EdgeInsets.all(10),
                  width: 250,
                  child: Text("Card 1")),
            ),
            Card(
              elevation: 0,
              child: Container(
                  padding: EdgeInsets.all(10),
                  width: 250,
                  child: Text("Card 1")),
            ),
            Card(
              elevation: 0,
              child: Container(
                  padding: EdgeInsets.all(10),
                  width: 250,
                  child: Text("Card 1")),
            ),
            Card(
              elevation: 0,
              child: Container(
                  padding: EdgeInsets.all(10),
                  width: 250,
                  child: Text("Card 1")),
            ),
            Card(
              elevation: 0,
              child: Container(
                  padding: EdgeInsets.all(10),
                  width: 250,
                  child: Text("Card 1")),
            )
          ],
        )
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
