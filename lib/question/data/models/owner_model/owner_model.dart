import 'package:al_takamul_alteqani_test/question/domain/entities/owner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'owner_model.g.dart';

@JsonSerializable(createToJson: true)
class OwnerModel {
  @JsonKey(name: 'account_id')
  final int? accountId;
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @JsonKey(name: 'display_name')
  final String? displayName;
  @JsonKey(name: 'user_type')
  final String? userType;
  final String? link;

  OwnerModel(
    this.accountId,
    this.displayName,
    this.profileImage,
    this.userType,
    this.link,
  );

  factory OwnerModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerModelToJson(this);
}

extension MapToDomain on OwnerModel {
  Owner toDomain() => Owner(
        accountId: accountId,
        displayName: displayName,
        profileImage: profileImage,
        userType: userType,
        link: link,
      );
}
