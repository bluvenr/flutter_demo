import 'package:flutter/material.dart';
import 'package:my_flutter_app/animated_list.dart';
import 'package:my_flutter_app/app_bar_bottom.dart';
import 'package:my_flutter_app/basic_appbar.dart';
import 'package:my_flutter_app/dismissible.dart';
import 'package:my_flutter_app/expansion_tiles.dart';
import 'package:my_flutter_app/grid_list.dart';
import 'package:my_flutter_app/handling_taps.dart';
import 'package:my_flutter_app/mixed_list.dart';
import 'package:my_flutter_app/navigation_basics.dart';
import 'package:my_flutter_app/network_image.dart';
import 'package:my_flutter_app/passing_data.dart';
import 'package:my_flutter_app/random_words.dart';
import 'package:my_flutter_app/returning_data.dart';
import 'package:my_flutter_app/ripples.dart';
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
  MyRoute(name: "多类型子项列表", path: "/mixed_list", widgetBuilder: (content) => MixedListPage(title: "多类型子项列表")),
  MyRoute(name: "网格列表", path: "/grid_list", widgetBuilder: (content) => GridListPage(title: "网格列表")),
  MyRoute(name: "处理Taps", path: "/handling_taps", widgetBuilder: (content) => HandlingTapsPage(title: "处理Taps")),
  MyRoute(name: "添加Material触摸水波效果", path: "/ripples", widgetBuilder: (content) => RipplesPage(title: "添加Material触摸水波效果")),
  MyRoute(name: "滑动关闭列表项", path: "/dismissible", widgetBuilder: (content) => DismissiblePage(title: "滑动关闭列表项")),
  MyRoute(name: "导航到新页面并返回", path: "/navigation_basics", widgetBuilder: (content) => FirstScreenPage(title: "导航到新页面并返回")),
  MyRoute(name: "给新页面传值", path: "/passing_data", widgetBuilder: (content) => PassingDataPage(title: "给新页面传值")),
  MyRoute(name: "从新页面返回数据给上一个页面", path: "/returning_data", widgetBuilder: (content) => ReturningDataPage(title: "从新页面返回数据给上一个页面")),
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
      theme: new ThemeData(primaryColor: Colors.white).copyWith(platform: TargetPlatform.iOS),
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
