import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final bool value;

  const CustomCheckBox({Key key, this.onPressed, this.color, this.value: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: value
            ? BoxDecoration()
            : BoxDecoration(
                border: Border.all(color: color, width: 3),
                borderRadius: BorderRadius.circular(2)),
        width: 18,
        height: 18,
        child: value
            ? Center(
                child: Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 15,
                ),
              )
            : Container(),
      ),
    );
  }
}
