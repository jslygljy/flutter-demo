import 'package:flutter/material.dart';
import 'package:myapp/router/RotationSizeRoute.dart';
import 'package:myapp/router/fade/FadeRotationRoute.dart';
import 'package:myapp/router/fade/FadeScaleRoute.dart';
import 'package:myapp/router/fade/FadeSizeRoute.dart';
import 'package:myapp/router/fade/FadeSliderRoute.dart';
import 'package:myapp/router/scale/ScaleRoationRoute.dart';
import 'package:myapp/router/scale/ScaleSizeRoute.dart';
import 'package:myapp/router/slider/SliderRotationRoute.dart';
import 'package:myapp/router/slider/SliderScaleRoute.dart';
import 'package:myapp/router/slider/SliderSizeRoute.dart';

import 'each_view.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Container(
          child: Row(
            children: <Widget>[Text('动画标题')],
          ),
        ), 
      ),
      body: Center(
        child:Column(
          children: <Widget>[
            RaisedButton(
              child: Text('滑动+缩放 过度'),
              onPressed: (){
                Navigator.push(context, SliderScaleRoute(widget:EachView('滑动+缩放过度')));
              },
            ),
            RaisedButton(
              child: Text('滑动+旋转 过度'),
              onPressed: (){
                Navigator.push(context, SliderRotationRoute(widget:EachView('滑动+旋转过度')));
              },
            ),
            RaisedButton(
              child: Text('滑动+大小 过度'),
              onPressed: (){
                Navigator.push(context, SliderSizeRoute(widget:EachView('滑动+大小过度')));
              },
            ),
            RaisedButton(
              child: Text('缩放+旋转过度'),
              onPressed: (){
                Navigator.push(context, ScaleRoationRoute(widget:EachView('缩放+旋转过度')));
              },
            ),
            RaisedButton(
              child: Text('缩放+大小过度'),
              onPressed: (){
                Navigator.push(context, ScaleSizeRoute(widget:EachView('缩放+大小过度')));
              },
            ),
            RaisedButton(
              child: Text('旋转+大小过度'),
              onPressed: (){
                Navigator.push(context, RotationSizeRoute(widget:EachView('旋转+大小过度')));
              },
            ),
            RaisedButton(
              child: Text('渐变+滑动过度'),
              onPressed: (){
                Navigator.push(context, FadeSliderRoute(widget:EachView('渐变+滑动过度')));
              },
            ),
            RaisedButton(
              child: Text('渐变+缩放过度'),
              onPressed: (){
                Navigator.push(context, FadeScaleRoute(widget:EachView('渐变+滑动过度')));
              },
            ),
            RaisedButton(
              child: Text('渐变+旋转过度'),
              onPressed: (){
                Navigator.push(context, FadeRotationRoute(widget:EachView('渐变+滑动过度')));
              },
            ),
            RaisedButton(
              child: Text('渐变+大小过度'),
              onPressed: (){
                Navigator.push(context, FadeSizeRoute(widget:EachView('渐变+大小过度')));
              },
            ),
          ],
        )
      ),
    );
    
  }
}