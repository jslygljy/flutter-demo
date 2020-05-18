import 'package:flutter/material.dart';

class RotationSizeRoute extends PageRouteBuilder{
  final Widget widget;
  RotationSizeRoute({this.widget})
  :super(
    pageBuilder:(
      BuildContext context,
      Animation<double> animation,
      Animation<double> sconddaryAnimation
    )=>
      widget,
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder:(
        BuildContext context,
        Animation<double> animation,
        Animation<double> sconddaryAnimation,
        Widget child
      )=>
        RotationTransition(
          turns: Tween<double>(
            begin: 0.0,
            end:1.0
          ).animate(
              CurvedAnimation(
              parent:animation,
              curve:Curves.fastOutSlowIn
            )
          ),
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        )
  );
}