
import 'package:dio/dio.dart';
import 'package:myapp/service/serveice_url.dart';


// 获取首页内容
Future getHomePageContent() async{
    
    Dio dio = new Dio();
    var formData = {'name':1};
    Response response = await dio.post(servicePath['homePageContent'],data:formData);
    print(response);

} 

// 获取mock内容
Future getMockPageContent() async{
    try{
      Dio dio = new Dio();
      Response response = await dio.get(servicePath['mockPageContent']);
      print(response);
    }catch(e){
      print(e);
    }
} 

