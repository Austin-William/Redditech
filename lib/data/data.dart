import 'package:flutter/material.dart';
import 'package:redditech/components/video.dart';
import 'dart:core';

class Data extends StatefulWidget {
  Data({
    Key? key,
    required this.data,
    required this.i,
  }) : super(key: key);

  final dynamic data;
  final int i;

  @override
  DataState createState() => DataState();
}

enum UrlType { IMAGE, VIDEO, UNKNOWN }

class DataState extends State<Data> {
  UrlType getUrlType(String url) {
    Uri uri = Uri.parse(url);
    String typeString = uri.path.substring(uri.path.length - 3).toLowerCase();
    if (typeString == "jpg" ||
        typeString == "png" ||
        typeString == "gif" ||
        typeString == "jpeg" ||
        typeString == "bmp" ||
        typeString == "webp" ||
        typeString == "ico" ||
        typeString == "svg" ||
        typeString == "tif" ||
        typeString == "tiff") {
      return UrlType.IMAGE;
    }
    if (typeString == "mp4" ||
        typeString == "mkv" ||
        typeString == "webm" ||
        typeString == "avi" ||
        typeString == "mov" ||
        typeString == "wmv" ||
        typeString == "flv" ||
        typeString == "3gp" ||
        typeString == "mpg") {
      return UrlType.VIDEO;
    }
    return UrlType.UNKNOWN;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          if (widget.data!['data']['children'][widget.i]['data']
                  ['secure_media'] !=
              null) ...[
            if (widget.data!['data']['children'][widget.i]['data']
                    ['secure_media']['reddit_video'] !=
                null)
              if (getUrlType(widget.data!['data']['children'][widget.i]['data']
                      ['secure_media']['reddit_video']['fallback_url']) ==
                  UrlType.VIDEO)
                VideoChewie(
                  url: widget.data!['data']['children'][widget.i]['data']
                      ['secure_media']['reddit_video']['fallback_url'],
                ),
          ],
          if (widget.data!['data']['children'][widget.i]['data']
                  ['secure_media'] !=
              null) ...[
            if (widget.data!['data']['children'][widget.i]['data']
                    ['secure_media']['oembed'] !=
                null)
              if (widget.data!['data']['children'][widget.i]['data']
                      ['secure_media']['oembed']['provider_url'] !=
                  null)
                Container(
                  child: Column(
                    children: [
                      Text(
                        widget.data!['data']['children'][widget.i]['data']
                            ['url'],
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Image.network(
                        widget.data!['data']['children'][widget.i]['data']
                            ['secure_media']['oembed']['thumbnail_url'],
                        height: 200,
                      ),
                    ],
                  ),
                ),
          ],
          if (widget.data!['data']['children'][widget.i]['data']['url'] != null)
            if (getUrlType(widget.data!['data']['children'][widget.i]['data']
                    ['url']) ==
                UrlType.IMAGE)
              Container(
                child: Image.network(
                  widget.data!['data']['children'][widget.i]['data']['url'],
                ),
              ),
        ],
      ),
    );
  }
}
