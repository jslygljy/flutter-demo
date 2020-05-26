import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/gridView.dart';
import 'package:myapp/service/serveice_method.dart';
import 'package:myapp/swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('首页')
      ),
      body: 
        FutureBuilder(
          future: getHomePageContent(),
          builder: (context,AsyncSnapshot snapshot){ 
            if(snapshot.hasData){
              return Column(
                  children: <Widget>[
                    SwiperDemo(swiperList:snapshot.data.slides),
                    TopNavigator(navigatorList:snapshot.data.category)
                  ],
              );
            }else{
              return Center(
                child: Text('加载中...'),
              );
            }
            
          }
        )
    );
  }
}