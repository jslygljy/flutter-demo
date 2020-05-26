import 'package:flutter/material.dart';
import 'package:myapp/homeComponent/ad.dart';
import 'package:myapp/homeComponent/gridView.dart';
import 'package:myapp/homeComponent/recommend.dart';
import 'package:myapp/homeComponent/swiper.dart';
import 'package:myapp/service/serveice_method.dart';

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
              final String adpickture = 'https://www.baidu.com/img/pc_cc75653cd975aea6d4ba1f59b3697455.png';
              final String phoneNumber = '18115664382';
              return Column(
                  children: <Widget>[
                    SwiperDemo(swiperList:snapshot.data.slides),
                    TopNavigator(navigatorList:snapshot.data.category),
                    AdDemo(adpicture:adpickture,phoneNumber:phoneNumber),
                    RecomendDemo(recommendList:snapshot.data.recommendList)
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