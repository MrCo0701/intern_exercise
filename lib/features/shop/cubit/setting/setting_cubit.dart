import 'package:exercise_1/features/shop/cubit/setting/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState(userName: '', email: '', avatar: ''));

  void updateUser() {
    emit(
      state.copyWith(
        userName: 'MrCo',
        email: 'nguyenduyhao07012004@gmail.com',
        avatar: 'assets/images/avatar/avatar1.png',
      ),
    );
  }
}
