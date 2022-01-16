import 'package:flutter/material.dart';
import 'package:redditech/global/variables.dart' as global;

//////////////////// App.dart ////////////////////

String title = 'Redditech';

////////////////////  Build.dart ////////////////////

final String suggestTitle = 'Saved Suggestions';
final String searchToolTipsText = 'Search';
final String navigToolTipsText = 'Navigation';
final String hintSearchBar = 'Search something cool...';

final TextStyle textStyleUsernamePost = TextStyle(
  fontFamily: 'Scheherazade New',
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: global.isThemeDark ? Colors.white : Colors.black,
);

final TextStyle textStyleDescriptionPost = TextStyle(
  fontFamily: 'Raleway',
  fontSize: 14,
  fontWeight: FontWeight.w800,
  color: global.isThemeDark ? Colors.white : Colors.black,
);

final TextStyle textSearchBar = TextStyle(
  fontFamily: 'Oswald',
  fontSize: 20,
  color: global.isThemeDark ? Colors.white : Colors.grey[350],
);

final TextStyle textFieldStyleSearchbar = TextStyle(
  fontFamily: 'Poppins',
  color: global.isThemeDark ? Colors.black45 : Colors.white60,
  fontSize: 16.0,
  fontStyle: FontStyle.italic,
);

////////////////////  Preferences.dart ////////////////////

final Widget preferencesTitle = Text(
  'Preferences',
  style: TextStyle(
    fontFamily: 'Oswald',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: global.isThemeDark ? Colors.white : Colors.grey[350],
  ),
);

////////////////////  Post.dart ////////////////////

final TextStyle textStyleUpvotePost = TextStyle(
  fontFamily: 'Raleway',
  fontSize: 14,
  color: global.isThemeDark ? Colors.white : Colors.black,
);

final TextStyle textStyleRatioPost = TextStyle(
  fontFamily: 'Raleway',
  fontSize: 14,
  color: global.isThemeDark ? Colors.white : Colors.black,
);

final TextStyle textStyleAwardsPost = TextStyle(
  fontFamily: 'Raleway',
  fontSize: 14,
  color: global.isThemeDark ? Colors.white : Colors.black,
);

final TextStyle textStyleNbSubredditPost = TextStyle(
  fontFamily: 'Raleway',
  fontSize: 14,
  color: global.isThemeDark ? Colors.white : Colors.black,
);

final TextStyle textStylePrefixNamePost = TextStyle(
  fontFamily: 'Oswald',
  fontSize: 10,
  color: global.isThemeDark ? Colors.white : Colors.black,
);

////////////////////  Profile.dart ////////////////////

final Widget profileTitle = Text(
  'Profile',
  style: TextStyle(
    fontFamily: 'Oswald',
    fontSize: 20,
    color: global.isThemeDark ? Colors.white : Colors.grey[350],
  ),
);

Text? usernameProfile(data) {
  return Text(
    '${data['subreddit']['display_name_prefixed']}',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: global.isThemeDark ? Colors.white : Colors.black,
    ),
  );
}

Widget? coinsProfile(data) {
  return Text(
    '${data['subreddit']['coins']} coins',
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: global.isThemeDark ? Colors.white : Colors.black,
    ),
  );
}

Text? subscribersProfile(data) {
  return Text(
    '${data['subreddit']['subscribers']} subscribers',
    style: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: global.isThemeDark ? Colors.white : Colors.black,
    ),
  );
}

Text? descriptionTitleProfile(data) {
  return Text(
    'Description',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: global.isThemeDark ? Colors.white : Colors.black,
    ),
  );
}

Text? descriptionProfile(data) {
  return Text(
    '${data['subreddit']['public_description']}',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: global.isThemeDark ? Colors.white : Colors.black,
    ),
  );
}

////////////////////  Comment.dart ////////////////////

final Widget commentTitle = Text(
  'Comment',
  style: TextStyle(
    fontFamily: 'Oswald',
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: global.isThemeDark ? Colors.white : Colors.black,
  ),
);

////////////////////  Settings.dart ////////////////////

final Widget settingsTitle = Text(
  'Settings',
  style: TextStyle(
    fontFamily: 'Oswald',
    fontSize: 20,
    color: Colors.grey[350],
  ),
);

Text? settingsName(data) {
  return Text(
    '${data['beta']}',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: global.isThemeDark ? Colors.white : Colors.black,
    ),
  );
}

////////////////////  Search.dart ////////////////////

final Widget searchTitle = Text(
  'Search',
  style: TextStyle(
    fontFamily: 'Oswald',
    fontSize: 20,
    color: global.isThemeDark ? Colors.white : Colors.grey[350],
  ),
);
