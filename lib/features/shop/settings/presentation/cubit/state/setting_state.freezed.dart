// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SettingState {
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  bool get deleteSuccess => throw _privateConstructorUsedError;

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingStateCopyWith<SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
    SettingState value,
    $Res Function(SettingState) then,
  ) = _$SettingStateCopyWithImpl<$Res, SettingState>;
  @useResult
  $Res call({String userName, String email, String avatar, bool deleteSuccess});
}

/// @nodoc
class _$SettingStateCopyWithImpl<$Res, $Val extends SettingState>
    implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? email = null,
    Object? avatar = null,
    Object? deleteSuccess = null,
  }) {
    return _then(
      _value.copyWith(
            userName:
                null == userName
                    ? _value.userName
                    : userName // ignore: cast_nullable_to_non_nullable
                        as String,
            email:
                null == email
                    ? _value.email
                    : email // ignore: cast_nullable_to_non_nullable
                        as String,
            avatar:
                null == avatar
                    ? _value.avatar
                    : avatar // ignore: cast_nullable_to_non_nullable
                        as String,
            deleteSuccess:
                null == deleteSuccess
                    ? _value.deleteSuccess
                    : deleteSuccess // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SettingStateImplCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory _$$SettingStateImplCopyWith(
    _$SettingStateImpl value,
    $Res Function(_$SettingStateImpl) then,
  ) = __$$SettingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String email, String avatar, bool deleteSuccess});
}

/// @nodoc
class __$$SettingStateImplCopyWithImpl<$Res>
    extends _$SettingStateCopyWithImpl<$Res, _$SettingStateImpl>
    implements _$$SettingStateImplCopyWith<$Res> {
  __$$SettingStateImplCopyWithImpl(
    _$SettingStateImpl _value,
    $Res Function(_$SettingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? email = null,
    Object? avatar = null,
    Object? deleteSuccess = null,
  }) {
    return _then(
      _$SettingStateImpl(
        userName:
            null == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                    as String,
        email:
            null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                    as String,
        avatar:
            null == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                    as String,
        deleteSuccess:
            null == deleteSuccess
                ? _value.deleteSuccess
                : deleteSuccess // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$SettingStateImpl implements _SettingState {
  const _$SettingStateImpl({
    required this.userName,
    required this.email,
    required this.avatar,
    this.deleteSuccess = false,
  });

  @override
  final String userName;
  @override
  final String email;
  @override
  final String avatar;
  @override
  @JsonKey()
  final bool deleteSuccess;

  @override
  String toString() {
    return 'SettingState(userName: $userName, email: $email, avatar: $avatar, deleteSuccess: $deleteSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingStateImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.deleteSuccess, deleteSuccess) ||
                other.deleteSuccess == deleteSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userName, email, avatar, deleteSuccess);

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingStateImplCopyWith<_$SettingStateImpl> get copyWith =>
      __$$SettingStateImplCopyWithImpl<_$SettingStateImpl>(this, _$identity);
}

abstract class _SettingState implements SettingState {
  const factory _SettingState({
    required final String userName,
    required final String email,
    required final String avatar,
    final bool deleteSuccess,
  }) = _$SettingStateImpl;

  @override
  String get userName;
  @override
  String get email;
  @override
  String get avatar;
  @override
  bool get deleteSuccess;

  /// Create a copy of SettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingStateImplCopyWith<_$SettingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
