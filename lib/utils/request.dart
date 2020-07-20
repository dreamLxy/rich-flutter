import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './constant.dart';

class Request {
  Dio dio;

  Request.create(
      {String baseUrl,
      int timeout = 5000,
      String contentType = 'application/json; charset=utf-8',
      Map<String, dynamic> extra,
      Map<String, dynamic /*String|Iterable<String>*/ > queryParameters}) {
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: timeout,
        receiveTimeout: timeout,
        contentType: contentType,
        extra: extra,
        queryParameters: queryParameters));
    dio.interceptors.add(CustomInterceptors());
    dio.interceptors
        .add(LogInterceptor(responseBody: false, requestBody: true));
  }

  dynamic getAsync(url, {queryParameters, options}) async {
    Response res =
        await dio.get(url, queryParameters: queryParameters, options: options);
    return jsonDecode(res.toString());
  }

  dynamic postAsync(url, {data, queryParameters, options}) async {
    Response res = await dio.post(url,
        data: data ??= {}, queryParameters: queryParameters, options: options);
    return jsonDecode(res.toString());
  }
}

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(prefsKeyMap['token']);
    if (token != null) {
      options.headers.addAll({'Authorization': 'Bearer $token'});
    }
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    return super.onError(err);
  }
}
