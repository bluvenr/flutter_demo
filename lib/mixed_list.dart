import 'package:flutter/material.dart';

class MixedListPage extends StatelessWidget{
  final String title;

  const MixedListPage({Key key, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: items.length,
        itemBuilder: (context, index){
          final _item = items[index];
          if(_item is HeadingItem){
            return ListTile(
              title: Text(
                  _item.title,
                  style: Theme.of(context).textTheme.headline
              ),
            );
          }else if(_item is MessageItem){
            return ListTile(
              title: Text(_item.title),
              subtitle: Text(_item.subtitle),
            );
          }
        }
      ),
    );
  }
}

abstract class ListItem{}

class HeadingItem implements ListItem{
  final String title;

  const HeadingItem(this.title);
}

class MessageItem implements ListItem{
  final String title;
  final String subtitle;

  const MessageItem(this.title, this.subtitle);
}

final List<ListItem> items = List<ListItem>.generate(
    100,
    (i) => i % 6 == 0
        ? HeadingItem("title-$i") :
        MessageItem("title-$i", "subtitle-$i")
    );
