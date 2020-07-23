import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/widgets.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<PreferredState> buildEffect() {
  return combineEffects(<Object, Effect<PreferredState>>{
    Lifecycle.initState: _initController,
  });
}

void _initController(Action action, Context<PreferredState> ctx) {
  println('_initController_initController_initController');
  final TickerProvider tickerProvider = ctx.stfState as TickerProvider;
  var _controller =
      TabController(vsync: tickerProvider, length: ctx.state.tabs.length);
//  _controller.addListener(() {
//    println(_controller.index);
//  });
  ctx.dispatch(PreferredActionCreator.changeTabsAction(_controller));
}
