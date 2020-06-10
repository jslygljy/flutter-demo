import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/category_page.dart';
import 'package:myapp/firstPage.dart';
import 'package:myapp/home_page.dart';
import 'package:myapp/warpdemo.dart';

class Index_page extends StatefulWidget {
  @override
  _Index_pageState createState() => _Index_pageState();
}

class _Index_pageState extends State<Index_page> {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.home),
      title:Text('首页')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.search),
      title:Text('分类')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.shopping_cart),
      title:Text('购物车')
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.profile_circled),
      title:Text('会员中心')
    )
  ];

  final List<Widget> tabBodyList = [
    HomePage(),
    Category_page(),
    FirstPage(),
    WarpDemo()
  ];
  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage=tabBodyList[currentIndex];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex=index;
            currentPage=tabBodyList[currentIndex];
          });
        },
      ),
      body:  IndexedStack(
        index: currentIndex,
        children: tabBodyList,
      )
    );
  }
}