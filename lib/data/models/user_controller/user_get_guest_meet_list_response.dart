// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:quick_meet/data/models/from_json.dart';

part 'user_get_guest_meet_list_response.g.dart';

@JsonSerializable()
class UserGetGuestMeetListResponse {
  @JsonKey(name: 'address', fromJson: FromJsonBase.jsonToString)
  final String address;
  @JsonKey(name: 'attendRequired', fromJson: FromJsonBase.jsonToBool)
  final bool attendRequired;
  @JsonKey(name: 'avatar')
  final Avatar avatar;
  @JsonKey(name: 'category')
  final Category category;
  @JsonKey(name: 'city')
  final City city;
  @JsonKey(name: 'currentPeople', fromJson: FromJsonBase.jsonToInt)
  final int currentPeople;
  @JsonKey(name: 'dateTime', fromJson: FromJsonBase.jsonToString)
  final String dateTime;
  @JsonKey(name: 'description', fromJson: FromJsonBase.jsonToString)
  final String description;
  @JsonKey(name: 'expectedDuration', fromJson: FromJsonBase.jsonToInt)
  final int expectedDuration;
  @JsonKey(
      name: 'guestRatingProcessRequired', fromJson: FromJsonBase.jsonToBool)
  final bool guestRatingProcessRequired;
  @JsonKey(name: 'guests')
  final List<Guests> guests;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'latitude', fromJson: FromJsonBase.jsonToInt)
  final int latitude;
  @JsonKey(name: 'longevity', fromJson: FromJsonBase.jsonToInt)
  final int longevity;
  @JsonKey(name: 'maxPeople', fromJson: FromJsonBase.jsonToInt)
  final int maxPeople;
  @JsonKey(name: 'meetStatus', fromJson: FromJsonBase.jsonToString)
  final String meetStatus;
  @JsonKey(name: 'name', fromJson: FromJsonBase.jsonToString)
  final String name;
  @JsonKey(name: 'owner')
  final Owner owner;
  @JsonKey(name: 'ownerAttend', fromJson: FromJsonBase.jsonToBool)
  final bool ownerAttend;
  @JsonKey(name: 'rank', fromJson: FromJsonBase.jsonToDouble)
  final double rank;
  @JsonKey(name: 'ratingProcessed', fromJson: FromJsonBase.jsonToBool)
  final bool ratingProcessed;
  @JsonKey(name: 'updateCount', fromJson: FromJsonBase.jsonToInt)
  final int updateCount;
  @JsonKey(name: 'userBlackList', fromJson: FromJsonBase.jsonToListString)
  final List<String> userBlackList;

  const UserGetGuestMeetListResponse({
    this.address = '',
    this.attendRequired = false,
    this.avatar = const Avatar(),
    this.category = const Category(),
    this.city = const City(),
    this.currentPeople = 0,
    this.dateTime = '',
    this.description = '',
    this.expectedDuration = 0,
    this.guestRatingProcessRequired = false,
    this.guests = const <Guests>[],
    this.id = '',
    this.latitude = 0,
    this.longevity = 0,
    this.maxPeople = 0,
    this.meetStatus = '',
    this.name = '',
    this.owner = const Owner(),
    this.ownerAttend = false,
    this.rank = 0,
    this.ratingProcessed = false,
    this.updateCount = 0,
    this.userBlackList = const <String>[],
  });

  factory UserGetGuestMeetListResponse.fromJson(Map<String, dynamic> json) =>
      _$UserGetGuestMeetListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserGetGuestMeetListResponseToJson(this);

  UserGetGuestMeetListResponse copyWith({
    String? address,
    bool? attendRequired,
    Avatar? avatar,
    Category? category,
    City? city,
    int? currentPeople,
    String? dateTime,
    String? description,
    int? expectedDuration,
    bool? guestRatingProcessRequired,
    List<Guests>? guests,
    String? id,
    int? latitude,
    int? longevity,
    int? maxPeople,
    String? meetStatus,
    String? name,
    Owner? owner,
    bool? ownerAttend,
    double? rank,
    bool? ratingProcessed,
    int? updateCount,
    List<String>? userBlackList,
  }) {
    return UserGetGuestMeetListResponse(
      address: address ?? this.address,
      attendRequired: attendRequired ?? this.attendRequired,
      avatar: avatar ?? this.avatar,
      category: category ?? this.category,
      city: city ?? this.city,
      currentPeople: currentPeople ?? this.currentPeople,
      dateTime: dateTime ?? this.dateTime,
      description: description ?? this.description,
      expectedDuration: expectedDuration ?? this.expectedDuration,
      guestRatingProcessRequired:
          guestRatingProcessRequired ?? this.guestRatingProcessRequired,
      guests: guests ?? this.guests,
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longevity: longevity ?? this.longevity,
      maxPeople: maxPeople ?? this.maxPeople,
      meetStatus: meetStatus ?? this.meetStatus,
      name: name ?? this.name,
      owner: owner ?? this.owner,
      ownerAttend: ownerAttend ?? this.ownerAttend,
      rank: rank ?? this.rank,
      ratingProcessed: ratingProcessed ?? this.ratingProcessed,
      updateCount: updateCount ?? this.updateCount,
      userBlackList: userBlackList ?? this.userBlackList,
    );
  }
}

