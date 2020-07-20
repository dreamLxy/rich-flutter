import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
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
      home: Router.routes.buildPage(Router.splashPage, null),
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(builder: (context) {
          return Router.routes.buildPage(settings.name, settings.arguments);
        });
      },
    ),
  );
}
