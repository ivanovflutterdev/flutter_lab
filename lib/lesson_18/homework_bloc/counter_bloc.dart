import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<DecrementEvent>(_decrement);
    on<IncrementEvent>(_increment);
  }

  void _decrement(DecrementEvent event, Emitter<int> emit) {
    final updatedState = state - 1;
    emit(updatedState);
  }

  void _increment(IncrementEvent event, Emitter<int> emit) {
    final updatedState = state + 1;
    emit(updatedState);
  }
}

class CounterEvent {}

class DecrementEvent extends CounterEvent {}

class IncrementEvent extends CounterEvent {}
