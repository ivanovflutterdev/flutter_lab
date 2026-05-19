import 'package:flutter_bloc/flutter_bloc.dart';

enum RateAppStatus { initial, loading, success, error }

class RateAppCubit extends Cubit<RateAppState> {
  RateAppCubit() : super(RateAppState());

  void selectRating(int rating) {
    emit(state.copyWith(
      rating: rating,
      status: RateAppStatus.initial,
    ));
  }

  void resetRating() {
    emit(RateAppState());
  }

  Future<void> submitRating() async {
    emit(state.copyWith(status: RateAppStatus.loading));
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(state.copyWith(status: RateAppStatus.success));
  }
}

class RateAppState {

  const RateAppState({
    this.rating = 0,
    this.status = RateAppStatus.initial,
  });
  final int rating;
  final RateAppStatus status;

  RateAppState copyWith({
    int? rating,
    RateAppStatus? status,
  }) {
    return RateAppState(
      rating: rating ?? this.rating,
      status: status ?? this.status,
    );
}
}
