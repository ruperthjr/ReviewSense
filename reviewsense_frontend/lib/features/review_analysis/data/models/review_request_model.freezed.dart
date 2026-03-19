// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewRequestModel _$ReviewRequestModelFromJson(Map<String, dynamic> json) {
  return _ReviewRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewRequestModel {
  String get reviewText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewRequestModelCopyWith<ReviewRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewRequestModelCopyWith<$Res> {
  factory $ReviewRequestModelCopyWith(
          ReviewRequestModel value, $Res Function(ReviewRequestModel) then) =
      _$ReviewRequestModelCopyWithImpl<$Res, ReviewRequestModel>;
  @useResult
  $Res call({String reviewText});
}

/// @nodoc
class _$ReviewRequestModelCopyWithImpl<$Res, $Val extends ReviewRequestModel>
    implements $ReviewRequestModelCopyWith<$Res> {
  _$ReviewRequestModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ReviewRequestModelImplCopyWith<$Res>
    implements $ReviewRequestModelCopyWith<$Res> {
  factory _$$ReviewRequestModelImplCopyWith(_$ReviewRequestModelImpl value,
          $Res Function(_$ReviewRequestModelImpl) then) =
      __$$ReviewRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reviewText});
}

/// @nodoc
class __$$ReviewRequestModelImplCopyWithImpl<$Res>
    extends _$ReviewRequestModelCopyWithImpl<$Res, _$ReviewRequestModelImpl>
    implements _$$ReviewRequestModelImplCopyWith<$Res> {
  __$$ReviewRequestModelImplCopyWithImpl(_$ReviewRequestModelImpl _value,
      $Res Function(_$ReviewRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewText = null,
  }) {
    return _then(_$ReviewRequestModelImpl(
      reviewText: null == reviewText
          ? _value.reviewText
          : reviewText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewRequestModelImpl implements _ReviewRequestModel {
  const _$ReviewRequestModelImpl({required this.reviewText});

  factory _$ReviewRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewRequestModelImplFromJson(json);

  @override
  final String reviewText;

  @override
  String toString() {
    return 'ReviewRequestModel(reviewText: $reviewText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewRequestModelImpl &&
            (identical(other.reviewText, reviewText) ||
                other.reviewText == reviewText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reviewText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewRequestModelImplCopyWith<_$ReviewRequestModelImpl> get copyWith =>
      __$$ReviewRequestModelImplCopyWithImpl<_$ReviewRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewRequestModelImplToJson(
      this,
    );
  }
}

abstract class _ReviewRequestModel implements ReviewRequestModel {
  const factory _ReviewRequestModel({required final String reviewText}) =
      _$ReviewRequestModelImpl;

  factory _ReviewRequestModel.fromJson(Map<String, dynamic> json) =
      _$ReviewRequestModelImpl.fromJson;

  @override
  String get reviewText;
  @override
  @JsonKey(ignore: true)
  _$$ReviewRequestModelImplCopyWith<_$ReviewRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
