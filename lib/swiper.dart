import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      body: Container(
        width:750,
        height:ScreenUtil().setHeight(300),
        child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return new Image.network("http://via.placeholder.com/750x350",fit:BoxFit.fill);
          },
          itemCount: 3,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
        )
      ),
    );
  }
}