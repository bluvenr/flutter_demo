import 'dart:async';

import 'package:flutter/material.dart';

class DropDownRefreshLoadPage extends StatefulWidget{
  final String title;

  const DropDownRefreshLoadPage({Key key, this.title}):super(key:key);

  @override
  State<StatefulWidget> createState() => _DropDownRefreshLoadSate();
}

class _DropDownRefreshLoadSate extends State<DropDownRefreshLoadPage>{

  List<String> list = List.generate(10, (index){
    return "item ${index + 1}";
  });

  Future<Null> _refreshList() {
    final Completer<Null> comparable = new Completer<Null>();

    new Timer(Duration(seconds: 3), (){
      setState(() {
        final _count = list.length;
        list.insertAll(0, List.generate(5, (index){
          return "item ${_count + index + 1}";
        }));
      });

      comparable.complete(null);
    });

    return comparable.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: Text("${index+1}", style: Theme.of(context).textTheme.title.copyWith(fontSize: 16)),
                title: Text(list[index]),
              );
            },
          ),
          onRefresh: _refreshList
      ),
    );
  }
}
