import 'package:flutter/material.dart';
import 'package:myapp/index.dart';
import 'package:myapp/provide/counter.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_)=> Counter()),
      ],
      child:Myapp()
    ),
  );
}


class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        primarySwatch:Colors.blue
      ),
      home: Index_page(),
    );
  }
}