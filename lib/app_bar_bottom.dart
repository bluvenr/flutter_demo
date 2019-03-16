
import 'package:flutter/material.dart';

class AppBarBottomPage extends StatefulWidget{
  final String title;
  const AppBarBottomPage({Key key, @required this.title}):assert(title != null),super(key:key);

  @override
  State<StatefulWidget> createState() => AppBarBottomState();

}

class AppBarBottomState extends State<AppBarBottomPage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = new TabController(length: choices.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta){
    final int newIndex = _tabController.index + delta;
    if(newIndex < 0 || newIndex >= _tabController.length) return;
    _tabController.animateTo(newIndex);

    /*if(newIndex < 0) {
      _tabController.animateTo(_tabController.length - 1);
    }else if(newIndex >= _tabController.length){
      _tabController.animateTo(0);
    }else {
      _tabController.animateTo(newIndex);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => _nextPage(-1)
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () => _nextPage(1),
          ),
        ],
        bottom: PreferredSize(
            child: Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.black),
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  child: TabPageSelector(controller: _tabController),
                )
            ),
            preferredSize: Size.fromHeight(48)
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: choices.map((Choice choice) {
          return Padding(
            padding: EdgeInsets.all(9),
            child: ChoiceBox(choice: choice),
          );
        }).toList(),
      ),
    );
  }

}

class ChoiceBox extends StatelessWidget{
  final Choice choice;

  const ChoiceBox({Key key, this.choice}):super(key:key);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(choice.icon, size: 128, color: textStyle.color),
            Text(choice.title, style: textStyle)
          ],
      )
      ),
    );
  }

}

class Choice{
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

final List<Choice> choices = <Choice>[
  const Choice(title: "item1", icon: Icons.directions_car),
  const Choice(title: "item2", icon: Icons.title),
  const Choice(title: "item3", icon: Icons.map),
  const Choice(title: "item4", icon: Icons.build),
  const Choice(title: "item5", icon: Icons.favorite),
  const Choice(title: "item6", icon: Icons.ac_unit)
];
