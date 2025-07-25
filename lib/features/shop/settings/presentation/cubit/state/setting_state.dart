import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    required String userName,
    required String email,
    required String avatar,
    @Default(false) bool deleteSuccess,
  }) = _SettingState;
}
