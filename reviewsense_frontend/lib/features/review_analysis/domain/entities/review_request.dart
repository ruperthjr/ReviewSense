import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_request.freezed.dart';

@freezed
class ReviewRequest with _$ReviewRequest {
  const factory ReviewRequest({
    required String reviewText,
  }) = _ReviewRequest;
}