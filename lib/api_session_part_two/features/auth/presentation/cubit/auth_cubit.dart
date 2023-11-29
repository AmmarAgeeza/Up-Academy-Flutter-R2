import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:up_flutter_round_two/api_session_part_two/core/database/api/api_consumer.dart';

import '../../../../core/database/api/end_points.dart';
import '../../../../core/database/cache/cahce_helper.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/commons.dart';
import '../../data/models/login_model.dart';
import '../../data/repository/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final Dio dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
  final AuthRepo authRepo;
  void login() async {
    var data = await authRepo.login(
      email: "flutter.upacademy10@gmail.com",
      password: "ammar123",
    );
    data.fold(
      (l) => printError(l.errorModel.errorMessage),
      (r) => printResponse(r.message),
    );

    // try {
    //   var respose = await getIt<ApiConsumer>().post(
    //     EndPoints.login,
    //     data: {
    //       "email": "flutter.upacademy10@gmail.com",
    //       "password": "ammar123",
    //     },
    //   );
    //   // print(respose.statusCode);
    //   // print(respose.data);
    //   var loginModel = LoginModel.fromJson(respose.data);
    //   await ChacheHelper.prefs.setString('token', loginModel.token);
    //   tokenChef = loginModel.token;
    //   print(loginModel.token);
    //   Map<String, dynamic> decodedToken = JwtDecoder.decode(loginModel.token);
    //   print(decodedToken['id']);
    //   await ChacheHelper.prefs.setString('id', decodedToken['id']);

    /*
      {message: Done,
       token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZTg2NGEzMDM5ZjAwNDY3Mjk4OTFhOSIsImVtYWlsIjoiYW1tYXJmYXRoeTUxNkBnbWFpbC5jb20iLCJuYW1lIjoiQWdlZXphIiwiaWF0IjoxNjk5MzA0MDU0fQ.XnXxHQuCBsKX5rDLtBkdVVUik6zWS_LycHTMhOeMo8o} */
    // } catch (error) {
    //   print(error.toString());
    // }
  }

  String tokenChef = '';
  void logout() async {
    emit(LogoutLoadingState());
    //{
    //   "message": "Done"
//}
    try {
      var res = await getIt<ApiConsumer>().get(
        EndPoints.chefLogout,
      );
      print(res.data["message"]);
      emit(LogoutLoadedState());
    } catch (error) {
      print(error.toString());
      emit(LogoutErrorState());
    }
  }

  void changePassword() async {
    emit(ChangePasswordLoadingState());
    try {
      var res = await getIt<ApiConsumer>().patch(
        EndPoints.chefChangePassword,
        data: {
          "oldPass": "ammar123",
          "newPass": "ammar1234",
          "confirmPassword": "ammar1234"
        },
      );
      print(res.data["message"]);
      emit(ChangePasswordLoadedState());
    } catch (error) {
      print(error.toString());
      emit(ChangePasswordErrorState());
    }
  }

  void deleteChef() async {
    try {
      emit(DeleteLoadingState());
      var res = await getIt<ApiConsumer>().delete(
        EndPoints.deleteChef,
        queryParameters: {
          'id': ChacheHelper.prefs.getString('id'),
        },
      );
      print(res.data);
      emit(DeleteLoadedState());
    } catch (error) {
      print(error.toString());
      emit(DeleteErrorState());
    }
  }
}
