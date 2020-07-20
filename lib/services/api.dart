import '../utils/request.dart';

var request = new Request.create(baseUrl: 'https://service.xy-design.top');

const String prefixUrl = '/rich/api';

/// 快讯数据
fetchNews(data) async {
  return await request.postAsync('$prefixUrl/message', data: data);
}
