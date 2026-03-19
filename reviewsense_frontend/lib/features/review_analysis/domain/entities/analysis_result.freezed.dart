// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnalysisResult {
  String get sentimentLabel => throw _privateConstructorUsedError;
  double get sentimentScore => throw _privateConstructorUsedError;
  double get authenticityScore => throw _privateConstructorUsedError;
  String get authenticityLabel => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalysisResultCopyWith<AnalysisResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisResultCopyWith<$Res> {
  factory $AnalysisResultCopyWith(
          AnalysisResult value, $Res Function(AnalysisResult) then) =
      _$AnalysisResultCopyWithImpl<$Res, AnalysisResult>;
  @useResult
  $Res call(
      {String sentimentLabel,
      double sentimentScore,
      double authenticityScore,
      String authenticityLabel,
      String summary});
}

/// @nodoc
class _$AnalysisResultCopyWithImpl<$Res, $Val extends AnalysisResult>
    implements $AnalysisResultCopyWith<$Res> {
  _$AnalysisResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentimentLabel = null,
    Object? sentimentScore = null,
    Object? authenticityScore = null,
    Object? authenticityLabel = null,
    Object? summary = null,
  }) {
    return _then(_value.copyWith(
      sentimentLabel: null == sentimentLabel
          ? _value.sentimentLabel
          : sentimentLabel // ignore: cast_nullable_to_non_nullable
              as String,
      sentimentScore: null == sentimentScore
          ? _value.sentimentScore
          : sentimentScore // ignore: cast_nullable_to_non_nullable
              as double,
      authenticityScore: null == authenticityScore
          ? _value.authenticityScore
          : authenticityScore // ignore: cast_nullable_to_non_nullable
              as double,
      authenticityLabel: null == authenticityLabel
          ? _value.authenticityLabel
          : authenticityLabel // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalysisResultImplCopyWith<$Res>
    implements $AnalysisResultCopyWith<$Res> {
  factory _$$AnalysisResultImplCopyWith(_$AnalysisResultImpl value,
          $Res Function(_$AnalysisResultImpl) then) =
      __$$AnalysisResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sentimentLabel,
      double sentimentScore,
      double authenticityScore,
      String authenticityLabel,
      String summary});
}

/// @nodoc
class __$$AnalysisResultImplCopyWithImpl<$Res>
    extends _$AnalysisResultCopyWithImpl<$Res, _$AnalysisResultImpl>
    implements _$$AnalysisResultImplCopyWith<$Res> {
  __$$AnalysisResultImplCopyWithImpl(
      _$AnalysisResultImpl _value, $Res Function(_$AnalysisResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentimentLabel = null,
    Object? sentimentScore = null,
    Object? authenticityScore = null,
    Object? authenticityLabel = null,
    Object? summary = null,
  }) {
    return _then(_$AnalysisResultImpl(
      sentimentLabel: null == sentimentLabel
          ? _value.sentimentLabel
          : sentimentLabel // ignore: cast_nullable_to_non_nullable
              as String,
      sentimentScore: null == sentimentScore
          ? _value.sentimentScore
          : sentimentScore // ignore: cast_nullable_to_non_nullable
              as double,
      authenticityScore: null == authenticityScore
          ? _value.authenticityScore
          : authenticityScore // ignore: cast_nullable_to_non_nullable
              as double,
      authenticityLabel: null == authenticityLabel
          ? _value.authenticityLabel
          : authenticityLabel // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AnalysisResultImpl implements _AnalysisResult {
  const _$AnalysisResultImpl(
      {required this.sentimentLabel,
      required this.sentimentScore,
      required this.authenticityScore,
      required this.authenticityLabel,
      required this.summary});

  @override
  final String sentimentLabel;
  @override
  final double sentimentScore;
  @override
  final double authenticityScore;
  @override
  final String authenticityLabel;
  @override
  final String summary;

  @override
  String toString() {
    return 'AnalysisResult(sentimentLabel: $sentimentLabel, sentimentScore: $sentimentScore, authenticityScore: $authenticityScore, authenticityLabel: $authenticityLabel, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisResultImpl &&
            (identical(other.sentimentLabel, sentimentLabel) ||
                other.sentimentLabel == sentimentLabel) &&
            (identical(other.sentimentScore, sentimentScore) ||
                other.sentimentScore == sentimentScore) &&
            (identical(other.authenticityScore, authenticityScore) ||
                other.authenticityScore == authenticityScore) &&
            (identical(other.authenticityLabel, authenticityLabel) ||
                other.authenticityLabel == authenticityLabel) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sentimentLabel, sentimentScore,
      authenticityScore, authenticityLabel, summary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisResultImplCopyWith<_$AnalysisResultImpl> get copyWith =>
      __$$AnalysisResultImplCopyWithImpl<_$AnalysisResultImpl>(
          this, _$identity);
}

abstract class _AnalysisResult implements AnalysisResult {
  const factory _AnalysisResult(
      {required final String sentimentLabel,
      required final double sentimentScore,
      required final double authenticityScore,
      required final String authenticityLabel,
      required final String summary}) = _$AnalysisResultImpl;

  @override
  String get sentimentLabel;
  @override
  double get sentimentScore;
  @override
  double get authenticityScore;
  @override
  String get authenticityLabel;
  @override
  String get summary;
  @override
  @JsonKey(ignore: true)
  _$$AnalysisResultImplCopyWith<_$AnalysisResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
