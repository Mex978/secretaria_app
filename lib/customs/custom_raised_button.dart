import 'package:flutter/material.dart';
import 'package:todo_app/customs/custom_ink_well.dart';

class CustomRaisedButton extends StatelessWidget {
  final Function onPressed;
  final bool enabled;
  final String text;

  const CustomRaisedButton(
      {Key key,
      @required this.onPressed,
      @required this.text,
      this.enabled: true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: enabled
                      ? LinearGradient(
                          colors: [Color(0xFFF12C43), Color(0xFFD75C29)],
                          stops: [0.2, 0.8],
                        )
                      : LinearGradient(
                          colors: [Color(0xFF433977), Color(0xFF534C76)],
                          stops: [0.2, 0.8],
                        )),
              child: CustomInkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: enabled ? onPressed : null,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ))),
        ),
      ],
    );
  }
}
