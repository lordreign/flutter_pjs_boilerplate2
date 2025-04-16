import 'package:dio/dio.dart';
import 'package:flutter_pjs_boilerplate2/common/constants/data.dart';
import 'package:flutter_pjs_boilerplate2/config/dio.dart';
import 'package:flutter_pjs_boilerplate2/providers/secure_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://$ip',
    ),
  );

  final storage = ref.watch(secureStorageProvider);

  dio.interceptors.add(
    DioInterceptor(
      storage: storage,
    ),
  );

  return dio;
});
