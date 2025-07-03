import 'package:exercise_1/features/shop/settings/data/repository_impl/user_repository_impl.dart';
import 'package:exercise_1/features/shop/settings/domain/usecase/user_usecase.dart';
import 'package:exercise_1/features/shop/settings/presentation/cubit/state/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  final UserUseCase userUseCase;

  SettingCubit(this.userUseCase) : super(SettingState(userName: '', email: '', avatar: ''));

  Future<void> updateUser() async {
    final user = await userUseCase.updateUser();
    emit(
      state.copyWith(
        userName: user.username,
        email: user.email,
        avatar: user.avatar,
      ),
    );
  }

  Future<void> deleteUser() async {
    final deleteSuccess = await userUseCase.deleteUser();
    emit(state.copyWith(deleteSuccess: deleteSuccess));
  }
}
