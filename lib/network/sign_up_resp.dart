import 'dart:convert';

RegisterResp registerRespFromMap(String str) =>
    RegisterResp.fromMap(json.decode(str));

String registerRespToMap(RegisterResp data) => json.encode(data.toMap());

class RegisterResp {
  bool? success;
  String? message;
  Data? data;

  RegisterResp({
    this.success,
    this.message,
    this.data,
  });

  factory RegisterResp.fromMap(Map<String, dynamic> json) => RegisterResp(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  User? user;
  OtpToken? otpToken;

  Data({
    this.user,
    this.otpToken,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        otpToken: json["otpToken"] == null
            ? null
            : OtpToken.fromMap(json["otpToken"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "otpToken": otpToken?.toMap(),
      };
}

class OtpToken {
  String? token;

  OtpToken({
    this.token,
  });

  factory OtpToken.fromMap(Map<String, dynamic> json) => OtpToken(
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
      };
}

class User {
  String? status;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  dynamic gender;
  dynamic dateOfBirth;
  bool? isGoogleLogin;
  dynamic image;
  String? role;
  dynamic address;
  bool? isDeleted;
  Verification? verification;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  User({
    this.status,
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
    this.gender,
    this.dateOfBirth,
    this.isGoogleLogin,
    this.image,
    this.role,
    this.address,
    this.isDeleted,
    this.verification,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        status: json["status"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        gender: json["gender"],
        dateOfBirth: json["dateOfBirth"],
        isGoogleLogin: json["isGoogleLogin"],
        image: json["image"],
        role: json["role"],
        address: json["address"],
        isDeleted: json["isDeleted"],
        verification: json["verification"] == null
            ? null
            : Verification.fromMap(json["verification"]),
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "gender": gender,
        "dateOfBirth": dateOfBirth,
        "isGoogleLogin": isGoogleLogin,
        "image": image,
        "role": role,
        "address": address,
        "isDeleted": isDeleted,
        "verification": verification?.toMap(),
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Verification {
  int? otp;
  bool? status;

  Verification({
    this.otp,
    this.status,
  });

  factory Verification.fromMap(Map<String, dynamic> json) => Verification(
        otp: json["otp"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "otp": otp,
        "status": status,
      };
}
