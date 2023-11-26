import 'package:dio/dio.dart';

import '../cache/cahce_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    print('=>>>>>>>>>>>>>>>>>>>>>>>>Request>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    options.headers['token'] =
        'FOODAPI ${ChacheHelper.prefs.getString('token')}';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    print('=>>>>>>>>>>>>>>>>>>>>>>>>Response>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // if (err.response?.statusCode == 401) {
      // UserModel? authenticatedUser =
      //     await authLocalDataSource.getSavedLoginCredentials();
      // if (authenticatedUser != null) {
      // if (await _refreshToken(
      //   authenticatedUser,
      // )) {
      //   return handler.resolve(await _retry(err.requestOptions));
      // }
      // }
    super.onError(err, handler);
  }
}
