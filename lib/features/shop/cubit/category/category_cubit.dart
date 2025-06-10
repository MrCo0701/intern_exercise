import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/dummy_data/duumy_data.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState(categories: [], onClickItem: false));

  void addCategoriesFromDummyData() {
    emit(state.copyWith(categories: DummyData().Categories)); // ! should check this again
  }

  void onClickItem() {
    emit(state.copyWith(onClickItem: !state.onClickItem));
    Future.delayed(Duration(seconds: 3), () {
      emit(state.copyWith(onClickItem: !state.onClickItem));
    });
  }
}
