import 'package:flutter/material.dart';
import 'package:rich/utils/common.dart';

class ArticleAvatar extends StatefulWidget {
  final String avatarUrl;
  final String nickName;
  final int publishTime;

  ArticleAvatar(
      {Key key,
      @required this.avatarUrl,
      @required this.nickName,
      this.publishTime})
      : super(key: key);

  @override
  _ArticleAvatarState createState() => _ArticleAvatarState();
}

class _ArticleAvatarState extends State<ArticleAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.only(right: 6),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(widget.avatarUrl),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.nickName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(99, 100, 100, 1),
                ),
              ),
              Text(
                dataFormat(widget.publishTime, format: 'MD'),
                style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(99, 100, 100, .5),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
