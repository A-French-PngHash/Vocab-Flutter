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

  _Word word(String wordToTranslate, String? comment, int wordNumber,
      String textUnderField, Color textFieldColor) {
    return _Word(
      wordToTranslate,
      comment,
      wordNumber,
      textUnderField,
      textFieldColor,
    );
  }

  _Correct correction(
      String wordToTranslate,
      bool correct,
      String correctTranslation,
      String translationInputed,
      int wordNumber,
      String? comment,
      String? grammarRule,
      String textUnderField,
      Color textFieldColor) {
    return _Correct(
      wordToTranslate,
      correct,
      correctTranslation,
      translationInputed,
      wordNumber,
      comment,
      grammarRule,
      textUnderField,
      textFieldColor,
    );
  }

  _Finished finished(int nbCorrect, int nbIncorrect) {
    return _Finished(
      nbCorrect,
      nbIncorrect,
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
    required TResult Function(String wordToTranslate, String? comment,
            int wordNumber, String textUnderField, Color textFieldColor)
        word,
    required TResult Function(
            String wordToTranslate,
            bool correct,
            String correctTranslation,
            String translationInputed,
            int wordNumber,
            String? comment,
            String? grammarRule,
            String textUnderField,
            Color textFieldColor)
        correction,
    required TResult Function(int nbCorrect, int nbIncorrect) finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String wordToTranslate, String? comment, int wordNumber,
            String textUnderField, Color textFieldColor)?
        word,
    TResult Function(
            String wordToTranslate,
            bool correct,
            String correctTranslation,
            String translationInputed,
            int wordNumber,
            String? comment,
            String? grammarRule,
            String textUnderField,
            Color textFieldColor)?
        correction,
    TResult Function(int nbCorrect, int nbIncorrect)? finished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Word value) word,
    required TResult Function(_Correct value) correction,
    required TResult Function(_Finished value) finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Word value)? word,
    TResult Function(_Correct value)? correction,
    TResult Function(_Finished value)? finished,
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
    required TResult Function(String wordToTranslate, String? comment,
            int wordNumber, String textUnderField, Color textFieldColor)
        word,
    required TResult Function(
            String wordToTranslate,
            bool correct,
            String correctTranslation,
            String translationInputed,
            int wordNumber,
            String? comment,
            String? grammarRule,
            String textUnderField,
            Color textFieldColor)
        correction,
    required TResult Function(int nbCorrect, int nbIncorrect) finished,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String wordToTranslate, String? comment, int wordNumber,
            String textUnderField, Color textFieldColor)?
        word,
    TResult Function(
            String wordToTranslate,
            bool correct,
            String correctTranslation,
            String translationInputed,
            int wordNumber,
            String? comment,
            String? grammarRule,
            String textUnderField,
            Color textFieldColor)?
        correction,
    TResult Function(int nbCorrect, int nbIncorrect)? finished,
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
    required TResult Function(_Finished value) finished,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Word value)? word,
    TResult Function(_Correct value)? correction,
    TResult Function(_Finished value)? finished,
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
  $Res call(
      {String wordToTranslate,
      String? comment,
      int wordNumber,
      String textUnderField,
      Color textFieldColor});
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
    Object? wordNumber = freezed,
    Object? textUnderField = freezed,
    Object? textFieldColor = freezed,
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
      wordNumber == freezed
          ? _value.wordNumber
          : wordNumber // ignore: cast_nullable_to_non_nullable
              as int,
      textUnderField == freezed
          ? _value.textUnderField
          : textUnderField // ignore: cast_nullable_to_non_nullable
              as String,
      textFieldColor == freezed
          ? _value.textFieldColor
          : textFieldColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_Word implements _Word {
  _$_Word(this.wordToTranslate, this.comment, this.wordNumber,
      this.textUnderField, this.textFieldColor);

  @override
  final String wordToTranslate;
  @override
  final String? comment;
  @override
  final int wordNumber;
  @override
  final String textUnderField;
  @override
  final Color textFieldColor;

  @override
  String toString() {
    return 'TrainingState.word(wordToTranslate: $wordToTranslate, comment: $comment, wordNumber: $wordNumber, textUnderField: $textUnderField, textFieldColor: $textFieldColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Word &&
            (identical(other.wordToTranslate, wordToTranslate) ||
                const DeepCollectionEquality()
                    .equals(other.wordToTranslate, wordToTranslate)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.wordNumber, wordNumber) ||
                const DeepCollectionEquality()
                    .equals(other.wordNumber, wordNumber)) &&
            (identical(other.textUnderField, textUnderField) ||
                const DeepCollectionEquality()
                    .equals(other.textUnderField, textUnderField)) &&
            (identical(other.textFieldColor, textFieldColor) ||
                const DeepCollectionEquality()
                    .equals(other.textFieldColor, textFieldColor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(wordToTranslate) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(wordNumber) ^
      const DeepCollectionEquality().hash(textUnderField) ^
      const DeepCollectionEquality().hash(textFieldColor);

  @JsonKey(ignore: true)
  @override
  _$WordCopyWith<_Word> get copyWith =>
      __$WordCopyWithImpl<_Word>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String wordToTranslate, String? comment,
            int wordNumber, String textUnderField, Color textFieldColor)
        word,
    required TResult Function(
            String wordToTranslate,
            bool correct,
            String correctTranslation,
            String translationInputed,
            int wordNumber,
            String? comment,
            String? grammarRule,
            String textUnderField,
            Color textFieldColor)
        correction,
    required TResult Function(int nbCorrect, int nbIncorrect) finished,
  }) {
    return word(
        wordToTranslate, comment, wordNumber, textUnderField, textFieldColor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String wordToTranslate, String? comment, int wordNumber,
            String textUnderField, Color textFieldColor)?
        word,
    TResult Function(
            String wordToTranslate,
            bool correct,
            String correctTranslation,
            String translationInputed,
            int wordNumber,
            String? comment,
            String? grammarRule,
            String textUnderField,
            Color textFieldColor)?
        correction,
    TResult Function(int nbCorrect, int nbIncorrect)? finished,
    required TResult orElse(),
  }) {
    if (word != null) {
      return word(
          wordToTranslate, comment, wordNumber, textUnderField, textFieldColor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Word value) word,
    required TResult Function(_Correct value) correction,
    required TResult Function(_Finished value) finished,
  }) {
    return word(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Word value)? word,
    TResult Function(_Correct value)? correction,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) {
    if (word != null) {
      return word(this);
    }
    return orElse();
  }
}

