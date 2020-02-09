import 'package:flutter/material.dart';
import 'package:todo_app/customs/custom_ink_well.dart';
import 'package:todo_app/utils/scroll_behavior.dart';

class CustomDialog extends StatelessWidget {
  final List<Widget> children;
  final String title;

  const CustomDialog({Key key, this.children, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: _decoration(),
        padding: EdgeInsets.all(1),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _theme.backgroundColor,
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    _headerDialog(context: context, title: title)
                  ]..addAll(children),
                )),
          ),
        ),
      ),
    );
  }

  _decoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: [Color(0xFFF12C43), Color(0xFFD75C29)],
          stops: [0.2, 0.8],
        ));
  }

  _headerDialog({BuildContext context, String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        CustomInkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.close,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
