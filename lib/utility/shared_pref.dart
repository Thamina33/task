import '../services/shared_pref.dart';

class SharePrefHelper {
  static String valueSharedPreferences = '';

// Write DATA
  static saveUserData(String key, String value) async {
    await SharedPrefs.instance.setString(key, value);
  }

// Read Data
  static Future getUserData(String key) async {
    return SharedPrefs.instance.getString(key);
  }

  static Future saveLogin() async {
    await SharedPrefs.instance.setBool("save_login", true);
  }

  static Future checkLogin() async {
    return SharedPrefs.instance.getBool("save_login");
  }

  static Future storeUserData(String dataInJson) async {
    await SharedPrefs.instance.setString("userData", dataInJson);
  }

  static Future getSavedUserData() async {
    return SharedPrefs.instance.getString("userData");
  }

  // static Future<ProfileResp> getUserObj() async {
  //   var data = await getSavedUserData();
  //   return profileRespFromJson(data);
  // }

  static Future checkIfUserLoggedIn() async {
    var data = await getSavedUserData();

    if (data != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future isFirstLaunch() async {
    var value = SharedPrefs.instance.getString("is_first_lunch");
    var result = false;

    if (value == null) {
      result = true;
    } else {
      result = false;
    }

    SharedPrefs.instance.setString("is_first_lunch", "false");

    return result;
  }

  static nukeData() {
    SharedPrefs.instance.clear();
  }
}

class Constants {
  static const String TOKEN = 'accessToken';
  static const String REFRESH_TOKEN = 'refreshToken';
  static const String USERID = 'userid';

}
