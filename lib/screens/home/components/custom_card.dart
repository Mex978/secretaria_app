import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double borderRadius;

  const CustomCard(
      {Key key,
      @required this.icon,
      @required this.onPressed,
      this.borderRadius: 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Color(0xFF37334C),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
