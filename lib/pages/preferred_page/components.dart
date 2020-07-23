import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:rich/components/KeepAliveWidget/view.dart';
import 'state.dart';

class PreferredComponent extends ComponentState<PreferredState>
    with SingleTickerProviderStateMixin {
  @override
  PreferredComponent createState() => PreferredComponent();
}