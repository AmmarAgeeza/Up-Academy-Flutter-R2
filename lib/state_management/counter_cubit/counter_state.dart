abstract class CounterState{}
class CounterIncrement extends CounterState{
  final int counter;

  CounterIncrement({required this.counter});
}
class CounterInitial extends CounterState{}
