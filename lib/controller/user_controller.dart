import 'package:get/get.dart';
import 'package:task/repo/user_repo.dart';
import 'package:task/services/remote_services.dart';

import '../network/user_resp.dart';
import '../utility/DialogHelper.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({required this.userRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<UserObj> _userList = List.empty(growable: true);

  List<UserObj> get userList => _userList;

  Future<void> getUsers() async {
    _isLoading = true;
    update();

    var resp = await userRepo.getUserList();

    _isLoading = false;
    update();

    if (resp.statusCode.toString().startsWith("20")) {
      var users = userRespFromMap(resp.body);
      _userList = users.data ?? [];

      update();
    } else {
      DialogHelper.showErrorDialog(
          title: "Error",
          description: "Api Error With Status ${resp.statusCode}");
    }
  }
}
