import 'package:flutter/material.dart';

class HandlingTapsPage extends StatelessWidget{
  final String title;

  const HandlingTapsPage({Key key, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Builder(
          builder: (BuildContext context){
            return GestureDetector(
              onTap: (){
                final snackBar = SnackBar(
                  content: Text("Hello,Flutter!")
                );

                Scaffold.of(context).showSnackBar(snackBar);
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Text("我的按钮"),
              ),
            );
          },
        )
      ),
    );
  }

}