abstract class _Word implements TrainingState {
  factory _Word(String wordToTranslate, String? comment, int wordNumber,
      String textUnderField, Color textFieldColor) = _$_Word;

  String get wordToTranslate => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  int get wordNumber => throw _privateConstructorUsedError;
  String get textUnderField => throw _privateConstructorUsedError;
  Color get textFieldColor => throw _privateConstructorUsedError;
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
      String translationInputed,
      int wordNumber,
      String? comment,
      String? grammarRule,
      String textUnderField,
      Color textFieldColor});
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
    Object? translationInputed = freezed,
    Object? wordNumber = freezed,
    Object? comment = freezed,
    Object? grammarRule = freezed,
    Object? textUnderField = freezed,
    Object? textFieldColor = freezed,
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
      translationInputed == freezed
          ? _value.translationInputed
          : translationInputed // ignore: cast_nullable_to_non_nullable
              as String,
      wordNumber == freezed
          ? _value.wordNumber
          : wordNumber // ignore: cast_nullable_to_non_nullable
              as int,
      comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      grammarRule == freezed
          ? _value.grammarRule
          : grammarRule // ignore: cast_nullable_to_non_nullable
              as String?,
      textUnderField == freezed
          ? _value.textUnderField
          : textUnderField // ignore: cast_nullable_to_non_nullable
              as String,
      textFieldColor == freezed
          ? _value.textFieldColor
          : textFieldColor // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_Correct implements _Correct {
  _$_Correct(
      this.wordToTranslate,
      this.correct,
      this.correctTranslation,
      this.translationInputed,
      this.wordNumber,
      this.comment,
      this.grammarRule,
      this.textUnderField,
      this.textFieldColor);

  @override
  final String wordToTranslate;
  @override
  final bool correct;
  @override
  final String correctTranslation;
  @override
  final String translationInputed;
  @override
  final int wordNumber;
  @override
  final String? comment;
  @override
  final String? grammarRule;
  @override
  final String textUnderField;
  @override
  final Color textFieldColor;

  @override
  String toString() {
    return 'TrainingState.correction(wordToTranslate: $wordToTranslate, correct: $correct, correctTranslation: $correctTranslation, translationInputed: $translationInputed, wordNumber: $wordNumber, comment: $comment, grammarRule: $grammarRule, textUnderField: $textUnderField, textFieldColor: $textFieldColor)';
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
            (identical(other.translationInputed, translationInputed) ||
                const DeepCollectionEquality()
                    .equals(other.translationInputed, translationInputed)) &&
            (identical(other.wordNumber, wordNumber) ||
                const DeepCollectionEquality()
                    .equals(other.wordNumber, wordNumber)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.grammarRule, grammarRule) ||
                const DeepCollectionEquality()
                    .equals(other.grammarRule, grammarRule)) &&
            (identical(other.textUnderField, textUnderField) ||
                const DeepCollectionEquality()
                    .equals(other.textUnderField, textUnderField)) &&
            (identical(other.textFieldColor, textFieldColor) ||
                const DeepCollectionEquality()
                    .equals(other.textFieldColor, textFieldColor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(wordToTranslate) ^
      const DeepCollectionEquality().hash(correct) ^
      const DeepCollectionEquality().hash(correctTranslation) ^
      const DeepCollectionEquality().hash(translationInputed) ^
      const DeepCollectionEquality().hash(wordNumber) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(grammarRule) ^
      const DeepCollectionEquality().hash(textUnderField) ^
      const DeepCollectionEquality().hash(textFieldColor);

  @JsonKey(ignore: true)
  @override
  _$CorrectCopyWith<_Correct> get copyWith =>
      __$CorrectCopyWithImpl<_Correct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String wordToTranslate, String? comment,
            int wordNumber, String textUnderField, Color textFieldColor)
        word,
    required TResult Function(
            String wordToTranslate,
            bool correct,
            String correctTranslation,
            String translationInputed,
            int wordNumber,
            String? comment,
            String? grammarRule,
            String textUnderField,
            Color textFieldColor)
        correction,
    required TResult Function(int nbCorrect, int nbIncorrect) finished,
  }) {
    return correction(
        wordToTranslate,
        correct,
        correctTranslation,
        translationInputed,
        wordNumber,
        comment,
        grammarRule,
        textUnderField,
        textFieldColor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String wordToTranslate, String? comment, int wordNumber,
            String textUnderField, Color textFieldColor)?
        word,
    TResult Function(
            String wordToTranslate,
            bool correct,
            String correctTranslation,
            String translationInputed,
            int wordNumber,
            String? comment,
            String? grammarRule,
            String textUnderField,
            Color textFieldColor)?
        correction,
    TResult Function(int nbCorrect, int nbIncorrect)? finished,
    required TResult orElse(),
  }) {
    if (correction != null) {
      return correction(
          wordToTranslate,
          correct,
          correctTranslation,
          translationInputed,
          wordNumber,
          comment,
          grammarRule,
          textUnderField,
          textFieldColor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Word value) word,
    required TResult Function(_Correct value) correction,
    required TResult Function(_Finished value) finished,
  }) {
    return correction(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Word value)? word,
    TResult Function(_Correct value)? correction,
    TResult Function(_Finished value)? finished,
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
      String translationInputed,
      int wordNumber,
      String? comment,
      String? grammarRule,
      String textUnderField,
      Color textFieldColor) = _$_Correct;

  String get wordToTranslate => throw _privateConstructorUsedError;
  bool get correct => throw _privateConstructorUsedError;
  String get correctTranslation => throw _privateConstructorUsedError;
  String get translationInputed => throw _privateConstructorUsedError;
  int get wordNumber => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  String? get grammarRule => throw _privateConstructorUsedError;
  String get textUnderField => throw _privateConstructorUsedError;
  Color get textFieldColor => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$CorrectCopyWith<_Correct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FinishedCopyWith<$Res> {
  factory _$FinishedCopyWith(_Finished value, $Res Function(_Finished) then) =
      __$FinishedCopyWithImpl<$Res>;
  $Res call({int nbCorrect, int nbIncorrect});
}

