import 'dart:convert';

ProfileResp profileRespFromMap(String str) =>
    ProfileResp.fromMap(json.decode(str));

String profileRespToMap(ProfileResp data) => json.encode(data.toMap());

class ProfileResp {
  int? statusCode;
  bool? success;
  String? message;
  ProfileData? data;

  ProfileResp({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  ProfileResp copyWith({
    int? statusCode,
    bool? success,
    String? message,
    ProfileData? data,
  }) =>
      ProfileResp(
        statusCode: statusCode ?? this.statusCode,
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ProfileResp.fromMap(Map<String, dynamic> json) => ProfileResp(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : ProfileData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class ProfileData {
  String? id;
  String? userUniqueId;
  String? email;
  String? role;
  String? socketStatus;
  String? status;
  String? isDelete;
  String? verify;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? accountType;
  LastActive? lastActive;
  RoleInfo? roleInfo;

  ProfileData({
    this.id,
    this.userUniqueId,
    this.email,
    this.role,
    this.socketStatus,
    this.status,
    this.isDelete,
    this.verify,
    this.createdAt,
    this.updatedAt,
    this.accountType,
    this.lastActive,
    this.roleInfo,
  });

  ProfileData copyWith({
    String? id,
    String? userUniqueId,
    String? email,
    String? role,
    String? socketStatus,
    String? status,
    String? isDelete,
    String? verify,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? accountType,
    LastActive? lastActive,
    RoleInfo? roleInfo,
  }) =>
      ProfileData(
        id: id ?? this.id,
        userUniqueId: userUniqueId ?? this.userUniqueId,
        email: email ?? this.email,
        role: role ?? this.role,
        socketStatus: socketStatus ?? this.socketStatus,
        status: status ?? this.status,
        isDelete: isDelete ?? this.isDelete,
        verify: verify ?? this.verify,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        accountType: accountType ?? this.accountType,
        lastActive: lastActive ?? this.lastActive,
        roleInfo: roleInfo ?? this.roleInfo,
      );

  factory ProfileData.fromMap(Map<String, dynamic> json) => ProfileData(
        id: json["_id"],
        userUniqueId: json["userUniqueId"],
        email: json["email"],
        role: json["role"],
        socketStatus: json["socketStatus"],
        status: json["status"],
        isDelete: json["isDelete"],
        verify: json["verify"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        accountType: json["accountType"],
        lastActive: json["lastActive"] == null
            ? null
            : LastActive.fromMap(json["lastActive"]),
        roleInfo: json["roleInfo"] == null
            ? null
            : RoleInfo.fromMap(json["roleInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "userUniqueId": userUniqueId,
        "email": email,
        "role": role,
        "socketStatus": socketStatus,
        "status": status,
        "isDelete": isDelete,
        "verify": verify,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "accountType": accountType,
        "lastActive": lastActive?.toMap(),
        "roleInfo": roleInfo?.toMap(),
      };
}

class LastActive {
  DateTime? createdAt;

  LastActive({
    this.createdAt,
  });

  LastActive copyWith({
    DateTime? createdAt,
  }) =>
      LastActive(
        createdAt: createdAt ?? this.createdAt,
      );

  factory LastActive.fromMap(Map<String, dynamic> json) => LastActive(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toMap() => {
        "createdAt": createdAt?.toIso8601String(),
      };
}

class RoleInfo {
  String? id;
  String? userUniqueId;
  String? email;
  Name? name;
  Address? address;
  String? contactNumber;
  String? gender;
  String? verify;
  String? status;
  String? isDelete;
  DateTime? createdAt;
  DateTime? updatedAt;
  ProfileImage? profileImage;
  String? accountType;

  RoleInfo({
    this.id,
    this.userUniqueId,
    this.email,
    this.name,
    this.address,
    this.contactNumber,
    this.gender,
    this.verify,
    this.status,
    this.isDelete,
    this.createdAt,
    this.updatedAt,
    this.profileImage,
    this.accountType,
  });

  RoleInfo copyWith({
    String? id,
    String? userUniqueId,
    String? email,
    Name? name,
    Address? address,
    String? contactNumber,
    String? gender,
    String? verify,
    String? status,
    String? isDelete,
    DateTime? createdAt,
    DateTime? updatedAt,
    ProfileImage? profileImage,
    String? accountType,
  }) =>
      RoleInfo(
        id: id ?? this.id,
        userUniqueId: userUniqueId ?? this.userUniqueId,
        email: email ?? this.email,
        name: name ?? this.name,
        address: address ?? this.address,
        contactNumber: contactNumber ?? this.contactNumber,
        gender: gender ?? this.gender,
        verify: verify ?? this.verify,
        status: status ?? this.status,
        isDelete: isDelete ?? this.isDelete,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        profileImage: profileImage ?? this.profileImage,
        accountType: accountType ?? this.accountType,
      );

  factory RoleInfo.fromMap(Map<String, dynamic> json) => RoleInfo(
        id: json["_id"],
        userUniqueId: json["userUniqueId"],
        email: json["email"],
        name: json["name"] == null ? null : Name.fromMap(json["name"]),
        address:
            json["address"] == null ? null : Address.fromMap(json["address"]),
        contactNumber: json["contactNumber"],
        gender: json["gender"],
        verify: json["verify"],
        status: json["status"],
        isDelete: json["isDelete"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        profileImage: json["profileImage"] == null
            ? null
            : ProfileImage.fromMap(json["profileImage"]),
        accountType: json["accountType"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "userUniqueId": userUniqueId,
        "email": email,
        "name": name?.toMap(),
        "address": address?.toMap(),
        "contactNumber": contactNumber,
        "gender": gender,
        "verify": verify,
        "status": status,
        "isDelete": isDelete,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "profileImage": profileImage?.toMap(),
        "accountType": accountType,
      };
}

class Address {
  String? area;

  Address({
    this.area,
  });

  Address copyWith({
    String? area,
  }) =>
      Address(
        area: area ?? this.area,
      );

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        area: json["area"],
      );

  Map<String, dynamic> toMap() => {
        "area": area,
      };
}

class Name {
  String? firstName;
  String? lastName;

  Name({
    this.firstName,
    this.lastName,
  });

  Name copyWith({
    String? firstName,
    String? lastName,
  }) =>
      Name(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );

  factory Name.fromMap(Map<String, dynamic> json) => Name(
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
      };
}

class ProfileImage {
  String? url;
  String? originalUrl;
  String? mimetype;
  String? filename;
  String? path;
  String? cdn;
  String? uid;
  String? platform;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProfileImage({
    this.url,
    this.originalUrl,
    this.mimetype,
    this.filename,
    this.path,
    this.cdn,
    this.uid,
    this.platform,
    this.createdAt,
    this.updatedAt,
  });

  ProfileImage copyWith({
    String? url,
    String? originalUrl,
    String? mimetype,
    String? filename,
    String? path,
    String? cdn,
    String? uid,
    String? platform,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ProfileImage(
        url: url ?? this.url,
        originalUrl: originalUrl ?? this.originalUrl,
        mimetype: mimetype ?? this.mimetype,
        filename: filename ?? this.filename,
        path: path ?? this.path,
        cdn: cdn ?? this.cdn,
        uid: uid ?? this.uid,
        platform: platform ?? this.platform,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ProfileImage.fromMap(Map<String, dynamic> json) => ProfileImage(
        url: json["url"],
        originalUrl: json["originalUrl"],
        mimetype: json["mimetype"],
        filename: json["filename"],
        path: json["path"],
        cdn: json["cdn"],
        uid: json["uid"],
        platform: json["platform"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "originalUrl": originalUrl,
        "mimetype": mimetype,
        "filename": filename,
        "path": path,
        "cdn": cdn,
        "uid": uid,
        "platform": platform,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
