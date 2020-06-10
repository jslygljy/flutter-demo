import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloorItem1 extends StatelessWidget {
  final Map itemInfo;

  const FloorItem1({Key key, this.itemInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(375),
      height: ScreenUtil().setHeight(400),
      decoration: BoxDecoration(
         gradient: LinearGradient(
          colors: [Color.fromRGBO(251,246,246,1.0), Color.fromRGBO(249, 240, 239, 1.0)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '汉江(兰博色)51&'
          ),
          Flex(
            crossAxisAlignment: CrossAxisAlignment.center,//子组件的在交叉轴的对齐方式为起点
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: <Widget>[
              Text(
                  '儒雅中国 (蓝色汉江)'
              ),
              Text(
                '￥ 350'
              ),
            ],
          ),
          Image.network('https://static-oss.qutoutiao.net/png/WX20200528-173604.png')
        ],
      ),
    );
  }
}