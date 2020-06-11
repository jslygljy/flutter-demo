
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/model/category.dart';
import 'package:myapp/service/serveice_method.dart';
import 'package:provider/provider.dart';

import 'provide/counter.dart';

class Category_page extends StatefulWidget {
  @override
  _Category_pageState createState() => _Category_pageState();
}

class _Category_pageState extends State<Category_page> {
  List categorylist = [];

  @override
  void initState() {
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('首页')
      ),
      body: Container(
        width:ScreenUtil().setWidth(180),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1,color: Colors.black12)
          )
        ),
        child: ListView.builder(
        itemCount: categorylist.length,
        itemBuilder: (context,index){
          return _leftInkell(index,context);
        },
        )
      )
    );
  }

  Widget _leftInkell(int index,BuildContext context){
    return InkWell(
      onTap: () => context.read<Counter>().increment(),
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(top:20,left:10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 2,color: Colors.black12)
          )
        ),
        child: Text(
          '${categorylist[index].name}+${context.watch<Counter>().value}',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),

          ),
        ),
      ),
    );
  }

  void _getCategory() async{
    final value = await getCateGoryList();
      CategoryModel list = CategoryModel.fromJson(value);

      // List<Map> newGoodList = List<Map>.from(value);
      setState(()=>{
        categorylist = list.data,
      });
  }
}