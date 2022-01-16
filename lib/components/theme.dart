import 'package:flutter/material.dart';
import 'package:redditech/global/variables.dart' as global;

//////////////////// Build.dart ////////////////////

// Bar
final barUiColor = Colors.transparent;
final shadowBarUiColor = global.isThemeDark ? Colors.black : Colors.white;

// Body
final uiTheme = ThemeData(
  scaffoldBackgroundColor:
      global.isThemeDark ? Colors.black : Color(0xFFE5E5E5),
);

final textStyle = TextStyle(
  fontSize: 38,
  fontWeight: FontWeight.w500,
  color: global.isThemeDark ? Colors.white : Colors.black,
);

final biggerFont = TextStyle(
  fontSize: 18,
  color: global.isThemeDark ? Colors.white : Colors.black,
);
