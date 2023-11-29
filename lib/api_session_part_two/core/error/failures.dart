import 'error_model.dart';

abstract class Failure {
  final ErrorModel errorModel;

  Failure({required this.errorModel}); 
}
// server
class ServerFailure extends Failure{
  ServerFailure({required super.errorModel});
}
//cache
class CacheFailure extends Failure{
  CacheFailure({required super.errorModel});
}