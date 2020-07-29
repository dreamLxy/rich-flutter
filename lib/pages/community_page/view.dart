/// 社区
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'package:rich/components/ActicleAvatar/view.dart';
import 'package:rich/components/ImagesWrapper/view.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CommunityState state, Dispatch dispatch, ViewService viewService) {
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
