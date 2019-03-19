import 'package:flutter/material.dart';

class FirstScreenPage extends StatelessWidget{
  final String title;

  const FirstScreenPage({Key key, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("打开新窗口"),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SecondScreenPage();
            }));
          }
        ),
      ),
    );
  }
}

class SecondScreenPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("这是新打开的页面"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("返回上一页面"),
          onPressed: () => Navigator.pop(context)
        ),
      ),
    );
  }
}
