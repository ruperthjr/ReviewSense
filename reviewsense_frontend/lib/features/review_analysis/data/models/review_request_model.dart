import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_request_model.freezed.dart';
part 'review_request_model.g.dart';

@freezed
class ReviewRequestModel with _$ReviewRequestModel {
  const factory ReviewRequestModel({
    required String reviewText,
  }) = _ReviewRequestModel;

  factory ReviewRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewRequestModelFromJson(json);
}