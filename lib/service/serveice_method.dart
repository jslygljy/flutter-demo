import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:myapp/model/home.dart';
import 'package:myapp/service/serveice_url.dart';


// 获取首页内容
Future getHomePageContent() async{
    Dio dio = new Dio();
    Response response = await dio.get(servicePath['homePageContent'],
      options: new Options(
        responseType: ResponseType.json
      ), 
    );
    if(response.statusCode==200){
      var result = json.decode(response.toString());
      return HomeModel.fromJson(result);
    }else{
      throw Exception('接口错误');
    }

} 

// 获取mock内容
Future getMockPageContent() async{
    try{
      Dio dio = new Dio();
      Response response = await dio.get(servicePath['homePageContent']);
      print(response);
    }catch(e){
      print(e);
    }
} 

