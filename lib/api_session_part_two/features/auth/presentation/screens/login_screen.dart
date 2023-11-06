import 'package:flutter/material.dart';

import '../cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //1.  BlocProvider.of<AuthCubit>(context).login();
    //  context.read<AuthCubit>().login();
    return BlocProvider(
      create: (context) => AuthCubit()..login(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('LoginScreen')),
            body: null,
          );
        },
      ),
    );
  }
}
