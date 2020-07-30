/// 社区
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import 'package:rich/components/ActicleAvatar/view.dart';
import 'package:rich/components/ImagesWrapper/view.dart';
import 'package:rich/utils/constant.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommunityState state, Dispatch dispatch, ViewService viewService) {
  Widget buildAction(String text, IconData icon, Color color,
      {Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(right: 24),
        child: Row(
          children: <Widget>[
            LikeButton(
                size: 16,
                circleColor: CircleColor(
                    start: color, end: Colors.red),
                bubblesColor: BubblesColor(
                  dotPrimaryColor: Color(0xff33b5e5),
                  dotSecondaryColor: Color(0xff0099cc),
                ),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.home,
                    color: isLiked ? up : Colors.grey,
                    size: 16,
                  );
                },
                likeCount: 665,
                countBuilder: (int count, bool isLiked, String text) {
                  var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                  Widget result;
                  if (count == 0) {
                    result = Text(
                      "love",
                      style: TextStyle(color: up),
                    );
                  } else
                    result = Text(
                      text,
                      style: TextStyle(color: color),
                    );
                  return result;
                }),
//            Icon(icon, color: color, size: 16),
//            Padding(
//              padding: const EdgeInsets.only(left: 6),
//              child: Text(
//                text,
//                style: TextStyle(color: color, fontSize: 15),
//              ),
//            )
          ],
        ),
      ),
    );
  }

  void onApprove(bool isApproved, int code, int index) {
    print(isApproved);
    print(code);
    dispatch(CommunityActionCreator.onArticleApprove(
        {'code': code, 'index': index}));
  }

  return Scaffold(
    appBar: AppBar(
      title: Text('社区'),
    ),
    body: Container(
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: Column(
        children: <Widget>[
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => dispatch(
                CommunityActionCreator.onFetchArticles(
                  {'currentPage': 1, 'pageSize': state.pageSize},
                ),),
              child: ListView.builder(
                controller: state.articlesController,
                itemBuilder: (context, index) {
                  var item = state.data[index];
                  bool isApproved = item['approved'] == 1;

                  /// 已点赞
                  return Container(
                    margin: const EdgeInsets.only(top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ArticleAvatar(
                          avatarUrl: item['avatarUrl'],
                          nickName: item['nickName'],
                          publishTime: item['publishTime'],
                        ),
                        Container(
                          child: Text(
                            item['content'] ?? '',
                            style: TextStyle(
                              color: Color.fromRGBO(25, 25, 25, 1),
                              fontSize: 15,
                            ),
                          ),
                          margin: const EdgeInsets.only(top: 6),
                        ),
                        Container(
                          child: ImagesWrapper(
                            style: item['style'],
                            pictureList: item['pictureList'],
                          ),
                          margin: const EdgeInsets.only(top: 6),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          child: Row(
                            children: <Widget>[
                              buildAction(
                                '${item['commentCount'] ?? '0'}',
                                Icons.chat,
                                Colors.grey[600],
                              ),
                              buildAction(
                                '${item['approve'] ?? '0'}',
                                Icons.thumb_up,
                                isApproved ? up : Colors.grey[600],
                                onTap: () =>
                                    onApprove(isApproved, item['id'], index),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                          const EdgeInsets.only(top: 12, left: 6, right: 6),
                          child: Divider(
                            height: 1,
                            color: Colors.grey[350],
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: state.data.length,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
