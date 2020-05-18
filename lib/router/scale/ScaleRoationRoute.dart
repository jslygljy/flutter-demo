import 'package:flutter/material.dart';

class ScaleRoationRoute extends PageRouteBuilder{
  final Widget widget;
  ScaleRoationRoute({this.widget})
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
        ScaleTransition(
          scale:Tween<double>(
            begin: 0.0,
            end:1.0
          ).animate(
            CurvedAnimation(
              parent:animation,
              curve:Curves.fastOutSlowIn
            )
          ),
          
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
        )
  );
}