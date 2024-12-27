import 'dart:convert';

LoginResp loginRespFromMap(String str) => LoginResp.fromMap(json.decode(str));

String loginRespToMap(LoginResp data) => json.encode(data.toMap());

class LoginResp {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  LoginResp({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory LoginResp.fromMap(Map<String, dynamic> json) => LoginResp(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  UserData? userData;
  String? accessToken;

  Data({
    this.userData,
    this.accessToken,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        userData: json["userData"] == null
            ? null
            : UserData.fromMap(json["userData"]),
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toMap() => {
        "userData": userData?.toMap(),
        "accessToken": accessToken,
      };
}

class UserData {
  String? role;
  String? roleBaseUserId;
  String? userId;
  String? userUniqueId;
  String? roleType;
  String? email;
  Name? name;
  ProfileImage? profileImage;
  CompanyOwner? companyOwner;

  UserData({
    this.role,
    this.roleBaseUserId,
    this.userId,
    this.userUniqueId,
    this.roleType,
    this.email,
    this.name,
    this.profileImage,
    this.companyOwner,
  });

  factory UserData.fromMap(Map<String, dynamic> json) => UserData(
        role: json["role"],
        roleBaseUserId: json["roleBaseUserId"],
        userId: json["userId"],
        userUniqueId: json["userUniqueId"],
        roleType: json["roleType"],
        email: json["email"],
        name: json["name"] == null ? null : Name.fromMap(json["name"]),
        profileImage: json["profileImage"] == null
            ? null
            : ProfileImage.fromMap(json["profileImage"]),
        companyOwner: json["companyOwner"] == null
            ? null
            : CompanyOwner.fromMap(json["companyOwner"]),
      );

  Map<String, dynamic> toMap() => {
        "role": role,
        "roleBaseUserId": roleBaseUserId,
        "userId": userId,
        "userUniqueId": userUniqueId,
        "roleType": roleType,
        "email": email,
        "name": name?.toMap(),
        "profileImage": profileImage?.toMap(),
        "companyOwner": companyOwner?.toMap(),
      };
}

class CompanyOwner {
  String? role;
  String? userId;
  String? roleBaseUserId;

  CompanyOwner({
    this.role,
    this.userId,
    this.roleBaseUserId,
  });

  factory CompanyOwner.fromMap(Map<String, dynamic> json) => CompanyOwner(
        role: json["role"],
        userId: json["userId"],
        roleBaseUserId: json["roleBaseUserId"],
      );

  Map<String, dynamic> toMap() => {
        "role": role,
        "userId": userId,
        "roleBaseUserId": roleBaseUserId,
      };
}

class Name {
  String? firstName;
  String? lastName;

  Name({
    this.firstName,
    this.lastName,
  });

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
    this.platform,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileImage.fromMap(Map<String, dynamic> json) => ProfileImage(
        url: json["url"],
        originalUrl: json["originalUrl"],
        mimetype: json["mimetype"],
        filename: json["filename"],
        path: json["path"],
        cdn: json["cdn"],
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
        "platform": platform,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
