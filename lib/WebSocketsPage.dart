import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

class WebSocketsPage extends StatefulWidget{
  final String title;

  const WebSocketsPage({Key key, this.title}):super(key:key);

  @override
  WebSocketsState createState() => WebSocketsState();
}

class MyMessage{
  final DateTime created;
  final String content;

  const MyMessage(this.created, this.content);
}

class WebSocketsState extends State<WebSocketsPage>{
  final TextEditingController _editingController = TextEditingController();
  final WebSocketChannel channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  List<MyMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.down,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              StreamBuilder(
                stream: channel.stream,
                builder: (context, snapshot){
                  if(snapshot.hasError){
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text("${snapshot.error}")));
                  }else if(snapshot.hasData){
                    messages.add(MyMessage(DateTime.now(), snapshot.data));
                  }

                  return Container(
                    height: 400,
                    child: ListView.separated(
                      padding: EdgeInsets.all(1),
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: messages.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          title: Text(
                            messages[index].created.toIso8601String(),
                            style: Theme.of(context).textTheme.title.copyWith(fontSize: 12),
                          ),
                          subtitle: Text(
                              messages[index].content,
                              style: Theme.of(context).textTheme.subtitle.copyWith(fontSize: 16)
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                    ),
                  );
                },
              ),
              Form(
                child: TextFormField(
                  controller: _editingController,
                  decoration: InputDecoration(labelText: "发送信息"),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: "Send Message",
        child: Icon(Icons.send),
      ),
    );
  }

  void _sendMessage(){
    if(_editingController.text.isNotEmpty){
      channel.sink.add(_editingController.text);
      _editingController.clear();
    }
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }
}
