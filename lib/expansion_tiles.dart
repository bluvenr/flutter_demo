import 'package:flutter/material.dart';

class ExpansionTilesPage extends StatelessWidget{

  final String title;

  const ExpansionTilesPage({Key key, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => EntryItem(entry: data[index])
      ),
    );
  }
}

class Entry{
  final String title;
  final List<Entry> children;

  const Entry(this.title, [this.children = const <Entry>[]]);
}

const data = <Entry>[
  Entry("title-1"),
  Entry("title-2",
    <Entry>[
      Entry("title-2-1"),
      Entry("title-2-2")
    ]
  ),
  Entry("title-3",
    <Entry>[
      Entry("title-3-1"),
      Entry("title-3-2"),
      Entry("title-3-3"),
      Entry("title-3-4"),
      Entry("title-3-5"),
      Entry("title-3-6"),
    ]
  ),
  Entry("title-4",
    <Entry>[
      Entry("title-4-1",
          <Entry>[
            Entry("title-4-1-1"),
            Entry("title-4-1-2"),
          ]
      ),
      Entry("title-4-2"),
      Entry("title-4-3"),
      Entry("title-4-4"),
    ]
  ),
  Entry("title-5",
      <Entry>[
        Entry("title-5-1"),
        Entry("title-5-2"),
        Entry("title-5-3"),
        Entry("title-5-4"),
        Entry("title-5-5"),
        Entry("title-5-6"),
      ]
  ),
  Entry("title-6",
      <Entry>[
        Entry("title-6-1"),
        Entry("title-6-2"),
      ]
  ),
  Entry("title-7",
      <Entry>[
        Entry("title-7-1"),
        Entry("title-7-2"),
        Entry("title-7-3"),
      ]
  ),
  Entry("title-8"),
  Entry("title-9",
    <Entry>[
      Entry("title-9-1")
    ]
  ),
  Entry("title-10",
    <Entry>[
      Entry("title-10-1")
    ]
  ),
  Entry("title-x",
      <Entry>[
        Entry("title-x-1")
      ]
  ),
  Entry("title-x",
      <Entry>[
        Entry("title-x-1")
      ]
  ),
  Entry("title-x",
      <Entry>[
        Entry("title-x-1")
      ]
  ),
  Entry("title-x",
      <Entry>[
        Entry("title-x-1")
      ]
  ),
  Entry("title-x",
      <Entry>[
        Entry("title-x-1")
      ]
  ),
  Entry("title-x",
      <Entry>[
        Entry("title-x-1")
      ]
  ),
];

class EntryItem extends StatelessWidget{
  final Entry entry;

  const EntryItem({Key key, this.entry}):super(key:key);

  Widget _buildTiles(Entry root){
    if(root.children.isEmpty){
      return ListTile(title: Text(root.title));
    }

    return ExpansionTile(
        title: Text(root.title),
        children: root.children.map(_buildTiles).toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
