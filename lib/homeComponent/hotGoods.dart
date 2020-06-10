import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/service/serveice_method.dart';

GlobalKey<_HotGoodsListState> childKey = GlobalKey();
class HotGoodsList extends StatefulWidget {

  HotGoodsList({
    Key key
  }):super(key:key);

  @override
  _HotGoodsListState createState() => _HotGoodsListState();
}

class _HotGoodsListState extends State<HotGoodsList> {
  int page=1;
  List<Map> hotGoodList = [];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return _goodHotItem();
  }

  Widget _goodHotItem(){
    if(hotGoodList.length!=0){
      List<Widget> listWidget = hotGoodList.map((val){
        return InkWell(
          onTap: (){},
          child: Container(
            width: ScreenUtil().setWidth(370),
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(val['image'],width:ScreenUtil().setWidth(379)),
                Text(
                  val['name'],
                  maxLines: 1,
                  style: TextStyle(color: Colors.pink,fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Text('￥${val['price']}'),
                    Text('￥${val['mallPrice']}',style: TextStyle(
                      color: Colors.black26,
                      decoration: TextDecoration.lineThrough
                    ),)
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing:2,
        children: listWidget,
      );
    }else{
      return Text(
        ''
      );
    }
  }

  getHotGoods() async {
    var formPage = {'page':page};
    final value = await getList(formData: formPage);
      List<Map> newGoodList = List<Map>.from(value);
      setState(()=>{
        hotGoodList.addAll(newGoodList),
        page++
      });
  }
}