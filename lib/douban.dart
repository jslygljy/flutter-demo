import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myapp/model/router.dart';

class DoubanTheatersWidget extends StatefulWidget {
  @override
  _DoubanTheatersWidgetState createState() => _DoubanTheatersWidgetState();
}

class _DoubanTheatersWidgetState extends State<DoubanTheatersWidget> {
  List subjects = [];
  @override
  void initState() { 
    loadData();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('123'),
      ),
      body: Center(
        child: getBody(),
      ),
    );
  }

  Future<String> _loadAStudentAsset() async {
    return await DefaultAssetBundle.of(context).loadString('lib/assets/router.json');
  }

  loadData() async {
    String jsonString = await _loadAStudentAsset();
    final jsonResponse = json.decode(jsonString);
    SomeRootEntity res = new SomeRootEntity.fromJson(jsonResponse);
    setState(() {
      subjects = res.list;
    });
  }
  getItem(var subject) {
    print(subject.toJson());
    // var row = Container(
    //    margin: EdgeInsets.only(top: 8.0),
    //     child: Container(
    //         alignment: Alignment.center,
    //         child: Text(subject.router_name),
    //     ),
    //  );
    // return Card(
    //   child: row,
    // );
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