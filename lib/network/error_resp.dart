import 'dart:convert';

ErrorResp errorRespFromMap(String str) => ErrorResp.fromMap(json.decode(str));

String errorRespToMap(ErrorResp data) => json.encode(data.toMap());

class ErrorResp {
  bool? success;
  String? message;
  List<ErrorSource>? errorSources;
  Err? err;
  String? stack;

  ErrorResp({
    this.success,
    this.message,
    this.errorSources,
    this.err,
    this.stack,
  });

  ErrorResp copyWith({
    bool? success,
    String? message,
    List<ErrorSource>? errorSources,
    Err? err,
    String? stack,
  }) =>
      ErrorResp(
        success: success ?? this.success,
        message: message ?? this.message,
        errorSources: errorSources ?? this.errorSources,
        err: err ?? this.err,
        stack: stack ?? this.stack,
      );

  factory ErrorResp.fromMap(Map<String, dynamic> json) => ErrorResp(
        success: json["success"],
        message: json["message"],
        errorSources: json["errorSources"] == null
            ? []
            : List<ErrorSource>.from(
                json["errorSources"]!.map((x) => ErrorSource.fromMap(x))),
        err: json["err"] == null ? null : Err.fromMap(json["err"]),
        stack: json["stack"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "errorSources": errorSources == null
            ? []
            : List<dynamic>.from(errorSources!.map((x) => x.toMap())),
        "err": err?.toMap(),
        "stack": stack,
      };
}

class Err {
  int? statusCode;

  Err({
    this.statusCode,
  });

  Err copyWith({
    int? statusCode,
  }) =>
      Err(
        statusCode: statusCode ?? this.statusCode,
      );

  factory Err.fromMap(Map<String, dynamic> json) => Err(
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
      };
}

class ErrorSource {
  String? path;
  String? message;

  ErrorSource({
    this.path,
    this.message,
  });

  ErrorSource copyWith({
    String? path,
    String? message,
  }) =>
      ErrorSource(
        path: path ?? this.path,
        message: message ?? this.message,
      );

  factory ErrorSource.fromMap(Map<String, dynamic> json) => ErrorSource(
        path: json["path"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "path": path,
        "message": message,
      };
}
