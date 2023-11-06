import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_flutter_round_two/state_management/counter_cubit/counter_cubit.dart';

import 'api_session/screens/posts_screen.dart';
import 'api_session_part_two/features/auth/presentation/screens/login_screen.dart';
import 'state_management/bloc_observer.dart';

void main() {
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
