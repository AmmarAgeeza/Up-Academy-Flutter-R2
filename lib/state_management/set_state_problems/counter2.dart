import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter_cubit/counter_cubit.dart';
import '../counter_cubit/counter_state.dart';

class Counter2 extends StatelessWidget {
  const Counter2({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: SizedBox(
        width: 150,
        height: 150,
        child: Center(
          child: BlocListener<CounterCubit, CounterState>(
            listener: (context, state) {
              //state is login sucs => navigate
              //state is login faild => toast
            },
            child: Text(
              BlocProvider.of<CounterCubit>(context).counter.toString(),
              style: const TextStyle(fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
