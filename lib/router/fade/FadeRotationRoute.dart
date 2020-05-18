import 'package:flutter/material.dart';

class FadeRotationRoute extends PageRouteBuilder {
  final Widget widget;
  FadeRotationRoute({this.widget})
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
        child: RotationTransition(
          turns: Tween<double>(
            begin: 0.0,
            end:1.0
          ).animate(
              CurvedAnimation(
              parent:animation,
              curve:Curves.fastOutSlowIn
            )
          ),
          child:child
        ),
      ),
  );
}