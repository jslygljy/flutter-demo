import 'package:flutter/material.dart';

class Discover extends StatefulWidget {

  @override
  _Discover createState() => _Discover();
}

class _Discover extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('discover'),
      ),
      body: Container(
        child: Center(
          child: Text('discover'),
        ),
      ),
    );
  }
}