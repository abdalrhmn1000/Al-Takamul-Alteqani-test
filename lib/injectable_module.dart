import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  final Options _cacheOptions = buildCacheOptions(
    const Duration(days: 7),
  );
  @lazySingleton
  final DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());

  @preResolve
  @lazySingleton
  Future<SharedPreferences> get sharedPref => SharedPreferences.getInstance();

  @lazySingleton
  Dio get dioInstance {
    final dio = Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'clientTZ': 'Asia/Dubai',
        },
        validateStatus: (statusCode) {
          if (statusCode != null) {
            if (200 <= statusCode && statusCode < 300) {
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        },
        extra: _cacheOptions.extra,
      ),
    );
    dio.interceptors.add(_dioCacheManager.interceptor);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          request.sendTimeout = const Duration(milliseconds: 60000);
          request.connectTimeout = const Duration(milliseconds: 60000);
          request.receiveTimeout = const Duration(milliseconds: 60000);

          return handler.next(request);
        },
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
          responseBody: true,
          requestBody: true,
          logPrint: (obj) {
            debugPrint(obj.toString());
          }),
    );
    dio.interceptors.add(CurlLoggerDioInterceptor());
    return dio;
  }

  @lazySingleton
  Logger get logger => Logger();
}
