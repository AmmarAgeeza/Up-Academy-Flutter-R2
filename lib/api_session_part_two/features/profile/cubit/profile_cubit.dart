import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../core/database/api/end_points.dart';
import '../../../core/database/cache/cahce_helper.dart';
import '../../../core/services/service_locator.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void logout() async {
    emit(LogoutLoadingState());
    //{
    //   "message": "Done"
//}
    try {
      var res = await getIt<Dio>().get(
        EndPoints.chefLogout,
        queryParameters: {},
        options: Options(
          headers: {
            'token': 'FOODAPI ${ChacheHelper.prefs.getString('token')}',
          },
        ),
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
      var res = await getIt<Dio>().patch(
        EndPoints.chefChangePassword,
        data: {
          "oldPass": "ammar123",
          "newPass": "ammar1234",
          "confirmPassword": "ammar1234"
        },
        options: Options(
          headers: {
            'token': 'FOODAPI ${ChacheHelper.prefs.getString('token')}',
          },
        ),
      );
      print(res.data["message"]);
      emit(ChangePasswordLoadedState());
    } catch (error) {
      print(error.toString());
      emit(ChangePasswordErrorState());
    }
  }
}
