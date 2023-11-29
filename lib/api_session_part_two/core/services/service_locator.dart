import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:up_flutter_round_two/api_session_part_two/core/database/api/api_consumer.dart';
import 'package:up_flutter_round_two/api_session_part_two/core/database/api/dio_consumer.dart';
import 'package:up_flutter_round_two/api_session_part_two/core/database/api/http_consumer.dart';
import 'package:up_flutter_round_two/api_session_part_two/features/auth/data/repository/auth_repo.dart';
import 'package:up_flutter_round_two/api_session_part_two/features/auth/presentation/cubit/auth_cubit.dart';

import '../database/api/api_interceptor.dart';
import '../database/api/end_points.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: EndPoints.baseUrl),
    ),
  );
  // getIt<Dio>().interceptors.add(ApiInterceptor());
  // getIt<Dio>().interceptors.add(
  //       LogInterceptor(
  //         request: true,
  //         requestHeader: true,
  //         requestBody: true,
  //         responseHeader: true,
  //         responseBody: true,
  //         error: true,
  //       ),
  //     );
  // ApiConsumer ss=DioConsumer(dio: Dio());
  getIt.registerSingleton<ApiConsumer>( DioConsumer(dio: getIt()));
  // getIt.registerLazySingleton<ApiConsumer>(()=> HttpConsumer());
  getIt.registerSingleton<AuthRepo>(AuthRepo());
  getIt.registerSingleton<AuthCubit>(AuthCubit(getIt()));
}
