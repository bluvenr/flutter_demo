import 'package:flutter/material.dart';

class BasicAppBarPage extends StatefulWidget{
  final String title;

  const BasicAppBarPage({Key key, this.title}):super(key:key);

  @override
  State<StatefulWidget> createState() => BasicAppBarState();
}

class BasicAppBarState extends State<BasicAppBarPage>{
  Choice _nowChoice = choices[0];

  void _selectIcon(Choice choice){
    setState(() {
      _nowChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(choices[0].icon),
            onPressed: () => _selectIcon(choices[0]),
          ),
          IconButton(
            icon: Icon(choices[1].icon),
            onPressed: () => _selectIcon(choices[1]),
          ),
          PopupMenuButton<Choice>(
            onSelected: _selectIcon,
            itemBuilder: (BuildContext context){
              return choices.skip(2).map((Choice choice){
                return PopupMenuItem<Choice>(
                  value: choice,
                  child: ListTile(
                    leading: Icon(choice.icon),
                    title: Text(choice.title),
                  ),
                );
              }).toList();
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  _nowChoice.icon,
                  size: 128,
                  color: textStyle.color,
                ),
                Text(_nowChoice.title, style: textStyle)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Choice{
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

const List<Choice> choices = [
  const Choice(title: "item1", icon: Icons.add_alert),
  const Choice(title: "item2", icon: Icons.add),
  const Choice(title: "item3", icon: Icons.access_time),
  const Choice(title: "item4", icon: Icons.account_circle),
  const Choice(title: "item5", icon: Icons.adb),
  const Choice(title: "item6", icon: Icons.map),
  const Choice(title: "item7", icon: Icons.favorite),
  const Choice(title: "item8", icon: Icons.card_travel),
  const Choice(title: "item9", icon: Icons.alternate_email),
];
