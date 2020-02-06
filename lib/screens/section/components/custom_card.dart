import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String task;
  final bool isCompleted;

  const CustomCard({Key key, this.task, this.isCompleted: false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: isCompleted
                ? LinearGradient(
                    colors: [Color(0xFF433977), Color(0xFF534C76)],
                    stops: [0.2, 0.8],
                  )
                : LinearGradient(
                    colors: [Color(0xFFF12C43), Color(0xFFD75C29)],
                    stops: [0.2, 0.8],
                  )),
        // width: 250,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashFactory: InkRipple.splashFactory,
            borderRadius: BorderRadius.circular(5),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                task,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: "OpenSans",
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ));
  }
}
