import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:redditech/data/authorization.dart';

class WebviewRedditech extends StatelessWidget {
  final BuildContext context;
  WebviewRedditech({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl:
          'https://www.reddit.com/api/v1/authorize.compact?client_id=$CLIENT_ID&response_type=$TYPE&state=$RANDOM_STRING&redirect_uri=$REDIRECT_URI&duration=$DURATION&scope=$SCOPE_STRING',
      javascriptMode: JavascriptMode.unrestricted,
      onPageStarted: (String url) {
        if (url.startsWith(REDIRECT_URI)) {
          getAccessToken(url, context);
        }
      },
      onProgress: (int progress) {
        print(progress);
      },
    );
  }
}
