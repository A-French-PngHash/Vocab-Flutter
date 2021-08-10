// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'training_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TrainingStateTearOff {
  const _$TrainingStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Word word(String wordToTranslate, String? comment) {
    return _Word(
      wordToTranslate,
      comment,
    );
  }

  _Correct correction(String wordToTranslate, bool correct,
      String correctTranslation, String? comment, String? grammarRule) {
    return _Correct(
      wordToTranslate,
      correct,
      correctTranslation,
      comment,
      grammarRule,
    );
  }
}

/// @nodoc
const $TrainingState = _$TrainingStateTearOff();

/// @nodoc
mixin _$TrainingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String wordToTranslate, String? comment) word,
    required TResult Function(String wordToTranslate, bool correct,
            String correctTranslation, String? comment, String? grammarRule)
        correction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String wordToTranslate, String? comment)? word,
    TResult Function(String wordToTranslate, bool correct,
            String correctTranslation, String? comment, String? grammarRule)?
        correction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Word value) word,
    required TResult Function(_Correct value) correction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Word value)? word,
    TResult Function(_Correct value)? correction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingStateCopyWith<$Res> {
  factory $TrainingStateCopyWith(
          TrainingState value, $Res Function(TrainingState) then) =
      _$TrainingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TrainingStateCopyWithImpl<$Res>
    implements $TrainingStateCopyWith<$Res> {
  _$TrainingStateCopyWithImpl(this._value, this._then);

  final TrainingState _value;
  // ignore: unused_field
  final $Res Function(TrainingState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$TrainingStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'TrainingState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String wordToTranslate, String? comment) word,
    required TResult Function(String wordToTranslate, bool correct,
            String correctTranslation, String? comment, String? grammarRule)
        correction,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String wordToTranslate, String? comment)? word,
    TResult Function(String wordToTranslate, bool correct,
            String correctTranslation, String? comment, String? grammarRule)?
        correction,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Word value) word,
    required TResult Function(_Correct value) correction,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Word value)? word,
    TResult Function(_Correct value)? correction,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TrainingState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$WordCopyWith<$Res> {
  factory _$WordCopyWith(_Word value, $Res Function(_Word) then) =
      __$WordCopyWithImpl<$Res>;
  $Res call({String wordToTranslate, String? comment});
}

