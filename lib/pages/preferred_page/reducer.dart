import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Reducer<PreferredState> buildReducer() {
  return asReducer(
    <Object, Reducer<PreferredState>>{
      PreferredAction.changeTabsAction: _changeTabsAction,
    },
  );
}

PreferredState _changeTabsAction(PreferredState state, Action action) {
  TabController controller = action.payload ?? null;
  final PreferredState newState = state.clone();
  return newState..tabController = controller;
}
