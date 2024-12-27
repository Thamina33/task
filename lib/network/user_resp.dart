import 'dart:convert';

UserResp userRespFromMap(String str) => UserResp.fromMap(json.decode(str));

String userRespToMap(UserResp data) => json.encode(data.toMap());

class UserResp {
  int? statusCode;
  bool? success;
  String? message;
  Meta? meta;
  List<UserObj>? data;

  UserResp({
    this.statusCode,
    this.success,
    this.message,
    this.meta,
    this.data,
  });

  UserResp copyWith({
    int? statusCode,
    bool? success,
    String? message,
    Meta? meta,
    List<UserObj>? data,
  }) =>
      UserResp(
        statusCode: statusCode ?? this.statusCode,
        success: success ?? this.success,
        message: message ?? this.message,
        meta: meta ?? this.meta,
        data: data ?? this.data,
      );

  factory UserResp.fromMap(Map<String, dynamic> json) => UserResp(
        statusCode: json["statusCode"],
        success: json["success"],
        message: json["message"],
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
        data: json["data"] == null
            ? []
            : List<UserObj>.from(json["data"]!.map((x) => UserObj.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "success": success,
        "message": message,
        "meta": meta?.toMap(),
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class UserObj {
  String? id;
  String? userUniqueId;
  String? email;
  String? role;
  String? roleType;
  String? accountType;
  String? socketStatus;
  String? status;
  String? isDelete;
  String? verify;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  Authentication? authentication;
  LastActive? lastActive;

  UserObj({
    this.id,
    this.userUniqueId,
    this.email,
    this.role,
    this.roleType,
    this.accountType,
    this.socketStatus,
    this.status,
    this.isDelete,
    this.verify,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.authentication,
    this.lastActive,
  });

  UserObj copyWith({
    String? id,
    String? userUniqueId,
    String? email,
    String? role,
    String? roleType,
    String? accountType,
    String? socketStatus,
    String? status,
    String? isDelete,
    String? verify,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    Authentication? authentication,
    LastActive? lastActive,
  }) =>
      UserObj(
        id: id ?? this.id,
        userUniqueId: userUniqueId ?? this.userUniqueId,
        email: email ?? this.email,
        role: role ?? this.role,
        roleType: roleType ?? this.roleType,
        accountType: accountType ?? this.accountType,
        socketStatus: socketStatus ?? this.socketStatus,
        status: status ?? this.status,
        isDelete: isDelete ?? this.isDelete,
        verify: verify ?? this.verify,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        authentication: authentication ?? this.authentication,
        lastActive: lastActive ?? this.lastActive,
      );

  factory UserObj.fromMap(Map<String, dynamic> json) => UserObj(
        id: json["_id"],
        userUniqueId: json["userUniqueId"],
        email: json["email"],
        role: json["role"],
        roleType: json["roleType"],
        accountType: json["accountType"],
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
        v: json["__v"],
        authentication: json["authentication"] == null
            ? null
            : Authentication.fromMap(json["authentication"]),
        lastActive: json["lastActive"] == null
            ? null
            : LastActive.fromMap(json["lastActive"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "userUniqueId": userUniqueId,
        "email": email,
        "role": role,
        "roleType": roleType,
        "accountType": accountType,
        "socketStatus": socketStatus,
        "status": status,
        "isDelete": isDelete,
        "verify": verify,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "authentication": authentication?.toMap(),
        "lastActive": lastActive?.toMap(),
      };
}

class Authentication {
  String? status;

  Authentication({
    this.status,
  });

  Authentication copyWith({
    String? status,
  }) =>
      Authentication(
        status: status ?? this.status,
      );

  factory Authentication.fromMap(Map<String, dynamic> json) => Authentication(
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
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

class Meta {
  int? page;
  int? limit;
  int? total;

  Meta({
    this.page,
    this.limit,
    this.total,
  });

  Meta copyWith({
    int? page,
    int? limit,
    int? total,
  }) =>
      Meta(
        page: page ?? this.page,
        limit: limit ?? this.limit,
        total: total ?? this.total,
      );

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        page: json["page"],
        limit: json["limit"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "limit": limit,
        "total": total,
      };
}
