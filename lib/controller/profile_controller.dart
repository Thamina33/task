import 'package:get/get.dart';
import 'package:task/repo/profile_repo.dart';
import 'package:task/utility/api_const.dart';

import '../network/profile_resp.dart';
import '../utility/DialogHelper.dart';

class ProfileController extends GetxController implements GetxService {
  final ProfileRepo profileRepo;

  ProfileController({required this.profileRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ProfileData? _profileData;

  ProfileData? get profileData => _profileData;

  Future<void> getProfile() async {
    _isLoading = true;
    update();

    var resp = await profileRepo.getProfile();
    _isLoading = false;
    update();

    if (resp.statusCode.toString().startsWith("20")) {
      var profileResp = profileRespFromMap(resp.body);
      _profileData = profileResp.data;
      update();
    } else {
      DialogHelper.showErrorDialog(
          title: "Error",
          description: "Api Error With Status ${resp.statusCode}");
    }
  }
}
