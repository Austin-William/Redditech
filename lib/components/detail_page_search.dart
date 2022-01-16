import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redditech/data/data.dart';
import 'package:redditech/global/variables.dart' as global;

class DetailPage extends StatefulWidget {
  DetailPage({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);
  final dynamic data;
  final int index;

  @override
  DetailPageState createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global.isThemeDark ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text(
          widget.data.data['data']['children'][widget.index]["data"]['title'],
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: global.isThemeDark ? Colors.black : Colors.white,
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
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Data(
                        data: widget.data.data,
                        i: widget.index,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.data.data['data']['children'][widget.index]
                            ["data"]['selftext'],
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              global.isThemeDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.data.data['data']['children'][widget.index]["data"]
                    ['author'],
                style: TextStyle(
                  fontSize: 20,
                  color: global.isThemeDark ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              if (widget.data.data['data']['children'][widget.index]["data"]
                      ['url'] !=
                  null)
                Text(
                  widget.data.data['data']['children'][widget.index]["data"]
                      ['url'],
                  style: TextStyle(
                    fontSize: 10,
                    color: global.isThemeDark ? Colors.white : Colors.black,
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        size: 16,
                        color: global.isThemeDark ? Colors.white : Colors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget
                            .data
                            .data['data']['children'][widget.index]["data"]
                                ['ups']
                            .toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              global.isThemeDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.assessment_outlined,
                        size: 16,
                        color: global.isThemeDark ? Colors.white : Colors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget
                                .data
                                .data['data']['children'][widget.index]["data"]
                                    ['upvote_ratio']
                                .toString() +
                            " u/d",
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              global.isThemeDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.comment,
                        size: 16,
                        color: global.isThemeDark ? Colors.white : Colors.black,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget
                            .data
                            .data['data']['children'][widget.index]["data"]
                                ['num_comments']
                            .toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color:
                              global.isThemeDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
