import 'package:flutter/material.dart';
import 'package:list_tile_more_customizable/list_tile_more_customizable.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
                    PopupMenuItem(child: Text("onTap - 1!"))
                  ],
                );
              },
              onLongPress: (details){
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                  ),
                  items: <PopupMenuEntry<int>>[
                    PopupMenuItem(child: Text("onLongPressed - 1!"))
                  ],
                );
              },
            ),
            Divider(),
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
                    PopupMenuItem(child: Text("onTap - 2!"))
                  ],
                );
              },
              horizontalTitleGap: 0.0,
            ),
            Divider(),
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
                    PopupMenuItem(child: Text("onTap - 3!"))
                  ],
                );
              },
              horizontalTitleGap: 0.0,
            ),
            Divider(),
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
                    PopupMenuItem(child: Text("onTap - 4!"))
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
