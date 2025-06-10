import 'package:exercise_1/features/shop/cubit/detail/detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailState(number: 0, isFavorite: false));

  void increment() {
    emit(state.copyWith(number: state.number + 1));
  }

  void decrement() {
    if (state.number > 0) {
      emit(state.copyWith(number: state.number - 1));
    }
  }

  void changeFavorite() {
    emit(state.copyWith(isFavorite: !state.isFavorite));
  }
}
