import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:myapp/homeComponent/ad.dart';
import 'package:myapp/homeComponent/floorContent.dart';
import 'package:myapp/homeComponent/gridView.dart';
import 'package:myapp/homeComponent/hotGoods.dart';
import 'package:myapp/homeComponent/recommend.dart';
import 'package:myapp/homeComponent/swiper.dart';
import 'package:myapp/likeButton/like_button.dart';
import 'package:myapp/service/serveice_method.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(); 
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller;
  // @override
  bool get wantKeepAlive =>true;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title:Text('首页')
      ),
      body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context,AsyncSnapshot snapshot){ 
            if(snapshot.hasData){
              final String adpickture = 'https://www.baidu.com/img/pc_cc75653cd975aea6d4ba1f59b3697455.png';
              final String phoneNumber = '18115664382';
              return EasyRefresh(
                  child:ListView(
                    children: <Widget>[
                      SwiperDemo(swiperList:snapshot.data.slides),
                      TopNavigator(navigatorList:snapshot.data.category),
                      AdDemo(adpicture:adpickture,phoneNumber:phoneNumber),
                      RecomendDemo(recommendList:snapshot.data.recommendList),
                      FloorContent(),
                      LikeButton(width: 50),
                      HotGoodsList(key: childKey)
                    ]
                  ),
                  onLoad: () async{
                    childKey.currentState.getHotGoods();
                  },
                  footer: MaterialFooter(
                      
                  ),
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