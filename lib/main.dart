import 'package:flutter/material.dart';
import 'package:my_flutter_app/animated_list.dart';
import 'package:my_flutter_app/app_bar_bottom.dart';
import 'package:my_flutter_app/basic_appbar.dart';
import 'package:my_flutter_app/expansion_tiles.dart';
import 'package:my_flutter_app/network_image.dart';
import 'package:my_flutter_app/random_words.dart';
import 'package:my_flutter_app/tabbed_appbar.dart';

void main() => runApp(new MyApp());

class MyRoute{
  final String name;
  final String path;
  final WidgetBuilder widgetBuilder;

  const MyRoute({@required this.name, @required this.path, @required this.widgetBuilder});
}

final List<MyRoute> myRoutesList = <MyRoute>[
  MyRoute(name: "随机字符串列表", path: "/random_words", widgetBuilder: (content) => RandomWords(title:"随机字符串列表")),
  MyRoute(name: "动画列表", path: "/animated_list", widgetBuilder: (content) => AnimatedListPage(title:"动画列表")),
  MyRoute(name: "自定义底部Widget的Appbar", path: "/app_bar_bottom", widgetBuilder: (content) => AppBarBottomPage(title: "自定义底部Widget的Appbar")),
  MyRoute(name: "基础AppBar", path: "/basic_appbar", widgetBuilder: (content) => BasicAppBarPage(title: "基础AppBar")),
  MyRoute(name: "二级或多级列表", path: "/expansion_tiles", widgetBuilder: (content) => ExpansionTilesPage(title: "二级或多级列表")),
  MyRoute(name: "选项卡式的AppBar", path: "/tabbed_appbar", widgetBuilder: (content) => TabbedAppBarPage(title: "选项卡式的AppBar")),
  MyRoute(name: "显示网络图片", path: "/network_image", widgetBuilder: (content) => NetworkImagePage(title: "显示网络图片")),
];

class MyApp extends StatelessWidget {

  final Map<String, WidgetBuilder> _myRoutes = Map<String, WidgetBuilder>.fromIterable(
    myRoutesList,
    key: (dynamic myRoute) => myRoute.path,
    value: (dynamic myRoute) => myRoute.widgetBuilder,
  );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Dome App",
      theme: new ThemeData(primaryColor: Colors.white),
      home: HomePage(),
      routes: _myRoutes,
//      showPerformanceOverlay: true,
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("我的Demo应用"),
        ),
        body: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: myRoutesList.map((route){
              return ListTile(
                  title: Text(route.name),
                  leading: Text((myRoutesList.indexOf(route) + 1).toString()),
                  onTap: () {
                    Navigator.pushNamed(context, route.path);
                  }
              );
            })
          ).toList(),
        ),
      ),
    );
  }
}
