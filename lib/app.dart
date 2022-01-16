import 'package:flutter/material.dart';
import 'package:redditech/components/text.dart';
import 'package:redditech/pages/preferences.dart';
import 'package:redditech/pages/profile.dart';
import 'package:redditech/pages/search.dart';
import 'package:redditech/pages/settings.dart';
import 'package:redditech/pages/webview.dart';
import 'package:redditech/pages/home.dart';
import 'package:redditech/global/variables.dart' as global;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      themeMode: global.isThemeDark ? ThemeMode.dark : ThemeMode.light,
      routes: {
        '/': (context) => WebviewRedditech(context: context),
        '/home': (context) => Redditech(),
        '/preferences': (context) => Preferences(),
        '/settings': (context) => Settings(),
        '/search': (context) => SearchBar(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
