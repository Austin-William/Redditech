import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redditech/components/theme.dart';
import 'package:redditech/components/text.dart';
import 'package:redditech/global/variables.dart' as global;

class Comment extends StatefulWidget {
  Comment({Key? key, required this.comment}) : super(key: key);
  final String comment;
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global.isThemeDark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: commentTitle,
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
          statusBarIconBrightness:
              global.isThemeDark ? Brightness.light : Brightness.dark,
          statusBarBrightness:
              global.isThemeDark ? Brightness.light : Brightness.dark,
        ),
        backgroundColor: barUiColor,
        shadowColor: shadowBarUiColor,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                widget.comment,
                style: biggerFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
