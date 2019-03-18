import 'package:flutter/material.dart';


final items = List<String>.generate(20, (i) => "Item ${i+1}");

class DismissiblePage extends StatelessWidget{
  final String title;

  const DismissiblePage({Key key, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            final item = items[index];

            return Dismissible(
                key: Key(item),
                onDismissed: (direction){
                  items.removeAt(index);

                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Hello, Fullter! -- $item")));
                },
                background: Container(color: Colors.red),
                child: ListTile(title: Text(item))
            );
          }
      ),
    );
  }
}
