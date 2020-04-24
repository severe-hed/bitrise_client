import 'package:bitriseclient/ui/main/apps_screen.dart';
import 'package:bitriseclient/ui/main/builds_screen.dart';
import 'package:bitriseclient/ui/main/main_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Widget> screens = [
    BuildsScreen(key: PageStorageKey("BuildsScreen"),),
    AppsScreen(key: PageStorageKey("AppsScreenr"),)
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: MainNavigationScreen(
            children: screens
        )
    );
  }
}
