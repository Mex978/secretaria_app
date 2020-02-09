import 'package:flutter/material.dart';
import 'package:todo_app/customs/custom_ink_well.dart';

class CustomCard extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double borderRadius;
  final String description;
  final String count;

  const CustomCard(
      {Key key,
      @required this.icon,
      @required this.onPressed,
      this.borderRadius: 5,
      @required this.description,
      this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomInkWell(
        color: Color(0xFF37334C),
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: TextStyle(
                  fontFamily: "OpenSans",
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              count,
              style: TextStyle(
                  fontFamily: "OpenSans",
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
