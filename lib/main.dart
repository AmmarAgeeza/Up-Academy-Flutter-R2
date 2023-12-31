import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_flutter_round_two/state_management/counter_cubit/counter_cubit.dart';

import 'api_session_part_two/core/database/cache/cahce_helper.dart';
import 'api_session_part_two/core/services/service_locator.dart';
import 'api_session_part_two/features/auth/presentation/screens/login_screen.dart';
import 'state_management/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ChacheHelper.initCache();
  await ChacheHelper.prefs.clear();
  setup();
  Bloc.observer = MyBlocObserver();
  runApp(const RootWidget());
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubitB(),
        ),
        BlocProvider(create: (context) => CounterCubit()),
      ],
      child: const MaterialApp(
        title: 'Up Flutter Round Two',
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}

//{{baseURL}}/chef/delete?id=lasdkgho;asdlgbj ==> QueryParameter
//{{baseURL}}/chef/delete/:id
//{{baseURL}}/chef/delete/7
double divideTwoNumber(num num1, num num2) {
  if (num2 == 0) {
    throw InvalidNumberException(message: 'Invalid Number');
  }
  var result = num1 / num2;
  return result;
}

void test() {
  try {
    divideTwoNumber(1, 1); //=>> Done
    divideTwoNumber(1, 0); //=>> exception
  } on InvalidNumberException catch(error){
    print(error.message);
  }
  
}
class InvalidNumberException implements Exception{
  final String message;

  InvalidNumberException({required this.message});
} 