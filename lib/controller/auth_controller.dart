import 'dart:ffi';

import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/utility/DialogHelper.dart';

import '../network/error_resp.dart';
import '../network/login_resp.dart';
import '../repo/auth_repo.dart';
import '../services/shared_pref.dart';
import '../utility/shared_pref.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> userLogin(String email, String pass) async {
    bool userLoginSuccess = false;

    _isLoading = true;
    update();
    var apiResponse = await authRepo.userLogin(email, pass);

    _isLoading = false;
    update();

    if (apiResponse.statusCode.toString().startsWith("20")) {
      var loginData = loginRespFromMap(apiResponse.body);
      // save user token
      SharePrefHelper.saveUserData(
          Constants.TOKEN, loginData.data?.accessToken ?? "");
      // save user login state
      SharePrefHelper.saveLogin();

      userLoginSuccess = true;
    } else if (apiResponse.statusCode.toString().startsWith("40")) {
      var commonError = errorRespFromMap(apiResponse.body);
      DialogHelper.showErrorDialog(
          title: "Error", description: commonError.message);
    } else {
      DialogHelper.showErrorDialog(
          title: "Error",
          description: "Api Error With Status ${apiResponse.statusCode}");
    }

    return userLoginSuccess;
  }
}
