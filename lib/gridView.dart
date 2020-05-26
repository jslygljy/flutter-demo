import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TopNavigator extends StatelessWidget {
  final List navigatorList;

  const TopNavigator({Key key, this.navigatorList}) : super(key: key);
  Widget _gridViewItemUI(BuildContext context,item){
    return InkWell(
      onTap: (){

      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Image.network(item.image,width: ScreenUtil().setWidth(95)),
            Text(item.text)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300),
      child: GridView.count(
        crossAxisCount: 4,
        children: navigatorList.map((item) {
            return _gridViewItemUI(context,item);
          }).toList()
        ,
      ),
    );
  }
}