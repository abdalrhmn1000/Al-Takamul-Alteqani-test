// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      items: _$nullableGenericFromJson(json['items'], fromJsonT),
      quotaMax: json['quota_max'] as int?,
      hasMore: json['has_more'] as bool?,
      quotaRemaining: json['quota_remaining'] as int?,
      errorCode: json['error_id'] as int?,
      message: json['error_message'] as String?,
    );

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': _$nullableGenericToJson(instance.items, toJsonT),
      'has_more': instance.hasMore,
      'quota_max': instance.quotaMax,
      'quota_remaining': instance.quotaRemaining,
      'error_id': instance.errorCode,
      'error_message': instance.message,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
