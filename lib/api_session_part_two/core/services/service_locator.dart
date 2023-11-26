import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../database/api/api_interceptor.dart';
import '../database/api/end_points.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: EndPoints.baseUrl),
    ),
  ); getIt<Dio>().interceptors.add(ApiInterceptor());
  getIt<Dio>().interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
 
}
