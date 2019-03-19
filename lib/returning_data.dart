import 'package:flutter/material.dart';

class ReturningDataPage extends StatelessWidget{
  final String title;

  const ReturningDataPage({Key key, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Builder(builder: (context){
          return RaisedButton(
              child: Text("打开新页面"),
              onPressed: () => _navigateAndDisplaySelection(context)
          );
        }),
      )
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionScreen()));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("$result")));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新开页面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                child: Text("说'你好'"),
                onPressed: () => Navigator.pop(context, '你好'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                child: Text("说'晚安'"),
                onPressed: () => Navigator.pop(context, '晚安'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
