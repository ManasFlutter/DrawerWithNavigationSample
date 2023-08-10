import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterdrawer/new_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor:
            defaultTargetPlatform == TargetPlatform.iOS ? Colors.black : null,
      ),
      home: const HomePage(),
      // one way of navigation using the routes
      // routes: <String, WidgetBuilder>{
      //   "/a": (BuildContext context) => NewPage(title: 'New Page')
      // },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer App'),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Manas'),
              accountEmail: const Text('Manasflutterdev@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.deepPurple
                        : Colors.white,
                child: const Text('M'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.deepPurple
                          : Colors.white,
                  child: const Text('M'),
                )
              ],
            ),
            ListTile(
              title: const Text('page one'),
              trailing: const Icon(Icons.arrow_circle_up),
              onTap: () {
                Navigator.of(context).pop();

                //with routes we can use the below commented one
                // Navigator.of(context).pushNamed('/a');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const NewPage(title: "New Page One")));
              },
            ),
            ListTile(
              title: const Text('page two'),
              trailing: const Icon(Icons.arrow_circle_down),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const NewPage(title: "New Page Two")));
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Cancel'),
              trailing: const Icon(Icons.close_rounded),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Home page'),
      ),
    );
  }
}
