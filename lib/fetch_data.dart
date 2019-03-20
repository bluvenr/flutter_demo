import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchDataPage extends StatelessWidget{
  final String title;

  const FetchDataPage({Key key, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: FutureBuilder<Post>(
            future: fetchPost(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("ID：${snapshot.data.id}"),
                    Text("标题："+snapshot.data.title),
                    Text("作者：${snapshot.data.userId}"),
                    Text("正文："+snapshot.data.body),
                  ],
                );
              }else if(snapshot.hasError){
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            }
          )
        ),
      ),
    );
  }
}

class Post{
  final int userId;
  final int id;
  final String title;
  final String body;

  const Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"]
    );
  }
}

Future<Post> fetchPost() async{
  final response = await http.get("https://jsonplaceholder.typicode.com/posts/1");
  final responseJson = json.decode(response.body);

  return Post.fromJson(responseJson);
}
