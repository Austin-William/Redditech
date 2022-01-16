import 'package:flutter/material.dart';
import 'package:redditech/components/appbar.dart';
import 'package:redditech/components/home_feed.dart';
import 'package:redditech/components/hot.dart';
import 'package:redditech/components/best.dart';
import 'package:redditech/components/subreddit.dart';
import 'package:redditech/global/variables.dart' as global;

class Redditech extends StatefulWidget {
  Redditech({Key? key}) : super(key: key);

  @override
  _RedditechState createState() => _RedditechState();
}

class _RedditechState extends State<Redditech> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global.isThemeDark ? Colors.black : Colors.white,
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: CustomAppBar(),
          backgroundColor: global.isThemeDark ? Colors.black : Colors.white,
          body: TabBarView(
            children: [
              HomeFeed(),
              HotFeed(),
              BestFeed(),
              SubredditFeed(),
            ],
          ),
        ),
      ),
    );
  }
}
