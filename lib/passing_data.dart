import 'package:flutter/material.dart';

class PassingDataPage extends StatelessWidget{
  final String title;

  const PassingDataPage({Key key, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView(
        children: todos.map((todo){
          return ListTile(
            title: Text(todo.title),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(todo:todo)));
            },
          );
        }).toList(),
      ),
    );
  }
}

class Todo{
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

final todos = List<Todo>.generate(20, (i){
  return Todo("title-$i", "这里是简介*************** $i");
});

class DetailScreen extends StatelessWidget{
  final Todo todo;

  const DetailScreen({Key key, @required this.todo}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(todo.description),
        ),
      ),
    );
  }
}
