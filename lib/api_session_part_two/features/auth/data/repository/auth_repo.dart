import 'package:up_flutter_round_two/api_session_part_two/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/services/service_locator.dart';
import '../models/login_model.dart';

class AuthRepo {
  //login
  Future<Either<Failure,LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await getIt<ApiConsumer>().post(
        EndPoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error){
      print(error.errorModel.errorMessage);
      return Left(ServerFailure(errorModel:error.errorModel ));
    }
  }
  //logout
}
