import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NetworkImagePage extends StatelessWidget{

  final String title;

  const NetworkImagePage({Key key, @required this.title}):super(key:key);

  Widget getImageWidget(MyImage img){
    if(img.type == "transparent"){
      return FadeInImage.assetNetwork(
        placeholder: "resource/images/default.gif",
        image: img.url,
      );
    } else if(img.type == "cached"){
      return CachedNetworkImage(
        imageUrl: img.url,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error)
      );
//      return Image(image: new CachedNetworkImageProvider(img.url));
    } else {
      return Image.network(img.url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.all(10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  getImageWidget(images[index]),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(images[index].title),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

class MyImage{
  final String title;
  final String url;
  final String type;

  const MyImage({this.title, @required this.url, this.type="default"});
}

const List<MyImage> images = <MyImage>[
  MyImage(title: "unsplash-图片1 (普通加载)", url: "https://images.unsplash.com/photo-1552601719-20a552044dc4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
  MyImage(title: "unsplash-图片2 (普通加载)", url: "https://images.unsplash.com/photo-1552571219-d6e38a3f4849?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
  MyImage(title: "unsplash-图片3 (占位符加载)", type: "transparent", url: "https://images.unsplash.com/photo-1552582305-6b778426ab60?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
  MyImage(title: "unsplash-图片4 (占位符加载)", type: "transparent", url: "https://images.unsplash.com/photo-1552581000-b0cfbbedc2a2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
  MyImage(title: "unsplash-图片5 (占位符加载)", type: "transparent", url: "https://images.unsplash.com/photo-1552622175-99cca9acf74d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
  MyImage(title: "unsplash-图片6 (缓存加载)", type: "cached", url: "https://images.unsplash.com/photo-1552604730-378f127db7ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
  MyImage(title: "unsplash-图片7 (缓存加载)", type: "cached",  url: "https://images.unsplash.com/photo-1552560880-2482cef14240?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
  MyImage(title: "unsplash-图片8 (缓存加载)", type: "cached",  url: "https://images.unsplash.com/photo-1552564835-07e1379e9708?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
  MyImage(title: "unsplash-图片9 (缓存加载)", type: "cached",  url: "https://images.unsplash.com/photo-1552609034-76491875a0e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
  MyImage(title: "unsplash-图片10 (缓存加载)", type: "cached",  url: "https://images.unsplash.com/photo-1552576028-d867f497a296?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
];
