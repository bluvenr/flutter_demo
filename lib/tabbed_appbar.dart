import 'package:flutter/material.dart';

class TabbedAppBarPage extends StatelessWidget{
  final String title;

  const TabbedAppBarPage({Key key, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(this.title),
            bottom: TabBar(
              isScrollable: true,
              tabs: choices.map((choice){
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList()
            ),
          ),
          body: TabBarView(
              children: choices.map((choice){
                TextStyle textStyle = Theme.of(context).textTheme.display1;
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(choice.icon, size: 180, color: textStyle.color),
                          Text(choice.title, style: textStyle)
                        ],
                      ),
                  )
                  ),
                );
              }).toList()
          ),
        )
    );
  }
}

class Choice{
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: "item1", icon: Icons.account_box),
  Choice(title: "item2", icon: Icons.favorite),
  Choice(title: "item3", icon: Icons.access_time),
  Choice(title: "item4", icon: Icons.ac_unit),
  Choice(title: "item5", icon: Icons.build),
  Choice(title: "item6", icon: Icons.access_alarms),
  Choice(title: "item7", icon: Icons.add_comment),
  Choice(title: "item8", icon: Icons.adjust),
  Choice(title: "item9", icon: Icons.airplay),
  Choice(title: "item10", icon: Icons.assessment),
  Choice(title: "item11", icon: Icons.assistant_photo),
  Choice(title: "item12", icon: Icons.beach_access),
];
