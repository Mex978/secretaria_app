import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function onTap;
  final BorderRadiusGeometry borderRadius;

  const CustomInkWell(
      {Key key, this.child, this.onTap, this.borderRadius, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        highlightColor: Colors.transparent,
        splashFactory: InkRipple.splashFactory,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
