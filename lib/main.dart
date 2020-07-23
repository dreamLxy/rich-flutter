import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:rich/utils/constant.dart';
//import 'package:fluwx/fluwx.dart';

import './utils/event.dart';
import './router.dart';

void main() {
//  registerWxApi(appId: 'wxea0ae66ccd9bce2b');
  runApp(myApp());
}

Widget myApp() {
  eventBus.on<ShowToastEvent>().listen((event) {
    showToast(event.msg);
  });

  return OKToast(
    child: MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      locale: Locale('zh'),
      theme: ThemeData(
        primaryColor: up,
      ),
      home: Router.routes.buildPage(Router.splashPage, null),
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(builder: (context) {
          return Router.routes.buildPage(settings.name, settings.arguments);
        });
      },
    ),
  );
}
