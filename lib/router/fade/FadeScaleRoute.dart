import 'package:flutter/material.dart';

class FadeScaleRoute extends PageRouteBuilder {
  final Widget widget;
  FadeScaleRoute({this.widget})
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
        child: ScaleTransition(
            scale:Tween<double>(
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