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

  _Loading loading() {
    return _Loading();
  }

  _MainMenuCubitState menu(
      {required String originLanguage,
      required String outputLanguage,
      required String currentUser,
      required List<String> themes}) {
    return _MainMenuCubitState(
      originLanguage: originLanguage,
      outputLanguage: outputLanguage,
      currentUser: currentUser,
      themes: themes,
    );
  }
}

/// @nodoc
const $MainMenuCubitState = _$MainMenuCubitStateTearOff();

/// @nodoc
mixin _$MainMenuCubitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String originLanguage, String outputLanguage,
            String currentUser, List<String> themes)
        menu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String originLanguage, String outputLanguage,
            String currentUser, List<String> themes)?
        menu,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_MainMenuCubitState value) menu,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_MainMenuCubitState value)? menu,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainMenuCubitStateCopyWith<$Res> {
  factory $MainMenuCubitStateCopyWith(
          MainMenuCubitState value, $Res Function(MainMenuCubitState) then) =
      _$MainMenuCubitStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MainMenuCubitStateCopyWithImpl<$Res>
    implements $MainMenuCubitStateCopyWith<$Res> {
  _$MainMenuCubitStateCopyWithImpl(this._value, this._then);

  final MainMenuCubitState _value;
  // ignore: unused_field
  final $Res Function(MainMenuCubitState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$MainMenuCubitStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  _$_Loading();

  @override
  String toString() {
    return 'MainMenuCubitState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String originLanguage, String outputLanguage,
            String currentUser, List<String> themes)
        menu,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String originLanguage, String outputLanguage,
            String currentUser, List<String> themes)?
        menu,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_MainMenuCubitState value) menu,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_MainMenuCubitState value)? menu,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MainMenuCubitState {
  factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$MainMenuCubitStateCopyWith<$Res> {
  factory _$MainMenuCubitStateCopyWith(
          _MainMenuCubitState value, $Res Function(_MainMenuCubitState) then) =
      __$MainMenuCubitStateCopyWithImpl<$Res>;
  $Res call(
      {String originLanguage,
      String outputLanguage,
      String currentUser,
      List<String> themes});
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
    Object? themes = freezed,
  }) {
    return _then(_MainMenuCubitState(
      originLanguage: originLanguage == freezed
          ? _value.originLanguage
          : originLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      outputLanguage: outputLanguage == freezed
          ? _value.outputLanguage
          : outputLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      currentUser: currentUser == freezed
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as String,
      themes: themes == freezed
          ? _value.themes
          : themes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_MainMenuCubitState implements _MainMenuCubitState {
  _$_MainMenuCubitState(
      {required this.originLanguage,
      required this.outputLanguage,
      required this.currentUser,
      required this.themes});

  @override
  final String originLanguage;
  @override
  final String outputLanguage;
  @override
  final String currentUser;
  @override
  final List<String> themes;

  @override
  String toString() {
    return 'MainMenuCubitState.menu(originLanguage: $originLanguage, outputLanguage: $outputLanguage, currentUser: $currentUser, themes: $themes)';
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
                    .equals(other.currentUser, currentUser)) &&
            (identical(other.themes, themes) ||
                const DeepCollectionEquality().equals(other.themes, themes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(originLanguage) ^
      const DeepCollectionEquality().hash(outputLanguage) ^
      const DeepCollectionEquality().hash(currentUser) ^
      const DeepCollectionEquality().hash(themes);

  @JsonKey(ignore: true)
  @override
  _$MainMenuCubitStateCopyWith<_MainMenuCubitState> get copyWith =>
      __$MainMenuCubitStateCopyWithImpl<_MainMenuCubitState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String originLanguage, String outputLanguage,
            String currentUser, List<String> themes)
        menu,
  }) {
    return menu(originLanguage, outputLanguage, currentUser, themes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String originLanguage, String outputLanguage,
            String currentUser, List<String> themes)?
        menu,
    required TResult orElse(),
  }) {
    if (menu != null) {
      return menu(originLanguage, outputLanguage, currentUser, themes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_MainMenuCubitState value) menu,
  }) {
    return menu(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
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
      {required String originLanguage,
      required String outputLanguage,
      required String currentUser,
      required List<String> themes}) = _$_MainMenuCubitState;

  String get originLanguage => throw _privateConstructorUsedError;
  String get outputLanguage => throw _privateConstructorUsedError;
  String get currentUser => throw _privateConstructorUsedError;
  List<String> get themes => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$MainMenuCubitStateCopyWith<_MainMenuCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
