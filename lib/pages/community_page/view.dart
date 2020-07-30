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
  Future<bool> onLikeTap(bool isLiked, int code, int index) async {
    if (!isLiked) {
      dispatch(CommunityActionCreator.onArticleApprove(
          {'code': code, 'index': index}));
    }
    return !isLiked;
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
                ),
              ),
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
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.chat,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Text(
                                        '${item['commentCount'] ?? 0}',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                                margin: const EdgeInsets.only(right: 24),
                              ),
                              LikeButton(
                                isLiked: isApproved,
                                onTap: (bool isLiked) =>
                                    onLikeTap(isLiked, item['id'], index),
                                size: 16,
                                circleColor:
                                CircleColor(start: Colors.grey, end: up),
                                bubblesColor: BubblesColor(
                                  dotPrimaryColor: up,
                                  dotSecondaryColor: up,
                                ),
                                likeBuilder: (bool isLiked) {
                                  return Icon(
                                    Icons.thumb_up,
                                    color: isLiked ? up : Colors.grey,
                                    size: 16,
                                  );
                                },
                                likeCount: item['approve'],
                                countBuilder:
                                    (int count, bool isLiked, String text) {
                                  var color = isLiked ? up : Colors.grey;
                                  return Text(
                                    text,
                                    style: TextStyle(color: color),
                                  );
                                },
                              )
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
