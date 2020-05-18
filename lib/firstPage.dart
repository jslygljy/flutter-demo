import 'package:flutter/cupertino.dart';
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
import 'douban.dart';
import 'each_view.dart';


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin{
  List<Widget> _eachView = List();
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState(){
    _eachView
      ..add(EachView('Home'))
      ..add(EachView('Discover'));
    _tabController = TabController(length: tabs.length, vsync: this);
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[Text('标题1',style: TextStyle(color: Colors.blue),), Text('标题2')],
          ),
        ), 
        elevation: 10.0,
        brightness: Brightness.light,
        centerTitle:true,
        toolbarOpacity:0.5,
        bottomOpacity:0.8,
        titleSpacing:20.0,
        bottom: TabBar(   //生成Tab菜单
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList()
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
      bottomNavigationBar: BottomAppBar(
         color: Colors.blue,
         shape: CircularNotchedRectangle(
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           mainAxisSize: MainAxisSize.max,
           children: <Widget>[
             IconButton(
               icon: Icon(Icons.airplay),
               color: Colors.white,
               onPressed: (){
                  Navigator.push(context, FadeRotationRoute(widget:EachView('滑动过度')));
               },
             ),
             IconButton(
               icon: Icon(Icons.home),
               color: Colors.white,
               onPressed: (){
                 Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
                   return EachView('home');
                 }));
               },
             ),
           ],
         ),
       ),
       floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
       floatingActionButton: FloatingActionButton(
         tooltip:'长按',
         onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context){
             return EachView('home');
           }));
         },
         child: Icon(
           Icons.plus_one
         ),
       ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title:Text(
          'SecondPage',
          style:TextStyle(fontSize: 36.0)
        ),
        backgroundColor: Colors.pinkAccent,
        elevation: 3.0,
        leading:Container(),
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(Icons.navigate_before,color: Colors.white,size: 64.0,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        )
      ),
      
    );
  }
}