/// @nodoc
class __$WordCopyWithImpl<$Res> extends _$TrainingStateCopyWithImpl<$Res>
    implements _$WordCopyWith<$Res> {
  __$WordCopyWithImpl(_Word _value, $Res Function(_Word) _then)
      : super(_value, (v) => _then(v as _Word));

  @override
  _Word get _value => super._value as _Word;

  @override
  $Res call({
    Object? wordToTranslate = freezed,
    Object? comment = freezed,
  }) {
    return _then(_Word(
      wordToTranslate == freezed
          ? _value.wordToTranslate
          : wordToTranslate // ignore: cast_nullable_to_non_nullable
              as String,
      comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Word implements _Word {
  _$_Word(this.wordToTranslate, this.comment);

  @override
  final String wordToTranslate;
  @override
  final String? comment;

  @override
  String toString() {
    return 'TrainingState.word(wordToTranslate: $wordToTranslate, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Word &&
            (identical(other.wordToTranslate, wordToTranslate) ||
                const DeepCollectionEquality()
                    .equals(other.wordToTranslate, wordToTranslate)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality().equals(other.comment, comment)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(wordToTranslate) ^
      const DeepCollectionEquality().hash(comment);

  @JsonKey(ignore: true)
  @override
  _$WordCopyWith<_Word> get copyWith =>
      __$WordCopyWithImpl<_Word>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String wordToTranslate, String? comment) word,
    required TResult Function(String wordToTranslate, bool correct,
            String correctTranslation, String? comment, String? grammarRule)
        correction,
  }) {
    return word(wordToTranslate, comment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String wordToTranslate, String? comment)? word,
    TResult Function(String wordToTranslate, bool correct,
            String correctTranslation, String? comment, String? grammarRule)?
        correction,
    required TResult orElse(),
  }) {
    if (word != null) {
      return word(wordToTranslate, comment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Word value) word,
    required TResult Function(_Correct value) correction,
  }) {
    return word(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Word value)? word,
    TResult Function(_Correct value)? correction,
    required TResult orElse(),
  }) {
    if (word != null) {
      return word(this);
    }
    return orElse();
  }
}

abstract class _Word implements TrainingState {
  factory _Word(String wordToTranslate, String? comment) = _$_Word;

  String get wordToTranslate => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$WordCopyWith<_Word> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CorrectCopyWith<$Res> {
  factory _$CorrectCopyWith(_Correct value, $Res Function(_Correct) then) =
      __$CorrectCopyWithImpl<$Res>;
  $Res call(
      {String wordToTranslate,
      bool correct,
      String correctTranslation,
      String? comment,
      String? grammarRule});
}

/// @nodoc
class __$CorrectCopyWithImpl<$Res> extends _$TrainingStateCopyWithImpl<$Res>
    implements _$CorrectCopyWith<$Res> {
  __$CorrectCopyWithImpl(_Correct _value, $Res Function(_Correct) _then)
      : super(_value, (v) => _then(v as _Correct));

  @override
  _Correct get _value => super._value as _Correct;

  @override
  $Res call({
    Object? wordToTranslate = freezed,
    Object? correct = freezed,
    Object? correctTranslation = freezed,
    Object? comment = freezed,
    Object? grammarRule = freezed,
  }) {
    return _then(_Correct(
      wordToTranslate == freezed
          ? _value.wordToTranslate
          : wordToTranslate // ignore: cast_nullable_to_non_nullable
              as String,
      correct == freezed
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as bool,
      correctTranslation == freezed
          ? _value.correctTranslation
          : correctTranslation // ignore: cast_nullable_to_non_nullable
              as String,
      comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      grammarRule == freezed
          ? _value.grammarRule
          : grammarRule // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Correct implements _Correct {
  _$_Correct(this.wordToTranslate, this.correct, this.correctTranslation,
      this.comment, this.grammarRule);

  @override
  final String wordToTranslate;
  @override
  final bool correct;
  @override
  final String correctTranslation;
  @override
  final String? comment;
  @override
  final String? grammarRule;

  @override
  String toString() {
    return 'TrainingState.correction(wordToTranslate: $wordToTranslate, correct: $correct, correctTranslation: $correctTranslation, comment: $comment, grammarRule: $grammarRule)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Correct &&
            (identical(other.wordToTranslate, wordToTranslate) ||
                const DeepCollectionEquality()
                    .equals(other.wordToTranslate, wordToTranslate)) &&
            (identical(other.correct, correct) ||
                const DeepCollectionEquality()
                    .equals(other.correct, correct)) &&
            (identical(other.correctTranslation, correctTranslation) ||
                const DeepCollectionEquality()
                    .equals(other.correctTranslation, correctTranslation)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.grammarRule, grammarRule) ||
                const DeepCollectionEquality()
                    .equals(other.grammarRule, grammarRule)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(wordToTranslate) ^
      const DeepCollectionEquality().hash(correct) ^
      const DeepCollectionEquality().hash(correctTranslation) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(grammarRule);

  @JsonKey(ignore: true)
  @override
  _$CorrectCopyWith<_Correct> get copyWith =>
      __$CorrectCopyWithImpl<_Correct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String wordToTranslate, String? comment) word,
    required TResult Function(String wordToTranslate, bool correct,
            String correctTranslation, String? comment, String? grammarRule)
        correction,
  }) {
    return correction(
        wordToTranslate, correct, correctTranslation, comment, grammarRule);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String wordToTranslate, String? comment)? word,
    TResult Function(String wordToTranslate, bool correct,
            String correctTranslation, String? comment, String? grammarRule)?
        correction,
    required TResult orElse(),
  }) {
    if (correction != null) {
      return correction(
          wordToTranslate, correct, correctTranslation, comment, grammarRule);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Word value) word,
    required TResult Function(_Correct value) correction,
  }) {
    return correction(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Word value)? word,
    TResult Function(_Correct value)? correction,
    required TResult orElse(),
  }) {
    if (correction != null) {
      return correction(this);
    }
    return orElse();
  }
}

abstract class _Correct implements TrainingState {
  factory _Correct(
      String wordToTranslate,
      bool correct,
      String correctTranslation,
      String? comment,
      String? grammarRule) = _$_Correct;

  String get wordToTranslate => throw _privateConstructorUsedError;
  bool get correct => throw _privateConstructorUsedError;
  String get correctTranslation => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get grammarRule => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$CorrectCopyWith<_Correct> get copyWith =>
      throw _privateConstructorUsedError;
}
