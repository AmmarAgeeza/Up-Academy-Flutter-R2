import 'error_model.dart';

class ServerException implements Exception{
final ErrorModel errorModel;
// final String errorMessage;
  ServerException({required this.errorModel});
}