import 'package:flutter/material.dart';

class RipplesPage extends StatelessWidget{
  final String title;

  const RipplesPage({Key key, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Builder(
            builder: (BuildContext context){
              return InkWell(
                onTap: (){
                  final snackBar = SnackBar(content: Text("Hello,Flutter!"));
                  Scaffold.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text("Say Hello"),
                ),
              );
            }
        ),
      ),
    );
  }
}