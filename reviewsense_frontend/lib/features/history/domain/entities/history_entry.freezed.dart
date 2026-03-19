// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryEntry {
// 0 means "not yet persisted" — DAO will use autoIncrement.
  int get id => throw _privateConstructorUsedError;
  String get reviewText => throw _privateConstructorUsedError;
  String get sentimentLabel => throw _privateConstructorUsedError;
  double get sentimentScore => throw _privateConstructorUsedError;
  String get authenticityLabel => throw _privateConstructorUsedError;
  double get authenticityScore => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryEntryCopyWith<HistoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryEntryCopyWith<$Res> {
  factory $HistoryEntryCopyWith(
          HistoryEntry value, $Res Function(HistoryEntry) then) =
      _$HistoryEntryCopyWithImpl<$Res, HistoryEntry>;
  @useResult
  $Res call(
      {int id,
      String reviewText,
      String sentimentLabel,
      double sentimentScore,
      String authenticityLabel,
      double authenticityScore,
      String summary,
      DateTime createdAt});
}

/// @nodoc
class _$HistoryEntryCopyWithImpl<$Res, $Val extends HistoryEntry>
    implements $HistoryEntryCopyWith<$Res> {
  _$HistoryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reviewText = null,
    Object? sentimentLabel = null,
    Object? sentimentScore = null,
    Object? authenticityLabel = null,
    Object? authenticityScore = null,
    Object? summary = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reviewText: null == reviewText
          ? _value.reviewText
          : reviewText // ignore: cast_nullable_to_non_nullable
              as String,
      sentimentLabel: null == sentimentLabel
          ? _value.sentimentLabel
          : sentimentLabel // ignore: cast_nullable_to_non_nullable
              as String,
      sentimentScore: null == sentimentScore
          ? _value.sentimentScore
          : sentimentScore // ignore: cast_nullable_to_non_nullable
              as double,
      authenticityLabel: null == authenticityLabel
          ? _value.authenticityLabel
          : authenticityLabel // ignore: cast_nullable_to_non_nullable
              as String,
      authenticityScore: null == authenticityScore
          ? _value.authenticityScore
          : authenticityScore // ignore: cast_nullable_to_non_nullable
              as double,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryEntryImplCopyWith<$Res>
    implements $HistoryEntryCopyWith<$Res> {
  factory _$$HistoryEntryImplCopyWith(
          _$HistoryEntryImpl value, $Res Function(_$HistoryEntryImpl) then) =
      __$$HistoryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String reviewText,
      String sentimentLabel,
      double sentimentScore,
      String authenticityLabel,
      double authenticityScore,
      String summary,
      DateTime createdAt});
}

/// @nodoc
class __$$HistoryEntryImplCopyWithImpl<$Res>
    extends _$HistoryEntryCopyWithImpl<$Res, _$HistoryEntryImpl>
    implements _$$HistoryEntryImplCopyWith<$Res> {
  __$$HistoryEntryImplCopyWithImpl(
      _$HistoryEntryImpl _value, $Res Function(_$HistoryEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reviewText = null,
    Object? sentimentLabel = null,
    Object? sentimentScore = null,
    Object? authenticityLabel = null,
    Object? authenticityScore = null,
    Object? summary = null,
    Object? createdAt = null,
  }) {
    return _then(_$HistoryEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reviewText: null == reviewText
          ? _value.reviewText
          : reviewText // ignore: cast_nullable_to_non_nullable
              as String,
      sentimentLabel: null == sentimentLabel
          ? _value.sentimentLabel
          : sentimentLabel // ignore: cast_nullable_to_non_nullable
              as String,
      sentimentScore: null == sentimentScore
          ? _value.sentimentScore
          : sentimentScore // ignore: cast_nullable_to_non_nullable
              as double,
      authenticityLabel: null == authenticityLabel
          ? _value.authenticityLabel
          : authenticityLabel // ignore: cast_nullable_to_non_nullable
              as String,
      authenticityScore: null == authenticityScore
          ? _value.authenticityScore
          : authenticityScore // ignore: cast_nullable_to_non_nullable
              as double,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$HistoryEntryImpl implements _HistoryEntry {
  const _$HistoryEntryImpl(
      {required this.id,
      required this.reviewText,
      required this.sentimentLabel,
      required this.sentimentScore,
      required this.authenticityLabel,
      required this.authenticityScore,
      required this.summary,
      required this.createdAt});

// 0 means "not yet persisted" — DAO will use autoIncrement.
  @override
  @JsonKey()
  final int id;
  @override
  final String reviewText;
  @override
  final String sentimentLabel;
  @override
  final double sentimentScore;
  @override
  final String authenticityLabel;
  @override
  final double authenticityScore;
  @override
  final String summary;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'HistoryEntry(id: $id, reviewText: $reviewText, sentimentLabel: $sentimentLabel, sentimentScore: $sentimentScore, authenticityLabel: $authenticityLabel, authenticityScore: $authenticityScore, summary: $summary, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reviewText, reviewText) ||
                other.reviewText == reviewText) &&
            (identical(other.sentimentLabel, sentimentLabel) ||
                other.sentimentLabel == sentimentLabel) &&
            (identical(other.sentimentScore, sentimentScore) ||
                other.sentimentScore == sentimentScore) &&
            (identical(other.authenticityLabel, authenticityLabel) ||
                other.authenticityLabel == authenticityLabel) &&
            (identical(other.authenticityScore, authenticityScore) ||
                other.authenticityScore == authenticityScore) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, reviewText, sentimentLabel,
      sentimentScore, authenticityLabel, authenticityScore, summary, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryEntryImplCopyWith<_$HistoryEntryImpl> get copyWith =>
      __$$HistoryEntryImplCopyWithImpl<_$HistoryEntryImpl>(this, _$identity);
}

abstract class _HistoryEntry implements HistoryEntry {
  const factory _HistoryEntry(
      {required final int id,
      required final String reviewText,
      required final String sentimentLabel,
      required final double sentimentScore,
      required final String authenticityLabel,
      required final double authenticityScore,
      required final String summary,
      required final DateTime createdAt}) = _$HistoryEntryImpl;

  @override // 0 means "not yet persisted" — DAO will use autoIncrement.
  int get id;
  @override
  String get reviewText;
  @override
  String get sentimentLabel;
  @override
  double get sentimentScore;
  @override
  String get authenticityLabel;
  @override
  double get authenticityScore;
  @override
  String get summary;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$HistoryEntryImplCopyWith<_$HistoryEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
