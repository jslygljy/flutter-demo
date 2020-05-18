import 'package:flutter/material.dart';

class SliderScaleRoute extends PageRouteBuilder{
  final Widget widget;
  SliderScaleRoute({this.widget})
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
          child: ScaleTransition(
              scale:Tween<double>(
              begin: 0.0,
              end:1.0
            ).animate(
              CurvedAnimation(
                parent:animation,
                curve:Curves.linear
              )
            ),
            child:child
          ),
        )
  );
}