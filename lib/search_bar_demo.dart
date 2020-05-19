import 'package:flutter/material.dart';

const searchList = [
  '1fjk',
  '123v',
  'vjcklxje3'
];

const recentSuggest = [
  'tuijian1',
  'tuijian2'
];

class SearchBarDemo extends StatefulWidget {
  @override
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('搜索条demo'),
        actions:<Widget>[
          IconButton(
            icon:Icon(Icons.search),
            onPressed: (){
              showSearch(context:context,delegate:searchBarDelegate());
            },
          )
        ]
      ),
    );
  }
}
class searchBarDelegate extends SearchDelegate<String>{

  // 重写右边按钮
  @override
  List<Widget> buildActions(BuildContext context){
    return [IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query="";
        },
    )];
  }

  // 重写左边按钮
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon:AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,progress: transitionAnimation,
      ),
      onPressed: (){close(context,null);},
    );
  }
  
  // 重写搜索结果
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query)
        ),
      ),
    );
  }

  // 重写搜索建议
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recentSuggest:searchList.where((input) => input.startsWith(query)).toList();

    return ListView.builder(
      itemCount:suggestionList.length,
      itemBuilder: (context,index)=>ListTile(
        title: RaisedButton(
          child: Row(
            children: <Widget>[Text(
            suggestionList[index].substring(0,query.length),
            style:TextStyle(
              color:Colors.black
            )
          ), Text(
            suggestionList[index].substring(query.length),
            style:TextStyle(
              color:Colors.grey
            )
          )],
          ),
          onPressed: () {  },
        ),
      ),
    );
  }
}