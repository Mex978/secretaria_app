import 'package:flutter/material.dart';

customAppBar(
    {GlobalKey<ScaffoldState> key,
    String description,
    IconData icon,
    Function onLeadingPress}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(120),
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(right: 20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap:
                        onLeadingPress ?? () => key.currentState.openDrawer(),
                    highlightColor: Colors.transparent,
                    splashFactory: InkRipple.splashFactory,
                    splashColor: Colors.blue[600],
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("assets/user.jpg"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Olá Usuário,",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    description,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
