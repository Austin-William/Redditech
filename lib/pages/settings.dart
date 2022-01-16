import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redditech/components/theme.dart';
import 'package:redditech/components/text.dart';
import 'package:redditech/pages/preferences.dart';
import 'package:redditech/pages/profile.dart';
import 'package:redditech/global/variables.dart' as global;

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global.isThemeDark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: settingsTitle,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.red],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              global.isThemeDark ? Brightness.dark : Brightness.dark,
          statusBarBrightness:
              global.isThemeDark ? Brightness.light : Brightness.dark,
        ),
        backgroundColor: barUiColor,
        shadowColor: shadowBarUiColor,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.person,
              color: global.isThemeDark ? Colors.white : Colors.black,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                color: global.isThemeDark ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: global.isThemeDark ? Colors.white : Colors.black,
            ),
            title: Text(
              'Preferences',
              style: TextStyle(
                fontSize: 20,
                color: global.isThemeDark ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/preferences');
            },
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: global.isThemeDark ? Colors.white : Colors.black,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 20,
                color: global.isThemeDark ? Colors.white : Colors.black,
              ),
            ),
            onTap: () {
              if (Platform.isIOS) SystemNavigator.pop();
              if (Platform.isAndroid) exit(0);
            },
          ),
        ],
      ),
    );
  }
}
