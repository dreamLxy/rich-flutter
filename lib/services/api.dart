import '../utils/request.dart';

var request = new Request.create(baseUrl: 'https://service.xy-design.top');

const String prefixUrl = '/rich/api';

/// 快讯数据
fetchNews(data) async {
  return await request.postAsync('$prefixUrl/message', data: data);
}

/// 主力净流入列表
/// data.date 当日0点时间戳
fetchInflowList(data) async {
  return await request.postAsync('$prefixUrl/recomand/inflowList', data: data);
}

/// 今日精选
/// data.date 当日0点时间戳
fetchPreferred(data) async {
  return await request.postAsync('$prefixUrl/recommendList', data: data);
}

/// MA3与MA5推荐列表
/// data.date 当日0点时间戳
fetchMAList(data) async {
  return await request.postAsync('$prefixUrl/recomand/maList', data: data);
}

/// 模糊搜索
search(data) async {
  return await request.postAsync('$prefixUrl/search', data: data);
}