import 'package:flutter/material.dart';

import '../../data/models/tweet_response_model.dart';

class TweetTile extends StatelessWidget {
  const TweetTile({
    Key? key,
    required this.tweet,
  }) : super(key: key);
  final TweetResponseModel tweet;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text("@${tweet.user.username}"),
          subtitle: Text(tweet.tweet),
          leading: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(tweet.user.userImage),
          ),
        ),
        Row(
          children: [
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.repeat, size: 16, color: Colors.grey),
                const SizedBox(width: 10),
                Text(tweet.retweetCount.toString())
              ],
            )),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.thumb_up, size: 16, color: Colors.grey),
                const SizedBox(width: 10),
                Text(tweet.likeCount.toString())
              ],
            )),
          ],
        )
      ],
    );
  }
}
