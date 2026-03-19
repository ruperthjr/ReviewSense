// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewRequest {
  String get reviewText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewRequestCopyWith<ReviewRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewRequestCopyWith<$Res> {
  factory $ReviewRequestCopyWith(
          ReviewRequest value, $Res Function(ReviewRequest) then) =
      _$ReviewRequestCopyWithImpl<$Res, ReviewRequest>;
  @useResult
  $Res call({String reviewText});
}

/// @nodoc
class _$ReviewRequestCopyWithImpl<$Res, $Val extends ReviewRequest>
    implements $ReviewRequestCopyWith<$Res> {
  _$ReviewRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewText = null,
  }) {
    return _then(_value.copyWith(
      reviewText: null == reviewText
          ? _value.reviewText
          : reviewText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewRequestImplCopyWith<$Res>
    implements $ReviewRequestCopyWith<$Res> {
  factory _$$ReviewRequestImplCopyWith(
          _$ReviewRequestImpl value, $Res Function(_$ReviewRequestImpl) then) =
      __$$ReviewRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reviewText});
}

/// @nodoc
class __$$ReviewRequestImplCopyWithImpl<$Res>
    extends _$ReviewRequestCopyWithImpl<$Res, _$ReviewRequestImpl>
    implements _$$ReviewRequestImplCopyWith<$Res> {
  __$$ReviewRequestImplCopyWithImpl(
      _$ReviewRequestImpl _value, $Res Function(_$ReviewRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewText = null,
  }) {
    return _then(_$ReviewRequestImpl(
      reviewText: null == reviewText
          ? _value.reviewText
          : reviewText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReviewRequestImpl implements _ReviewRequest {
  const _$ReviewRequestImpl({required this.reviewText});

  @override
  final String reviewText;

  @override
  String toString() {
    return 'ReviewRequest(reviewText: $reviewText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewRequestImpl &&
            (identical(other.reviewText, reviewText) ||
                other.reviewText == reviewText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reviewText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewRequestImplCopyWith<_$ReviewRequestImpl> get copyWith =>
      __$$ReviewRequestImplCopyWithImpl<_$ReviewRequestImpl>(this, _$identity);
}

abstract class _ReviewRequest implements ReviewRequest {
  const factory _ReviewRequest({required final String reviewText}) =
      _$ReviewRequestImpl;

  @override
  String get reviewText;
  @override
  @JsonKey(ignore: true)
  _$$ReviewRequestImplCopyWith<_$ReviewRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
