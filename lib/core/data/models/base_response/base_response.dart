import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final T? items;
  @JsonKey(name: 'has_more')
  final bool? hasMore;
  @JsonKey(name: 'quota_max')
  final int? quotaMax;
  @JsonKey(name: 'quota_remaining')
  final int? quotaRemaining;

  @JsonKey(name: 'error_id')
  final int? errorCode;
  @JsonKey(name: 'error_message')
  final String? message;

  BaseResponse({
    this.items,
    this.quotaMax,
    this.hasMore,
    this.quotaRemaining,
    this.errorCode,
    this.message,
  });

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);
}
