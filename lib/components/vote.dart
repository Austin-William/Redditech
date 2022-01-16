import 'package:flutter/material.dart';
import 'package:redditech/pages/comment.dart';
import 'package:redditech/components/text.dart';
import 'package:like_button/like_button.dart';
import 'package:redditech/global/variables.dart' as global;

class ActionBar extends StatefulWidget {
  ActionBar({
    Key? key,
    required this.upvote,
    required this.subreddit,
    required this.nbComment,
    required this.ratio,
  }) : super(key: key);

  final String upvote;
  final String ratio;
  final String subreddit;
  final String nbComment;

  @override
  _ActionBarState createState() => _ActionBarState();
}

class _ActionBarState extends State<ActionBar> {
  @override
  Widget build(BuildContext context) {
    Future<bool> _onPressedUpVote(bool isLikedUpvote) async {
      return !isLikedUpvote;
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: [
              LikeButton(
                onTap: _onPressedUpVote,
                size: 30,
                circleColor: CircleColor(
                  start: Color(0xff00ddff),
                  end: Color(0xff0099cc),
                ),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.thumb_up,
                    color: isLiked ? Colors.greenAccent : Colors.grey,
                    size: 25,
                  );
                },
              ),
              Text(
                widget.upvote.toString(),
                style: textStyleUpvotePost,
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.comment,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Comment(
                        comment: widget.subreddit,
                      ),
                    ),
                  );
                },
              ),
              Text(
                widget.nbComment.toString(),
                style: textStyleNbSubredditPost,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                widget.ratio.toString(),
                style: textStyleRatioPost,
              ),
              Text(
                ' u/d',
                style: textStyleRatioPost,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
