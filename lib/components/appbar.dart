import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redditech/components/theme.dart';
import 'package:redditech/components/text.dart';
import 'package:redditech/components/image.dart';
import 'package:redditech/pages/search.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.data,
    this.settings,
  })  : preferredSize = Size.fromHeight(90),
        super(key: key);

  @override
  final Size preferredSize;
  final Response<Map<String, dynamic>>? data;
  final Response<Map<String, dynamic>>? settings;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  Widget gestureLogo() {
    return GestureDetector(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/');
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: logoReddit,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: gestureLogo(),
      title: searchBar,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            colors: [Colors.red, Colors.orange],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      backgroundColor: barUiColor,
      shadowColor: shadowBarUiColor,
      actions: [
        IconButton(
          icon: searchIcon,
          tooltip: searchToolTipsText,
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          tooltip: navigToolTipsText,
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ],
      bottom: const TabBar(
        indicatorColor: Colors.transparent,
        isScrollable: false,
        tabs: [
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.local_fire_department)),
          Tab(icon: Icon(Icons.navigation_outlined)),
          Tab(icon: Icon(Icons.video_collection)),
        ],
      ),
    );
  }
}
