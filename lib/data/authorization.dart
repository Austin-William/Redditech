// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:redditech/global/variables.dart' as global;

final CLIENT_ID = 'ebve1E0Sh4vD5ZsTMxL8Tw';
final TYPE = 'code';
final RANDOM_STRING = 'Redditech-String34546';
final REDIRECT_URI = 'http://ripepitech';
final DURATION = 'permanent';
final SCOPE_STRING = '*';
final base_url_oauth = 'https://oauth.reddit.com';

void getResponse(var context, var data) async {
  final Dio dio = new Dio();

  final Response<Map<String, dynamic>> userData = await dio.get(
    base_url_oauth + '/api/v1/me',
    options: Options(
      headers: {
        'Authorization': 'bearer ${data['access_token']}',
        'User-Agent': 'Redditech/1.0.0 (by /u/EauPlatePetillante)',
      },
    ),
  );

  final Response<Map<String, dynamic>> postsData = await dio.get(
    base_url_oauth + '/r/all',
    options: Options(
      headers: {
        'Authorization': 'bearer ${data['access_token']}',
        'User-Agent': 'Redditech/1.0.0 (by /u/EauPlatePetillante)',
      },
    ),
  );

  final Response<Map<String, dynamic>> hotPostsData = await dio.get(
    base_url_oauth + '/hot',
    options: Options(
      headers: {
        'Authorization': 'bearer ${data['access_token']}',
        'User-Agent': 'Redditech/1.0.0 (by /u/EauPlatePetillante)',
      },
    ),
  );

  final Response<Map<String, dynamic>> subredditPostsData = await dio.get(
    base_url_oauth + '/new',
    options: Options(
      headers: {
        'Authorization': 'bearer ${data['access_token']}',
        'User-Agent': 'Redditech/1.0.0 (by /u/EauPlatePetillante)',
      },
    ),
  );

  final Response<Map<String, dynamic>> bestPostsData = await dio.get(
    base_url_oauth + '/best',
    options: Options(
      headers: {
        'Authorization': 'bearer ${data['access_token']}',
        'User-Agent': 'Redditech/1.0.0 (by /u/EauPlatePetillante)',
      },
    ),
  );

  final Response<Map<String, dynamic>> settingsData = await dio.get(
    base_url_oauth + '/api/v1/me/prefs',
    options: Options(
      headers: {
        'Authorization': 'bearer ${data['access_token']}',
        'User-Agent': 'Redditech/1.0.0 (by /u/EauPlatePetillante)',
      },
    ),
  );

  global.userData = userData.data;
  global.postsData = postsData.data;
  global.hotPostsData = hotPostsData.data;
  global.subredditPostsData = subredditPostsData.data;
  global.bestPostsData = bestPostsData.data;
  global.settingsData = settingsData.data;
  global.token = data;
  Navigator.popAndPushNamed(context, '/home');
}

void getAccessToken(String url, var context) async {
  String CODE = '';
  final Dio dio = new Dio();
  Uri uri = Uri.parse(url);
  final String credentials = base64.encode(utf8.encode('$CLIENT_ID:'));

  print('START=============================');
  uri.queryParameters.forEach(
    (key, value) {
      if (key == 'code') {
        CODE = value;
      }
    },
  );
  dio.options.headers['Authorization'] = 'Basic $credentials';
  dio.options.headers['content-type'] = 'application/x-www-form-urlencoded';
  final dynamic response = await dio.post(
      'https://www.reddit.com/api/v1/access_token',
      data:
          'grant_type=authorization_code&code=$CODE&redirect_uri=$REDIRECT_URI');
  getResponse(context, response.data);
}
