import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locator.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //1.  BlocProvider.of<AuthCubit>(context).login();
    //  context.read<AuthCubit>().login();
    return BlocProvider(
      create: (context) => getIt<AuthCubit>()..login(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('LoginScreen')),
            body: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context).login();
                    },
                    child: const Text('Login'),
                  ),
                  state is ChangePasswordLoadingState
                      ? const Text('Loading')
                      : ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context)
                                .changePassword();
                          },
                          child: const Text('Change Password'),
                        ),
                  state is DeleteLoadingState
                      ? const Text('Loading')
                      : ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context).deleteChef();
                          },
                          child: const Text('Delete Chef'),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
