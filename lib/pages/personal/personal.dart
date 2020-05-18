import 'package:flutter/material.dart';

class Personal extends StatefulWidget {

  @override
  _Personal createState() => _Personal();
}

class _Personal extends State<Personal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('personal'),
      ),
      body: Container(
        child: Center(
          child: Text('personal'),
        ),
      ),
    );
  }
}