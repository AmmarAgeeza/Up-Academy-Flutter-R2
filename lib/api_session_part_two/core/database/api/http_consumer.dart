import 'api_consumer.dart';

class HttpConsumer extends ApiConsumer{
  @override
  Future delete(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? data, Map<String, dynamic>? headers}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future patch(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? data, Map<String, dynamic>? headers}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future post(String path, {Map<String, dynamic>? queryParameters, Map<String, dynamic>? data, Map<String, dynamic>? headers}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}