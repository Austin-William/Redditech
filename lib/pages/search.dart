import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:redditech/components/theme.dart';
import 'package:redditech/components/text.dart';
import 'package:redditech/components/detail_page_search.dart';
import 'package:redditech/global/variables.dart' as global;

Icon searchIcon = const Icon(Icons.search);
Icon backIcon = const Icon(Icons.search);
Icon closeIcon = const Icon(Icons.close);

Widget searchBar = Text(
  title,
  style: textSearchBar,
);
Widget backSearchBar = Text(
  title,
  style: textSearchBar,
);
Widget titleSearchBar = Text(
  searchToolTipsText,
  style: textSearchBar,
);
Widget searchBarIcon = ListTile(
  leading: Icon(
    backIcon.icon,
    color: Colors.white30,
    size: 24.0,
  ),
  title: textField,
);

Widget textField = TextField(
  decoration: InputDecoration(
      hintText: hintSearchBar,
      hintStyle: textFieldStyleSearchbar,
      contentPadding: EdgeInsets.all(7.0)),
);

class SearchBar extends StatefulWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController textController = TextEditingController();

  dynamic res;
  dynamic size = [];

  void searchReddit(input) async {
    try {
      if (input.isEmpty) {
        setState(
          () {
            res = [];
          },
        );
      } else {
        final Response<Map<String, dynamic>> response = await Dio().get(
            "https://www.reddit.com/search.json?q=$input&sort=relevance&limit=10");
        setState(
          () {
            res = response;
            size = res.data['data']['children'];
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global.isThemeDark ? Colors.black : Colors.white,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
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
        backgroundColor: barUiColor,
        shadowColor: shadowBarUiColor,
        title: TextField(
          autofocus: true,
          onChanged: (input) {
            setState(
              () {
                searchReddit(input);
              },
            );
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontStyle: FontStyle.italic,
            ),
            contentPadding: EdgeInsets.all(7.0),
          ),
        ),
        bottomOpacity: 0.5,
      ),
      body: ListView.builder(
        itemCount: size.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            color: global.isThemeDark ? Colors.grey[800] : Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              iconColor: global.isThemeDark ? Colors.black : Colors.white,
              textColor: global.isThemeDark ? Colors.white : Colors.black,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  res.data['data']['children'][index]['data']['thumbnail'],
                ),
                backgroundColor:
                    global.isThemeDark ? Colors.black : Colors.white,
              ),
              title: Text(
                res.data['data']['children'][index]['data']['title'],
                style: TextStyle(
                  fontSize: 16,
                  color: global.isThemeDark ? Colors.white : Colors.black,
                ),
              ),
              subtitle: Text(
                res.data['data']['children'][index]["data"]["author"],
                style: TextStyle(
                  fontSize: 14,
                  color: global.isThemeDark ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      data: res,
                      index: index,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
