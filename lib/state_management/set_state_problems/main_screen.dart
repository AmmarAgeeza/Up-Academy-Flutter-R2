import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_flutter_round_two/state_management/counter_cubit/counter_cubit.dart';
import 'dashboard.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
 
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
   
   int countOfBuild=0;
   
  @override
  Widget build(BuildContext context) {
    print(++countOfBuild);
    return Scaffold(
      appBar: AppBar(title: const Text('Demo')),
      body:  Center(
        child: Dashboard(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //emit  initail  state
          //counter++
          //emit counter increment state 
         BlocProvider.of<CounterCubit>(context).increment();
        },
      ),
    );
  }
}
