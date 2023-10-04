// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerModel _$OwnerModelFromJson(Map<String, dynamic> json) => OwnerModel(
      json['account_id'] as int?,
      json['display_name'] as String?,
      json['profile_image'] as String?,
      json['user_type'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$OwnerModelToJson(OwnerModel instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'profile_image': instance.profileImage,
      'display_name': instance.displayName,
      'user_type': instance.userType,
      'link': instance.link,
    };
