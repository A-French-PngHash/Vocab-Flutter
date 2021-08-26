// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'picker_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PickerStateTearOff {
  const _$PickerStateTearOff();

  _Initial initial(String description_text, String currentlySelected) {
    return _Initial(
      description_text,
      currentlySelected,
    );
  }

  _Presented presented(List<String> elements, List<String> currentlySelected) {
    return _Presented(
      elements,
      currentlySelected,
    );
  }
}

/// @nodoc
const $PickerState = _$PickerStateTearOff();

/// @nodoc
mixin _$PickerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description_text, String currentlySelected)
        initial,
    required TResult Function(
            List<String> elements, List<String> currentlySelected)
        presented,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description_text, String currentlySelected)?
        initial,
    TResult Function(List<String> elements, List<String> currentlySelected)?
        presented,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Presented value) presented,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Presented value)? presented,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickerStateCopyWith<$Res> {
  factory $PickerStateCopyWith(
          PickerState value, $Res Function(PickerState) then) =
      _$PickerStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PickerStateCopyWithImpl<$Res> implements $PickerStateCopyWith<$Res> {
  _$PickerStateCopyWithImpl(this._value, this._then);

  final PickerState _value;
  // ignore: unused_field
  final $Res Function(PickerState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  $Res call({String description_text, String currentlySelected});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$PickerStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? description_text = freezed,
    Object? currentlySelected = freezed,
  }) {
    return _then(_Initial(
      description_text == freezed
          ? _value.description_text
          : description_text // ignore: cast_nullable_to_non_nullable
              as String,
      currentlySelected == freezed
          ? _value.currentlySelected
          : currentlySelected // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(this.description_text, this.currentlySelected);

  @override
  final String description_text;
  @override
  final String currentlySelected;

  @override
  String toString() {
    return 'PickerState.initial(description_text: $description_text, currentlySelected: $currentlySelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initial &&
            (identical(other.description_text, description_text) ||
                const DeepCollectionEquality()
                    .equals(other.description_text, description_text)) &&
            (identical(other.currentlySelected, currentlySelected) ||
                const DeepCollectionEquality()
                    .equals(other.currentlySelected, currentlySelected)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(description_text) ^
      const DeepCollectionEquality().hash(currentlySelected);

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description_text, String currentlySelected)
        initial,
    required TResult Function(
            List<String> elements, List<String> currentlySelected)
        presented,
  }) {
    return initial(description_text, currentlySelected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description_text, String currentlySelected)?
        initial,
    TResult Function(List<String> elements, List<String> currentlySelected)?
        presented,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(description_text, currentlySelected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Presented value) presented,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Presented value)? presented,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PickerState {
  const factory _Initial(String description_text, String currentlySelected) =
      _$_Initial;

  String get description_text => throw _privateConstructorUsedError;
  String get currentlySelected => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PresentedCopyWith<$Res> {
  factory _$PresentedCopyWith(
          _Presented value, $Res Function(_Presented) then) =
      __$PresentedCopyWithImpl<$Res>;
  $Res call({List<String> elements, List<String> currentlySelected});
}

/// @nodoc
class __$PresentedCopyWithImpl<$Res> extends _$PickerStateCopyWithImpl<$Res>
    implements _$PresentedCopyWith<$Res> {
  __$PresentedCopyWithImpl(_Presented _value, $Res Function(_Presented) _then)
      : super(_value, (v) => _then(v as _Presented));

  @override
  _Presented get _value => super._value as _Presented;

  @override
  $Res call({
    Object? elements = freezed,
    Object? currentlySelected = freezed,
  }) {
    return _then(_Presented(
      elements == freezed
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentlySelected == freezed
          ? _value.currentlySelected
          : currentlySelected // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_Presented implements _Presented {
  const _$_Presented(this.elements, this.currentlySelected);

  @override
  final List<String> elements;
  @override
  final List<String> currentlySelected;

  @override
  String toString() {
    return 'PickerState.presented(elements: $elements, currentlySelected: $currentlySelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Presented &&
            (identical(other.elements, elements) ||
                const DeepCollectionEquality()
                    .equals(other.elements, elements)) &&
            (identical(other.currentlySelected, currentlySelected) ||
                const DeepCollectionEquality()
                    .equals(other.currentlySelected, currentlySelected)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(elements) ^
      const DeepCollectionEquality().hash(currentlySelected);

  @JsonKey(ignore: true)
  @override
  _$PresentedCopyWith<_Presented> get copyWith =>
      __$PresentedCopyWithImpl<_Presented>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String description_text, String currentlySelected)
        initial,
    required TResult Function(
            List<String> elements, List<String> currentlySelected)
        presented,
  }) {
    return presented(elements, currentlySelected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String description_text, String currentlySelected)?
        initial,
    TResult Function(List<String> elements, List<String> currentlySelected)?
        presented,
    required TResult orElse(),
  }) {
    if (presented != null) {
      return presented(elements, currentlySelected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Presented value) presented,
  }) {
    return presented(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Presented value)? presented,
    required TResult orElse(),
  }) {
    if (presented != null) {
      return presented(this);
    }
    return orElse();
  }
}

abstract class _Presented implements PickerState {
  const factory _Presented(
      List<String> elements, List<String> currentlySelected) = _$_Presented;

  List<String> get elements => throw _privateConstructorUsedError;
  List<String> get currentlySelected => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$PresentedCopyWith<_Presented> get copyWith =>
      throw _privateConstructorUsedError;
}
