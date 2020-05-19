import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network('https://pics7.baidu.com/feed/4bed2e738bd4b31cc58d95c6698b89799f2ff8fa.jpeg?token=efb9b32e5b1da7a210f251bd0749ba1e')
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter:ImageFilter.blur(sigmaX:10.0,sigmaY:5.0),
                child: Opacity(
                  opacity: 0.2,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}