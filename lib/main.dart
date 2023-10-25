import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_flutter_round_two/state_management/counter_cubit/counter_cubit.dart';

import 'sqflite_session/db_session.dart';
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
        home: DBSession(),
      ),
    );
  }
}
