import 'package:fish_redux/fish_redux.dart' as fishRedux;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:rich/pages/splash_page/page.dart';
import 'package:rich/pages/app/page.dart';
import 'package:rich/pages/search_page/page.dart';

class Router {
  static const app = 'app://'; // app主页
  static const splashPage = 'app://splashPage'; // 闪屏页
  static const searchPage = 'app://searchPage'; // 搜索页

  static final fishRedux.AbstractRoutes routes = fishRedux.PageRoutes(pages: {
    Router.app: AppPage(),
    Router.splashPage: SplashPage(),
    Router.searchPage: SearchPage(),
  });

  Router.pushNoParams(BuildContext context, String routeName,
      {Function callback = print}) {
    Navigator.of(context)
        .pushNamed(routeName, arguments: null)
        .then((value) => callback(value));
  }

  Router.push(BuildContext context, String routeName, dynamic params,
      {Function callback = print}) {
    Navigator.of(context)
        .pushNamed(routeName, arguments: params)
        .then((value) => callback(value));
  }

  Router.pushAndRemove(BuildContext context, String routeName, dynamic params,
      {Function callback = print}) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: params)
        .then((value) => callback(value));
  }

  Router.pop(BuildContext context, {dynamic params}) {
    Navigator.of(context).pop(params);
  }
}
