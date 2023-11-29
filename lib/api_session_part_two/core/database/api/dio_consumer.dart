import 'package:dio/dio.dart';
import 'package:up_flutter_round_two/api_session_part_two/core/database/api/api_consumer.dart';
import 'package:up_flutter_round_two/api_session_part_two/core/database/api/api_interceptor.dart';
import 'package:up_flutter_round_two/api_session_part_two/core/error/exceptions.dart';

import '../../error/error_model.dart';
import 'end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({
    required this.dio,
  }) {
    dio.options
      .baseUrl = EndPoints.baseUrl;
      // ..connectTimeout = const Duration(seconds: 2);
    dio.interceptors.add(LogInterceptor(
      requestBody : true,
      responseBody : true,
    ));
    dio.interceptors.add(ApiInterceptor());
  }

  @override
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return response;
    } on DioException catch (dioError) {
      _handleDioError(dioError);
    }
  }

  @override
  Future patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return response.data;
    } on DioException catch (dioError) {
      _handleDioError(dioError);
    }
  }

  @override
  Future delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }

  _handleDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
        throw ServerException(
            errorModel:
                ErrorModel(statusCode: 405, errorMessage: 'connectionError'));
      case DioExceptionType.badResponse:
        switch (dioException.response!.statusCode) {
          case 400:
            throw ServerException(
                errorModel: ErrorModel.fromJson(dioException.response!.data));
        }
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
    }
  }
}
