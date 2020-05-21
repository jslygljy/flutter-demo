import 'package:flutter/material.dart';
import './firstPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()=> {
  runApp(new Myapp())
};


class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        primarySwatch:Colors.blue
      ),
      home: FirstPage(),
    );
  }
}