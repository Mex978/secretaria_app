import 'package:flutter/material.dart';

import 'custom_checkbox.dart';

Widget fieldTask(
    {bool hasNext: false,
    String headTime: "Teste",
    List<Widget> items,
    bool isFinished: false}) {
  return Stack(
    children: <Widget>[
      _indicator(hasNext: hasNext),
      _body(
        headTime: headTime,
        isFinished: isFinished,
        items: items,
      ),
    ],
  );
}

_indicator({bool hasNext}) {
  return Positioned(
    top: 16,
    bottom: 0,
    left: 8,
    child: hasNext
        ? Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 3),
            child: Container(
              width: 2,
              height: 50,
              color: Color(0xFF312E3F),
            ),
          )
        : Container(),
  );
}

_body({String headTime, bool isFinished, List<Widget> items}) {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              CustomCheckBox(
                  value: isFinished, color: Color(0xFF312E3F), onPressed: null)
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          child: Text(
              // "${dateTime.hour}:${dateTime.minute == 0 ? "00" : dateTime.minute} ${dateTime.hour > 12 ? "pm" : "am"}",
              headTime,
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
  );
}
