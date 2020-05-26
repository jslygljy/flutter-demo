import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperDemo extends StatelessWidget {
  final List swiperList;
  const SwiperDemo({Key key, this.swiperList}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 750,
        height:ScreenUtil().setHeight(333),
        child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return new Image.network("${swiperList[index]}",fit:BoxFit.fill);
          },
          itemCount: swiperList.length,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
        )
    );
  }
}