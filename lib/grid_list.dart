import 'package:flutter/material.dart';

class GridListPage extends StatelessWidget{
  final String title;

  const GridListPage({Key key, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(100, (index) {
          return Center(
            child: Text(
              "${index+1}",
              style: Theme.of(context).textTheme.headline,
            ),
          );
        }),
      ),
    );
  }
}