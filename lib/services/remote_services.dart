import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_http_logger/pretty_http_logger.dart';
import '../utility/api_const.dart';
import '../utility/shared_pref.dart';

class RemoteServices extends GetxService {
  static var client = HttpWithMiddleware.build(
      middlewares: [HttpLogger(logLevel: LogLevel.BODY)]);

  //http.Client();

  Future<http.Response> getRequest(String path, bool isAuth) async {
    var header = {"Content-Type": "application/json"};
    var token = "";

    if (isAuth) {
      var tokenValue = await SharePrefHelper.getUserData(Constants.TOKEN);
      token = "$tokenValue";
      print(token);
    }

    var response = await RemoteServices.client.get(
      Uri.parse("${ApiConstants.baseUrl}$path"),
      headers: {
        'Authorization': token,
        "Content-Type": "application/json",
      },
    );

    debugPrint(response.body.toString());
    if (kDebugMode) {
      print(header.toString());
    }
    if (kDebugMode) {
      print(token);
    }
    debugPrint("${ApiConstants.baseUrl}$path");
    debugPrint("status ${response.statusCode.toString()}");

    if (isAuth && response.statusCode == 401) {
      // var refreshToken = await Helper.getUserData(Constants.REFRESH_TOKEN);
      //
      // // call  for refresh token
      // var response = await RemoteServices.client.get(
      //   Uri.parse("${ApiConstants.baseUrl}/"),
      // );
      //
      // var dataObj = loginRespFromMap(response.body);
      //
      // Helper.saveUserData(Constants.TOKEN, dataObj.accessToken ?? "");
      //
      // return getRequest(path, isAuth);
    }

    return response;
  }

  Future<http.Response> postRequest(String path, String body,
      {isAuth = false}) async {
    // var token = "";
    // if (isAuth) {
    //   var tokenValue = await Helper.getUserData(Constants.TOKEN);
    //   token = "Bearer $tokenValue";
    // }

    var response = await RemoteServices.client
        .post(Uri.parse("${ApiConstants.baseUrl}$path"),
            headers: {
              // 'Authorization': token,
              "Content-Type": "application/json",
            },
            body: body);

    // if (isAuth && response.statusCode == 401) {
    //   // Get.to(const OnBoardingScreen());
    //   //   var refreshToken = await Helper.getUserData(Constants.REFRESH_TOKEN);
    //   //
    //   //   Map<String, String>? bodys = {
    //   //     "accessToken": "$token",
    //   //     "refreshToken": "${refreshToken}"
    //   //   };
    //   //
    //   //   // call  for refresh token
    //   //   var response = await RemoteServices.client
    //   //       .post(Uri.parse("${ApiConstants.baseUrl}/account/refresh-token"),
    //   //           headers: {
    //   //             //  'Authorization': token,
    //   //             "Content-Type": "application/json",
    //   //           },
    //   //           body: bodys);
    //   //
    //   //   var dataObj = RefreshTokenReesp.fromJson(response.body);
    //   //
    //   //   Helper.saveUserData(
    //   //       Constants.TOKEN, dataObj.data?.token?.accessToken ?? "");
    //   //   Helper.saveUserData(
    //   //       Constants.REFRESH_TOKEN, dataObj.data?.token?.refreshToken ?? "");
    //   //
    //   //   return postRequest(
    //   //     path,
    //   //     body,
    //   //     isAuth,
    //   //   );
    // }

    log(response.body);
    return response;
  }
}