/// @nodoc
class __$FinishedCopyWithImpl<$Res> extends _$TrainingStateCopyWithImpl<$Res>
    implements _$FinishedCopyWith<$Res> {
  __$FinishedCopyWithImpl(_Finished _value, $Res Function(_Finished) _then)
      : super(_value, (v) => _then(v as _Finished));

  @override
  _Finished get _value => super._value as _Finished;

  @override
  $Res call({
    Object? nbCorrect = freezed,
    Object? nbIncorrect = freezed,
  }) {
    return _then(_Finished(
      nbCorrect == freezed
          ? _value.nbCorrect
          : nbCorrect // ignore: cast_nullable_to_non_nullable
              as int,
      nbIncorrect == freezed
          ? _value.nbIncorrect
          : nbIncorrect // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Finished implements _Finished {
  _$_Finished(this.nbCorrect, this.nbIncorrect);

  @override
  final int nbCorrect;
  @override
  final int nbIncorrect;

  @override
  String toString() {
    return 'TrainingState.finished(nbCorrect: $nbCorrect, nbIncorrect: $nbIncorrect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Finished &&
            (identical(other.nbCorrect, nbCorrect) ||
                const DeepCollectionEquality()
                    .equals(other.nbCorrect, nbCorrect)) &&
            (identical(other.nbIncorrect, nbIncorrect) ||
                const DeepCollectionEquality()
                    .equals(other.nbIncorrect, nbIncorrect)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nbCorrect) ^
      const DeepCollectionEquality().hash(nbIncorrect);

  @JsonKey(ignore: true)
  @override
  _$FinishedCopyWith<_Finished> get copyWith =>
      __$FinishedCopyWithImpl<_Finished>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String wordToTranslate, String? comment,
            int wordNumber, String textUnderField, Color textFieldColor)
        word,
    required TResult Function(
            String wordToTranslate,
            bool correct,
            String correctTranslation,
            String translationInputed,
            int wordNumber,
            String? comment,
            String? grammarRule,
            String textUnderField,
            Color textFieldColor)
        correction,
    required TResult Function(int nbCorrect, int nbIncorrect) finished,
  }) {
    return finished(nbCorrect, nbIncorrect);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String wordToTranslate, String? comment, int wordNumber,
            String textUnderField, Color textFieldColor)?
        word,
    TResult Function(
            String wordToTranslate,
            bool correct,
            String correctTranslation,
            String translationInputed,
            int wordNumber,
            String? comment,
            String? grammarRule,
            String textUnderField,
            Color textFieldColor)?
        correction,
    TResult Function(int nbCorrect, int nbIncorrect)? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(nbCorrect, nbIncorrect);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Word value) word,
    required TResult Function(_Correct value) correction,
    required TResult Function(_Finished value) finished,
  }) {
    return finished(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Word value)? word,
    TResult Function(_Correct value)? correction,
    TResult Function(_Finished value)? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class _Finished implements TrainingState {
  factory _Finished(int nbCorrect, int nbIncorrect) = _$_Finished;

  int get nbCorrect => throw _privateConstructorUsedError;
  int get nbIncorrect => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$FinishedCopyWith<_Finished> get copyWith =>
      throw _privateConstructorUsedError;
}
