import 'package:flutter/material.dart';
import 'package:myapp/homeComponent/FloorItem1.dart';
import 'package:myapp/homeComponent/FloorItem2.dart';

class FloorContent  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            FloorItem1(),
            Column(
              children: <Widget>[
                FloorItem2(),
                FloorItem2()
              ]
            )
          ],
        ),
        Row(
          children: <Widget>[
            FloorItem2(),
            FloorItem2()
          ]
        )
      ],
    );
  }
}