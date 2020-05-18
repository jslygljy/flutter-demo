import 'package:flutter/material.dart';

class DemoItem extends StatefulWidget{
  @override
  _DemoItem createState()=> _DemoItem();
  }
  

class _DemoItem extends State<DemoItem>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
          child: new Text('Hello World'),
      ),
    );
  }
}