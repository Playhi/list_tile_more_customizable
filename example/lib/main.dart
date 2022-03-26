import 'package:flutter/material.dart';
import 'package:list_tile_more_customizable/list_tile_more_customizable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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
              leading: const Icon(Icons.print),
              title: const Text("Title - 1"),
              subtitle: const Text("Subtitle - 1"),
              trailing: const Icon(Icons.account_balance),
              onTap: (details) {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.position.dx,
                    details.position.dy,
                    details.position.dx,
                    details.position.dy,
                  ),
                  items: <PopupMenuEntry<int>>[
                    const PopupMenuItem(child: Text("onTap - 1!")),
                  ],
                );
              },
              onLongPress: (details) {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.position.dx,
                    details.position.dy,
                    details.position.dx,
                    details.position.dy,
                  ),
                  items: <PopupMenuEntry<int>>[
                    const PopupMenuItem(child: Text("onLongPressed - 1!")),
                  ],
                );
              },
            ),
            const Divider(),
            // A [ListTileMoreCustomizable] with [onLongPress],
            // [leading], [title], [subtitle],
            // [trailing], [horizontalTitleGap].
            ListTileMoreCustomizable(
              leading: const Icon(Icons.priority_high),
              title: const Text("Title - 2"),
              subtitle: const Text("Subtitle - 2"),
              trailing: const Icon(Icons.palette),
              onLongPress: (details) {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.position.dx,
                    details.position.dy,
                    details.position.dx,
                    details.position.dy,
                  ),
                  items: <PopupMenuEntry<int>>[
                    const PopupMenuItem(child: Text("onLongPress - 2!")),
                  ],
                );
              },
              horizontalTitleGap: 0.0,
            ),
            const Divider(),
            // A [ListTileMoreCustomizable] with [onTap],
            // [leading], [title],
            // [trailing], [horizontalTitleGap].
            ListTileMoreCustomizable(
              leading: const Icon(Icons.schedule),
              title: const Text("Title - 3"),
              trailing: const Icon(Icons.ac_unit),
              onTap: (details) {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.position.dx,
                    details.position.dy,
                    details.position.dx,
                    details.position.dy,
                  ),
                  items: <PopupMenuEntry<int>>[
                    const PopupMenuItem(child: Text("onTap - 3!")),
                  ],
                );
              },
              horizontalTitleGap: 0.0,
            ),
            const Divider(),
            // A [ListTileMoreCustomizable] with [onTap],
            // [leading], [title], [trailing].
            ListTileMoreCustomizable(
              leading: const Icon(Icons.palette),
              title: const Text("Title - 4"),
              trailing: const Icon(Icons.title),
              onTap: (details) {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    details.position.dx,
                    details.position.dy,
                    details.position.dx,
                    details.position.dy,
                  ),
                  items: <PopupMenuEntry<int>>[
                    const PopupMenuItem(child: Text("onTap - 4!")),
                  ],
                );
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
