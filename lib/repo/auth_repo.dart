import 'dart:convert';

import 'package:get/get.dart';
import 'package:task/network/sign_up_resp.dart';
import 'package:task/services/remote_services.dart';
import 'package:task/services/shared_pref.dart';
import 'package:http/http.dart' as http;
import '../utility/DialogHelper.dart';
import '../utility/api_const.dart';

class AuthRepo extends GetxController implements GetxService {
  RemoteServices remoteServices;

  AuthRepo({required this.remoteServices});

  // Future<SignUpResp?> userRegister(String jsonString) async {
  //   var response = await remoteServices.postRequest(
  //       ApiConstants.signUp, jsonString);
  //
  //
  //   if (response.statusCode == 200) {
  //     return signUpRespFromMap(response.body);
  //   } else if (response.statusCode == 409) {
  //     DialogHelper.hideLoading();
  //     return null;
  //   } else {
  //     DialogHelper.hideLoading();
  //     try {
  //      // var data = errorRespFromJson(response.body);
  //       DialogHelper.showErrorDialog(description: "error ");
  //     } catch (e) {
  //       DialogHelper.showErrorDialog(description: "Something Went Wrong");
  //     }
  //
  //     return null;
  //   }
  // }

  Future<http.Response> userLogin(String email, String pass) async {
    var body = {"email": email, "password": pass};

    var response =
        await remoteServices.postRequest(ApiConstants.login, jsonEncode(body));

    return response;
  }
}
