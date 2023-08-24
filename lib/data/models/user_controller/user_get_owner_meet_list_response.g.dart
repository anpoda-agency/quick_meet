// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_get_owner_meet_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserGetOwnerMeetListResponse _$UserGetOwnerMeetListResponseFromJson(
        Map<String, dynamic> json) =>
    UserGetOwnerMeetListResponse(
      address: json['address'] == null
          ? ''
          : FromJsonBase.jsonToString(json['address']),
      attendRequired: json['attendRequired'] == null
          ? false
          : FromJsonBase.jsonToBool(json['attendRequired']),
      avatar: json['avatar'] == null
          ? const Avatar()
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      category: json['category'] == null
          ? const Category()
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      city: json['city'] == null
          ? const City()
          : City.fromJson(json['city'] as Map<String, dynamic>),
      currentPeople: json['currentPeople'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['currentPeople']),
      dateTime: json['dateTime'] == null
          ? ''
          : FromJsonBase.jsonToString(json['dateTime']),
      description: json['description'] == null
          ? ''
          : FromJsonBase.jsonToString(json['description']),
      expectedDuration: json['expectedDuration'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['expectedDuration']),
      guestRatingProcessRequired: json['guestRatingProcessRequired'] == null
          ? false
          : FromJsonBase.jsonToBool(json['guestRatingProcessRequired']),
      guests: (json['guests'] as List<dynamic>?)
              ?.map((e) => Guests.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Guests>[],
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
      latitude: json['latitude'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['latitude']),
      longevity: json['longevity'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['longevity']),
      maxPeople: json['maxPeople'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['maxPeople']),
      meetStatus: json['meetStatus'] == null
          ? ''
          : FromJsonBase.jsonToString(json['meetStatus']),
      name: json['name'] == null ? '' : FromJsonBase.jsonToString(json['name']),
      owner: json['owner'] == null
          ? const Owner()
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      ownerAttend: json['ownerAttend'] == null
          ? false
          : FromJsonBase.jsonToBool(json['ownerAttend']),
      rank: json['rank'] == null ? 0 : FromJsonBase.jsonToDouble(json['rank']),
      ratingProcessed: json['ratingProcessed'] == null
          ? false
          : FromJsonBase.jsonToBool(json['ratingProcessed']),
      updateCount: json['updateCount'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['updateCount']),
      userBlackList: json['userBlackList'] == null
          ? const <String>[]
          : FromJsonBase.jsonToListString(json['userBlackList']),
    );

Map<String, dynamic> _$UserGetOwnerMeetListResponseToJson(
        UserGetOwnerMeetListResponse instance) =>
    <String, dynamic>{
      'address': instance.address,
      'attendRequired': instance.attendRequired,
      'avatar': instance.avatar,
      'category': instance.category,
      'city': instance.city,
      'currentPeople': instance.currentPeople,
      'dateTime': instance.dateTime,
      'description': instance.description,
      'expectedDuration': instance.expectedDuration,
      'guestRatingProcessRequired': instance.guestRatingProcessRequired,
      'guests': instance.guests,
      'id': instance.id,
      'latitude': instance.latitude,
      'longevity': instance.longevity,
      'maxPeople': instance.maxPeople,
      'meetStatus': instance.meetStatus,
      'name': instance.name,
      'owner': instance.owner,
      'ownerAttend': instance.ownerAttend,
      'rank': instance.rank,
      'ratingProcessed': instance.ratingProcessed,
      'updateCount': instance.updateCount,
      'userBlackList': instance.userBlackList,
    };

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      fileName: json['fileName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['fileName']),
      href: json['href'] == null ? '' : FromJsonBase.jsonToString(json['href']),
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
    );

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'fileName': instance.fileName,
      'href': instance.href,
      'id': instance.id,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      hidden: json['hidden'] == null
          ? false
          : FromJsonBase.jsonToBool(json['hidden']),
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
      name: json['name'] == null ? '' : FromJsonBase.jsonToString(json['name']),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'hidden': instance.hidden,
      'id': instance.id,
      'name': instance.name,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
      name: json['name'] == null ? '' : FromJsonBase.jsonToString(json['name']),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Guests _$GuestsFromJson(Map<String, dynamic> json) => Guests(
      attend: json['attend'] == null
          ? false
          : FromJsonBase.jsonToBool(json['attend']),
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
      userId: json['userId'] == null
          ? ''
          : FromJsonBase.jsonToString(json['userId']),
    );

Map<String, dynamic> _$GuestsToJson(Guests instance) => <String, dynamic>{
      'attend': instance.attend,
      'id': instance.id,
      'userId': instance.userId,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      accountClass: json['accountClass'] == null
          ? ''
          : FromJsonBase.jsonToString(json['accountClass']),
      accountRank: json['accountRank'] == null
          ? 0
          : FromJsonBase.jsonToDouble(json['accountRank']),
      active: json['active'] == null
          ? false
          : FromJsonBase.jsonToBool(json['active']),
      attendSeries: json['attendSeries'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['attendSeries']),
      avatar: json['avatar'] == null
          ? const Avatar()
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      billingAccount: json['billingAccount'] == null
          ? const BillingAccount()
          : BillingAccount.fromJson(
              json['billingAccount'] as Map<String, dynamic>),
      birthDate: json['birthDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['birthDate']),
      blocked: json['blocked'] == null
          ? false
          : FromJsonBase.jsonToBool(json['blocked']),
      city: json['city'] == null
          ? const City()
          : City.fromJson(json['city'] as Map<String, dynamic>),
      description: json['description'] == null
          ? ''
          : FromJsonBase.jsonToString(json['description']),
      email:
          json['email'] == null ? '' : FromJsonBase.jsonToString(json['email']),
      emailConfirmed: json['emailConfirmed'] == null
          ? false
          : FromJsonBase.jsonToBool(json['emailConfirmed']),
      firstName: json['firstName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['firstName']),
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
      lastName: json['lastName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['lastName']),
      missSeries: json['missSeries'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['missSeries']),
      phoneNumber: json['phoneNumber'] == null
          ? ''
          : FromJsonBase.jsonToString(json['phoneNumber']),
      registrationDate: json['registrationDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['registrationDate']),
      removed: json['removed'] == null
          ? false
          : FromJsonBase.jsonToBool(json['removed']),
      secondName: json['secondName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['secondName']),
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'accountClass': instance.accountClass,
      'accountRank': instance.accountRank,
      'active': instance.active,
      'attendSeries': instance.attendSeries,
      'avatar': instance.avatar,
      'billingAccount': instance.billingAccount,
      'birthDate': instance.birthDate,
      'blocked': instance.blocked,
      'city': instance.city,
      'description': instance.description,
      'email': instance.email,
      'emailConfirmed': instance.emailConfirmed,
      'firstName': instance.firstName,
      'id': instance.id,
      'lastName': instance.lastName,
      'missSeries': instance.missSeries,
      'phoneNumber': instance.phoneNumber,
      'registrationDate': instance.registrationDate,
      'removed': instance.removed,
      'secondName': instance.secondName,
    };

BillingAccount _$BillingAccountFromJson(Map<String, dynamic> json) =>
    BillingAccount(
      cardNumber: json['cardNumber'] == null
          ? ''
          : FromJsonBase.jsonToString(json['cardNumber']),
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
      nextBillDate: json['nextBillDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['nextBillDate']),
    );

Map<String, dynamic> _$BillingAccountToJson(BillingAccount instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'id': instance.id,
      'nextBillDate': instance.nextBillDate,
    };