@JsonSerializable()
class Avatar {
  @JsonKey(name: 'fileName', fromJson: FromJsonBase.jsonToString)
  final String fileName;
  @JsonKey(name: 'href', fromJson: FromJsonBase.jsonToString)
  final String href;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;

  const Avatar({
    this.fileName = '',
    this.href = '',
    this.id = '',
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
  Map<String, dynamic> toJson() => _$AvatarToJson(this);

  Avatar copyWith({
    String? fileName,
    String? href,
    String? id,
  }) {
    return Avatar(
      fileName: fileName ?? this.fileName,
      href: href ?? this.href,
      id: id ?? this.id,
    );
  }
}

@JsonSerializable()
class Category {
  @JsonKey(name: 'hidden', fromJson: FromJsonBase.jsonToBool)
  final bool hidden;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'name', fromJson: FromJsonBase.jsonToString)
  final String name;

  const Category({
    this.hidden = false,
    this.id = '',
    this.name = '',
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  Category copyWith({
    bool? hidden,
    String? id,
    String? name,
  }) {
    return Category(
      hidden: hidden ?? this.hidden,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

@JsonSerializable()
class City {
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'name', fromJson: FromJsonBase.jsonToString)
  final String name;

  const City({
    this.id = '',
    this.name = '',
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);

  City copyWith({
    String? id,
    String? name,
  }) {
    return City(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}

@JsonSerializable()
class Guests {
  @JsonKey(name: 'attend', fromJson: FromJsonBase.jsonToBool)
  final bool attend;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'userId', fromJson: FromJsonBase.jsonToString)
  final String userId;

  const Guests({
    this.attend = false,
    this.id = '',
    this.userId = '',
  });

  factory Guests.fromJson(Map<String, dynamic> json) => _$GuestsFromJson(json);
  Map<String, dynamic> toJson() => _$GuestsToJson(this);

  Guests copyWith({
    bool? attend,
    String? id,
    String? userId,
  }) {
    return Guests(
      attend: attend ?? this.attend,
      id: id ?? this.id,
      userId: userId ?? this.userId,
    );
  }
}

@JsonSerializable()
class Owner {
  @JsonKey(name: 'accountClass', fromJson: FromJsonBase.jsonToString)
  final String accountClass;
  @JsonKey(name: 'accountRank', fromJson: FromJsonBase.jsonToDouble)
  final double accountRank;
  @JsonKey(name: 'active', fromJson: FromJsonBase.jsonToBool)
  final bool active;
  @JsonKey(name: 'attendSeries', fromJson: FromJsonBase.jsonToInt)
  final int attendSeries;
  @JsonKey(name: 'avatar')
  final Avatar avatar;
  @JsonKey(name: 'billingAccount')
  final BillingAccount billingAccount;
  @JsonKey(name: 'birthDate', fromJson: FromJsonBase.jsonToString)
  final String birthDate;
  @JsonKey(name: 'blocked', fromJson: FromJsonBase.jsonToBool)
  final bool blocked;
  @JsonKey(name: 'city')
  final City city;
  @JsonKey(name: 'description', fromJson: FromJsonBase.jsonToString)
  final String description;
  @JsonKey(name: 'email', fromJson: FromJsonBase.jsonToString)
  final String email;
  @JsonKey(name: 'emailConfirmed', fromJson: FromJsonBase.jsonToBool)
  final bool emailConfirmed;
  @JsonKey(name: 'firstName', fromJson: FromJsonBase.jsonToString)
  final String firstName;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'lastName', fromJson: FromJsonBase.jsonToString)
  final String lastName;
  @JsonKey(name: 'missSeries', fromJson: FromJsonBase.jsonToInt)
  final int missSeries;
  @JsonKey(name: 'phoneNumber', fromJson: FromJsonBase.jsonToString)
  final String phoneNumber;
  @JsonKey(name: 'registrationDate', fromJson: FromJsonBase.jsonToString)
  final String registrationDate;
  @JsonKey(name: 'removed', fromJson: FromJsonBase.jsonToBool)
  final bool removed;
  @JsonKey(name: 'secondName', fromJson: FromJsonBase.jsonToString)
  final String secondName;

  const Owner({
    this.accountClass = '',
    this.accountRank = 0,
    this.active = false,
    this.attendSeries = 0,
    this.avatar = const Avatar(),
    this.billingAccount = const BillingAccount(),
    this.birthDate = '',
    this.blocked = false,
    this.city = const City(),
    this.description = '',
    this.email = '',
    this.emailConfirmed = false,
    this.firstName = '',
    this.id = '',
    this.lastName = '',
    this.missSeries = 0,
    this.phoneNumber = '',
    this.registrationDate = '',
    this.removed = false,
    this.secondName = '',
  });

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerToJson(this);

  Owner copyWith({
    String? accountClass,
    double? accountRank,
    bool? active,
    int? attendSeries,
    Avatar? avatar,
    BillingAccount? billingAccount,
    String? birthDate,
    bool? blocked,
    City? city,
    String? description,
    String? email,
    bool? emailConfirmed,
    String? firstName,
    String? id,
    String? lastName,
    int? missSeries,
    String? phoneNumber,
    String? registrationDate,
    bool? removed,
    String? secondName,
  }) {
    return Owner(
      accountClass: accountClass ?? this.accountClass,
      accountRank: accountRank ?? this.accountRank,
      active: active ?? this.active,
      attendSeries: attendSeries ?? this.attendSeries,
      avatar: avatar ?? this.avatar,
      billingAccount: billingAccount ?? this.billingAccount,
      birthDate: birthDate ?? this.birthDate,
      blocked: blocked ?? this.blocked,
      city: city ?? this.city,
      description: description ?? this.description,
      email: email ?? this.email,
      emailConfirmed: emailConfirmed ?? this.emailConfirmed,
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      missSeries: missSeries ?? this.missSeries,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      registrationDate: registrationDate ?? this.registrationDate,
      removed: removed ?? this.removed,
      secondName: secondName ?? this.secondName,
    );
  }
}

@JsonSerializable()
class BillingAccount {
  @JsonKey(name: 'cardNumber', fromJson: FromJsonBase.jsonToString)
  final String cardNumber;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'nextBillDate', fromJson: FromJsonBase.jsonToString)
  final String nextBillDate;

  const BillingAccount({
    this.cardNumber = '',
    this.id = '',
    this.nextBillDate = '',
  });

  factory BillingAccount.fromJson(Map<String, dynamic> json) =>
      _$BillingAccountFromJson(json);
  Map<String, dynamic> toJson() => _$BillingAccountToJson(this);

  BillingAccount copyWith({
    String? cardNumber,
    String? id,
    String? nextBillDate,
  }) {
    return BillingAccount(
      cardNumber: cardNumber ?? this.cardNumber,
      id: id ?? this.id,
      nextBillDate: nextBillDate ?? this.nextBillDate,
    );
  }
}
