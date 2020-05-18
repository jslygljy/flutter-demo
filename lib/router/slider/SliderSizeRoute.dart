import 'package:flutter/material.dart';

class SliderSizeRoute extends PageRouteBuilder{
  final Widget widget;
  SliderSizeRoute({this.widget})
  :super(
    pageBuilder:(
      BuildContext context,
      Animation<double> animation,
      Animation<double> sconddaryAnimation
    )=>
      widget,
      transitionsBuilder:(
        BuildContext context,
        Animation<double> animation,
        Animation<double> sconddaryAnimation,
        Widget child
      )=>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero
          ).animate(animation),
            child: SizeTransition(
              sizeFactor: animation,
              child: child,
            ),
        )
  );
}