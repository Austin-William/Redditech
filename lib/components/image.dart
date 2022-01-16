import 'package:flutter/material.dart';

// Appbar

Image logoReddit = Image.asset(
  'assets/logo_reddit.png',
  fit: BoxFit.contain,
  height: 180,
  width: 180,
);

Image imageProfilPost = Image.asset(
  'assets/profil.png',
  fit: BoxFit.contain,
  height: 35,
  width: 35,
);

// Post

NetworkImage imageUserProfile(data) {
  String str = data['subreddit']['icon_img'];
  var ret;
  if (str.contains(".png")) {
    var split = str.split(".png");
    ret = NetworkImage(split[0] + ".png");
  } else if (str.contains(".jpg")) {
    var split = str.split(".jpg");
    ret = NetworkImage(split[0] + ".jpg");
  } else if (str.contains(".jpeg")) {
    var split = str.split(".jpeg");
    ret = NetworkImage(split[0] + ".jpeg");
  } else {
    ret = NetworkImage(str);
  }
  return ret;
}

NetworkImage imageBannerUserProfile(data) {
  String str = data['subreddit']['banner_img'];
  var ret;
  if (str.contains(".png")) {
    var split = str.split(".png");
    ret = NetworkImage(split[0] + ".png");
  } else if (str.contains(".jpg")) {
    var split = str.split(".jpg");
    ret = NetworkImage(split[0] + ".jpg");
  } else if (str.contains(".jpeg")) {
    var split = str.split(".jpeg");
    ret = NetworkImage(split[0] + ".jpeg");
  } else {
    ret = NetworkImage(str);
  }
  return ret;
}
