import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit():super(CounterInitial());
  //*logic
  //1.variables
  int counter=0;
  //2.methods

  void increment(){
    emit(CounterInitial());
    counter++;
    emit(CounterIncrement(counter:counter));
  }
}
class CounterCubitB extends Cubit<CounterState> {
  CounterCubitB():super(CounterInitial());
  //*logic
  //1.variables
  int counter=0;
  //2.methods

  void increment(){
    emit(CounterInitial());
    counter++;
    emit(CounterIncrement(counter:counter));
  }
}