import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../core/database/api/end_points.dart';
import '../../data/models/login_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final Dio dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
  void login() async {
    try {
    var respose=  await dio.post(
        EndPoints.login,
        data: {
          "email": "ammarfathy516@gmail.com",
          "password": "ammar123",
        },
      );
      // print(respose.statusCode);
      // print(respose.data);
      var loginModel=LoginModel.fromJson(respose.data);
      print(loginModel.message);
        Map<String, dynamic> decodedToken = JwtDecoder.decode(loginModel.token);
        print(decodedToken['id']);

      /*
      {message: Done,
       token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZTg2NGEzMDM5ZjAwNDY3Mjk4OTFhOSIsImVtYWlsIjoiYW1tYXJmYXRoeTUxNkBnbWFpbC5jb20iLCJuYW1lIjoiQWdlZXphIiwiaWF0IjoxNjk5MzA0MDU0fQ.XnXxHQuCBsKX5rDLtBkdVVUik6zWS_LycHTMhOeMo8o} */
    } catch (error) {
      print(error.toString());
    }
  }

  void logout() async {
    await dio.post(EndPoints.chefLogout);
  }

  void changePassword() async {
    await dio.post(EndPoints.chefChangePassword);
  }

  void deleteChef() async {
    await dio.post(EndPoints.deleteChef);
  }
}
