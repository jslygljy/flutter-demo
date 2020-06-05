import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class RecomendDemo extends StatelessWidget {
  final List recommendList;

  const RecomendDemo({Key key, this.recommendList}) : super(key: key);

  // 标题
  Widget _titleWidget(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color:Colors.white,
        border:Border(
          bottom: BorderSide(width: 1,color: Colors.black12)
        )
      ),
      child: Text(
        '精品推荐',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  // 没规格商品
  Widget _shopsItem(index){
    return InkWell(
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setHeight(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5,color: Colors.white)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index].image),
            Text("${recommendList[index].mallPrice}"),
            Text("${recommendList[index].price}",
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 列表
  Widget _rowList(){
    return Container(
      height: ScreenUtil().setHeight(330),
      margin: EdgeInsets.only(top:10.0),
      child: ListView.builder(
         itemCount: recommendList.length,
         scrollDirection: Axis.horizontal,
         itemBuilder: (context,index){
           return _shopsItem(index);
         },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(400),
      margin: EdgeInsets.only(top:8.0),
      child: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              _titleWidget(),
              _rowList()
            ],
        )
      )
    );
  }
}