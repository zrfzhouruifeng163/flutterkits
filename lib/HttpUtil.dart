import 'package:dio/dio.dart';
import 'dart:async';

/*
 * 封装 网络请求
 */
class HttpUtil {
  static Dio dio;

  static const String BASE_URL = 'https://xx/sx/ss';
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;

  static Future<Response<T>> get<T>(String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) {
    return getDio().get(path, queryParameters:queryParameters,options: options,cancelToken: cancelToken,onReceiveProgress: onReceiveProgress);
  }

  static Future<Response> post(path, params) {
    return getDio().post(path, queryParameters: params);
  }

  static Future<Response> put(path, params) {
    return getDio().put(path, queryParameters: params);
  }

  static Future<Response> delete(path, params) {
    return getDio().delete(path, queryParameters: params);
  }

  static Future<Response> patch(path, params) {
    return getDio().patch(path, queryParameters: params);
  }

  static Dio getDio() {
    if (dio == null) {
      BaseOptions options = new BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
      );
      dio = new Dio(options);
    }
    return dio;
  }

  static clear() {
    dio = null;
  }
}

