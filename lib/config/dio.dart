import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  DioInterceptor({required this.storage});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Do something before request is sent
    print('REQUEST[${options.method}] => URI: ${options.uri}');

    // ... dio request interceptor

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print(
        'ERROR[${err.requestOptions.method}][${err.response?.statusCode}] => URI: ${err.requestOptions.uri}');

    // ... dio error interceptor

    return handler.reject(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.requestOptions.method}] => URI: ${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }
}
