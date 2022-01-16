import 'package:flutter/material.dart';
import 'package:redditech/components/text.dart';
import 'package:redditech/components/vote.dart';
import 'package:redditech/components/image.dart';
import 'package:redditech/data/data.dart';
import 'package:redditech/global/variables.dart' as global;

class HomeFeed extends StatefulWidget {
  HomeFeed({Key? key}) : super(key: key);

  @override
  HomeFeedState createState() => HomeFeedState();
}

class HomeFeedState extends State<HomeFeed> {
  Widget imagePost(i) {
    return Container(
      padding: EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: Data(
          data: global.postsData,
          i: i,
        ),
      ),
    );
  }

  Widget usernamePost(i) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          '${global.postsData['data']['children'][i]['data']['author']}',
          textAlign: TextAlign.center,
          style: textStyleUsernamePost,
        ),
      ),
    );
  }

  Widget descriptionPost(i) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Text(
          '${global.postsData['data']['children'][i]['data']['title']}',
          style: textStyleDescriptionPost,
        ),
      ),
    );
  }

  Widget prefixNamePost(i) {
    return Container(
      child: Container(
        child: Text(
          '${global.postsData['data']['children'][i]['data']['subreddit_name_prefixed']}',
          textAlign: TextAlign.right,
          style: textStylePrefixNamePost,
        ),
      ),
    );
  }

  Widget awardsPost(i) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 15,
        ),
        Text(
          '${global.postsData['data']['children'][i]['data']['total_awards_received']}',
          style: textStyleAwardsPost,
        ),
      ],
    );
  }

  Widget displayInfoProfil(i) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          imageProfilPost,
          usernamePost(i),
          SizedBox(
            width: 10,
          ),
          awardsPost(i),
        ],
      ),
    );
  }

  Widget cardPost(i) {
    return Card(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 20,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      color: global.isThemeDark ? Colors.grey[600] : Colors.white,
      shadowColor: global.isThemeDark ? Colors.grey[800] : Colors.black,
      child: InkWell(
        onTap: () {},
        child: Container(
          child: Column(
            children: <Widget>[
              displayInfoProfil(i),
              descriptionPost(i),
              prefixNamePost(i),
              imagePost(i),
              ActionBar(
                upvote:
                    '${global.postsData['data']['children'][i]['data']['ups']}',
                ratio:
                    '${global.postsData['data']['children'][i]['data']['upvote_ratio']}',
                subreddit:
                    '${global.postsData['data']['children'][i]['data']['subreddit']}',
                nbComment:
                    '${global.postsData['data']['children'][i]['data']['num_comments']}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global.isThemeDark ? Colors.black : Colors.white,
      body: ListView(
        children: <Widget>[
          for (var i = 0; i < global.postsData['data']['children'].length; i++)
            cardPost(i),
        ],
      ),
    );
  }
}
