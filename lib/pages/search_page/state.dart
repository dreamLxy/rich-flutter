import 'package:fish_redux/fish_redux.dart';

class SearchState implements Cloneable<SearchState> {
  List searchRet = [];

  @override
  SearchState clone() {
    return SearchState()..searchRet = searchRet;
  }
}

SearchState initState(Map<String, dynamic> args) {
  return SearchState();
}
