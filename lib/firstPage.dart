import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/animation.dart';
import 'package:myapp/filter.dart';
import 'package:myapp/home_page.dart';
import 'package:myapp/search_bar_demo.dart';
import 'package:myapp/warpdemo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'each_view.dart';


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with SingleTickerProviderStateMixin{
  List<Widget> _eachView = List();
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];
  int _counter = 0;

  // @override
  // bool get wantKeepAlive => true;

  void _incrementControl (){
    setState(() {
      _counter++;
    });
  }

  @override
  void initState(){
    _eachView
      ..add(EachView('Home'))
      ..add(EachView('Discover'));
    _tabController = TabController(length: tabs.length, vsync: this);
      super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed:(){ Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (BuildContext context){
                  return SearchBarDemo();
                })
            );}
          )
        ],
        bottom: TabBar(   //生成Tab菜单
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList()
        ),
      ),
      body:
          TabBarView(
            controller: _tabController,
            children: tabs.map((e){
              return Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(e,textScaleFactor: 5),
                    Text('$_counter',textScaleFactor: 5),
                    
                  ],
                )
              );
            }).toList(),
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
                  Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
                   return AnimationDemo();
                 }));
               },
             ),
             IconButton(
               icon: Icon(Icons.home),
               color: Colors.white,
               onPressed: (){
                 Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
                   return FrostedDemo();
                 }));
               },
             ),
             IconButton(
               icon: Icon(Icons.accessibility),
               color: Colors.white,
               onPressed: (){
                 Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
                   return HomePage();
                 }));
               },
             ),
             IconButton(
               icon: Icon(Icons.access_alarm),
               color: Colors.white,
               onPressed: (){
                 Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context){
                   return WarpDemo();
                 }));
               },
             )
           ],
         ),
       ),
       floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,
       floatingActionButton: FloatingActionButton(
         tooltip:'长按',
         onPressed: (){
           _incrementControl();
          //  getHomePageContent();
         },
         child: Icon(
           Icons.plus_one
         ),
       ),
    );
  }
}