import 'package:flutter/material.dart';

class FadeSizeRoute extends PageRouteBuilder {
  final Widget widget;
  FadeSizeRoute({this.widget})
  :super(
    transitionDuration: Duration(seconds: 1),
    pageBuilder:(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    )=>
    widget,
    transitionsBuilder:(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child
    )=>
      FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          child: child,
        ),
      ),
  );
}