// part of 'counter_bloc.dart';
//
// abstract class CounterEvent{}
//   class IncrementCounter CounterEvent{}
//   class DecrementCounter CounterEvent{}

part of 'counter_bloc.dart';

abstract class CounterEvent {}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}