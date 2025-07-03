import 'package:exercise_1/features/shop/settings/data/repository/user_repository.dart';
import 'package:exercise_1/features/shop/settings/presentation/cubit/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState(userName: '', email: '', avatar: ''));

  Future<void> updateUser() async {
    final user = await UserRepository().getUser();
    emit(
      state.copyWith(
        userName: user.data.userInfo.username,
        email: user.data.userInfo.email,
        avatar: user.data.userInfo.profilePic,
      ),
    );
  }

  Future<void> deleteUser() async {
    final deleteSuccess = await UserRepository().deleteUser();
    emit(state.copyWith(deleteSuccess: deleteSuccess));
  }
}
