import 'package:flutter/material.dart';
import 'package:list_tile_more_customizable/list_tile_more_customizable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Card(
        child: ListView(
          children: <Widget>[
            // A [ListTileMoreCustomizable] with [onTap], [onLongPress],
            // [leading], [title], [subtitle], [trailing].
            ListTileMoreCustomizable(
              leading: Icon(Icons.print),
              title: Text("Title - 1"),
              subtitle: Text("Subtitle - 1"),
              trailing: Icon(Icons.account_balance),
              onTap: (details) {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                  ),
                  items: <PopupMenuEntry<int>>[
                    PopupMenuItem(child: Text("onTap - 1!")),
                  ],
                );
              },
              onLongPress: (details) {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                  ),
                  items: <PopupMenuEntry<int>>[
                    PopupMenuItem(child: Text("onLongPressed - 1!")),
                  ],
                );
              },
            ),
            Divider(),
            // A [ListTileMoreCustomizable] with [onLongPress],
            // [leading], [title], [subtitle],
            // [trailing], [horizontalTitleGap].
            ListTileMoreCustomizable(
              leading: Icon(Icons.priority_high),
              title: Text("Title - 2"),
              subtitle: Text("Subtitle - 2"),
              trailing: Icon(Icons.palette),
              onLongPress: (details) {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                  ),
                  items: <PopupMenuEntry<int>>[
                    PopupMenuItem(child: Text("onLongPress - 2!")),
                  ],
                );
              },
              horizontalTitleGap: 0.0,
            ),
            Divider(),
            // A [ListTileMoreCustomizable] with [onTap],
            // [leading], [title],
            // [trailing], [horizontalTitleGap].
            ListTileMoreCustomizable(
              leading: Icon(Icons.schedule),
              title: Text("Title - 3"),
              trailing: Icon(Icons.ac_unit),
              onTap: (details) {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                  ),
                  items: <PopupMenuEntry<int>>[
                    PopupMenuItem(child: Text("onTap - 3!")),
                  ],
                );
              },
              horizontalTitleGap: 0.0,
            ),
            Divider(),
            // A [ListTileMoreCustomizable] with [onTap],
            // [leading], [title], [trailing].
            ListTileMoreCustomizable(
              leading: Icon(Icons.palette),
              title: Text("Title - 4"),
              trailing: Icon(Icons.title),
              onTap: (details) {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                  ),
                  items: <PopupMenuEntry<int>>[
                    PopupMenuItem(child: Text("onTap - 4!")),
                  ],
                );
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
