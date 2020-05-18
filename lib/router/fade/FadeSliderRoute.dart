import 'package:flutter/material.dart';

class FadeSliderRoute extends PageRouteBuilder {
  final Widget widget;
  FadeSliderRoute({this.widget})
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
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero
          ).animate(animation),
          child: child,
        )
      ),
  );
}