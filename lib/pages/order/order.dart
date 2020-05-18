import 'package:flutter/material.dart';

class Orders extends StatefulWidget {

  @override
  _Orders createState() => _Orders();
}

class _Orders extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('order'),
      ),
      body: Container(
        child: Center(
          child: Text('order'),
        ),
      ),
    );
  }
}