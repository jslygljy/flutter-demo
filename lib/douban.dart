import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/model/router.dart';
import 'package:myapp/router/slider/SliderScaleRoute.dart';

import 'each_view.dart';
class DoubanTheatersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣电影',
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: MyHomeApp(title: 'Movies'),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  final String title;

  MyHomeApp({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomeAppState();
  }
}

class _MyHomeAppState extends State<MyHomeApp> {
  List subjects = [];

  @override
  void initState() {
    loadData();
  }

  Future<String> _loadAStudentAsset() async {
    return await DefaultAssetBundle.of(context).loadString('lib/assets/router.json');
  }

  loadData() async {
    String jsonString = await _loadAStudentAsset();
    final jsonResponse = json.decode(jsonString);
    print(jsonResponse);
    SomeRootEntity res = new SomeRootEntity.fromJson(jsonResponse);
    print(res.list);
    setState(() {
      subjects = res.list;
    });
    print(subjects);
    print(subjects.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('name'),
      ),
      body: getBody(),
    );
  }
  getItem(var subject) {
    
//    演员列表
    var avatars = List.generate(subject['list'].length, (int index) =>
        Container(
          margin: EdgeInsets.only(left: index.toDouble() == 0.0 ? 0.0 : 16.0),
          // child: CircleAvatar(
          //     backgroundColor: Colors.white10,
          //     backgroundImage: NetworkImage(
          //         subject['casts'][index]['avatars']['small']
          //     )
          // ),
          child:RaisedButton(
            child: Text(subject['list'][index]['router_name']),
            onPressed: (){
              // Navigator.push(context, SliderScaleRoute(widget:EachView('滑动+缩放过度')));
            },
          )
        ),
    );
    var row = Container(
       margin: EdgeInsets.only(top: 8.0),
        child: Row(
          children: <Widget>[
            Text('主演：'),
            Row(
              children: avatars,
            ),
          ],
        ),
     );
    return Card(
      child: row,
    );
  }

  getBody() {
    if (subjects.length != 0) {
      return ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (BuildContext context, int position) {
            return getItem(subjects[position]);
          });
    } else {
      // 加载菊花
      return CupertinoActivityIndicator();
    }
  }


}