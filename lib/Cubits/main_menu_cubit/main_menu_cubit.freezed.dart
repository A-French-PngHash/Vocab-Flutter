// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'main_menu_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MainMenuCubitStateTearOff {
  const _$MainMenuCubitStateTearOff();

  _MainMenuCubitState menu(
      {required Language originLanguage,
      required Language outputLanguage,
      required User currentUser}) {
    return _MainMenuCubitState(
      originLanguage: originLanguage,
      outputLanguage: outputLanguage,
      currentUser: currentUser,
    );
  }
}

/// @nodoc
const $MainMenuCubitState = _$MainMenuCubitStateTearOff();

/// @nodoc
mixin _$MainMenuCubitState {
  Language get originLanguage => throw _privateConstructorUsedError;
  Language get outputLanguage => throw _privateConstructorUsedError;
  User get currentUser => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Language originLanguage, Language outputLanguage, User currentUser)
        menu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Language originLanguage, Language outputLanguage, User currentUser)?
        menu,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainMenuCubitState value) menu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainMenuCubitState value)? menu,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainMenuCubitStateCopyWith<MainMenuCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainMenuCubitStateCopyWith<$Res> {
  factory $MainMenuCubitStateCopyWith(
          MainMenuCubitState value, $Res Function(MainMenuCubitState) then) =
      _$MainMenuCubitStateCopyWithImpl<$Res>;
  $Res call(
      {Language originLanguage, Language outputLanguage, User currentUser});
}

/// @nodoc
class _$MainMenuCubitStateCopyWithImpl<$Res>
    implements $MainMenuCubitStateCopyWith<$Res> {
  _$MainMenuCubitStateCopyWithImpl(this._value, this._then);

  final MainMenuCubitState _value;
  // ignore: unused_field
  final $Res Function(MainMenuCubitState) _then;

  @override
  $Res call({
    Object? originLanguage = freezed,
    Object? outputLanguage = freezed,
    Object? currentUser = freezed,
  }) {
    return _then(_value.copyWith(
      originLanguage: originLanguage == freezed
          ? _value.originLanguage
          : originLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
      outputLanguage: outputLanguage == freezed
          ? _value.outputLanguage
          : outputLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
      currentUser: currentUser == freezed
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
abstract class _$MainMenuCubitStateCopyWith<$Res>
    implements $MainMenuCubitStateCopyWith<$Res> {
  factory _$MainMenuCubitStateCopyWith(
          _MainMenuCubitState value, $Res Function(_MainMenuCubitState) then) =
      __$MainMenuCubitStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Language originLanguage, Language outputLanguage, User currentUser});
}

/// @nodoc
class __$MainMenuCubitStateCopyWithImpl<$Res>
    extends _$MainMenuCubitStateCopyWithImpl<$Res>
    implements _$MainMenuCubitStateCopyWith<$Res> {
  __$MainMenuCubitStateCopyWithImpl(
      _MainMenuCubitState _value, $Res Function(_MainMenuCubitState) _then)
      : super(_value, (v) => _then(v as _MainMenuCubitState));

  @override
  _MainMenuCubitState get _value => super._value as _MainMenuCubitState;

  @override
  $Res call({
    Object? originLanguage = freezed,
    Object? outputLanguage = freezed,
    Object? currentUser = freezed,
  }) {
    return _then(_MainMenuCubitState(
      originLanguage: originLanguage == freezed
          ? _value.originLanguage
          : originLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
      outputLanguage: outputLanguage == freezed
          ? _value.outputLanguage
          : outputLanguage // ignore: cast_nullable_to_non_nullable
              as Language,
      currentUser: currentUser == freezed
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_MainMenuCubitState implements _MainMenuCubitState {
  _$_MainMenuCubitState(
      {required this.originLanguage,
      required this.outputLanguage,
      required this.currentUser});

  @override
  final Language originLanguage;
  @override
  final Language outputLanguage;
  @override
  final User currentUser;

  @override
  String toString() {
    return 'MainMenuCubitState.menu(originLanguage: $originLanguage, outputLanguage: $outputLanguage, currentUser: $currentUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MainMenuCubitState &&
            (identical(other.originLanguage, originLanguage) ||
                const DeepCollectionEquality()
                    .equals(other.originLanguage, originLanguage)) &&
            (identical(other.outputLanguage, outputLanguage) ||
                const DeepCollectionEquality()
                    .equals(other.outputLanguage, outputLanguage)) &&
            (identical(other.currentUser, currentUser) ||
                const DeepCollectionEquality()
                    .equals(other.currentUser, currentUser)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(originLanguage) ^
      const DeepCollectionEquality().hash(outputLanguage) ^
      const DeepCollectionEquality().hash(currentUser);

  @JsonKey(ignore: true)
  @override
  _$MainMenuCubitStateCopyWith<_MainMenuCubitState> get copyWith =>
      __$MainMenuCubitStateCopyWithImpl<_MainMenuCubitState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Language originLanguage, Language outputLanguage, User currentUser)
        menu,
  }) {
    return menu(originLanguage, outputLanguage, currentUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Language originLanguage, Language outputLanguage, User currentUser)?
        menu,
    required TResult orElse(),
  }) {
    if (menu != null) {
      return menu(originLanguage, outputLanguage, currentUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainMenuCubitState value) menu,
  }) {
    return menu(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainMenuCubitState value)? menu,
    required TResult orElse(),
  }) {
    if (menu != null) {
      return menu(this);
    }
    return orElse();
  }
}

abstract class _MainMenuCubitState implements MainMenuCubitState {
  factory _MainMenuCubitState(
      {required Language originLanguage,
      required Language outputLanguage,
      required User currentUser}) = _$_MainMenuCubitState;

  @override
  Language get originLanguage => throw _privateConstructorUsedError;
  @override
  Language get outputLanguage => throw _privateConstructorUsedError;
  @override
  User get currentUser => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MainMenuCubitStateCopyWith<_MainMenuCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
