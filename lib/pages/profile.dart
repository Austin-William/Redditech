import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redditech/components/text.dart';
import 'package:redditech/components/image.dart';
import 'package:redditech/components/theme.dart';
import 'package:redditech/global/variables.dart' as global;

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: profileTitle,
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
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: global.isThemeDark ? Colors.black : Colors.white,
        shadowColor: shadowBarUiColor,
      ),
      body: Container(
        color: global.isThemeDark ? Colors.black : Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 500,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5),
                            BlendMode.darken,
                          ),
                          image: imageBannerUserProfile(global.userData),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.orange],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: usernameProfile(global.userData),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: coinsProfile(global.userData),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: subscribersProfile(global.userData),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: descriptionTitleProfile(global.userData),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: descriptionProfile(global.userData),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: 25.0,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageUserProfile(global.userData),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
