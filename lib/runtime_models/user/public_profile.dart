import 'package:freezed_annotation/freezed_annotation.dart';

import '../../net_models/user/public_profile_dto.dart';

part 'public_profile.freezed.dart';

@unfreezed
class PublicProfile with _$PublicProfile {
  factory PublicProfile({
    required String uid,
    PublicProfile? createdBy,
    required String name,
    //Image? profileImage,
  }) = _PublicProfile;

  factory PublicProfile.fromDataTransferObj(PublicProfileDTO publicProfileDTO, String uid,
          {PublicProfile? createdBy}) =>
      PublicProfile(
        uid: uid,
        createdBy: createdBy,
        name: publicProfileDTO.name,
      );

  PublicProfile._();

  bool get isRegistered => createdBy == null;

  PublicProfileDTO get toDataTransferObj => PublicProfileDTO(
        uid: uid,
        createdBy: createdBy?.uid,
        name: name,
      );

  void syncToActiveAccount(PublicProfile activeProfile) {
    if (isRegistered) return;

    //userId = activeProfile.userId;
    //name = activeProfile.name;
    //...

    //TODO: iterate through all bills and replace every instance of itself with the active profile
  }
}
