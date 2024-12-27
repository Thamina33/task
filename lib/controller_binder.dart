import 'package:get/get.dart';
import 'package:task/controller/auth_controller.dart';
import 'package:task/controller/profile_controller.dart';
import 'package:task/controller/user_controller.dart';
import 'package:task/repo/auth_repo.dart';
import 'package:task/repo/profile_repo.dart';
import 'package:task/repo/user_repo.dart';
import 'package:task/services/remote_services.dart';

init() async {
  Get.lazyPut(() => RemoteServices());

  Get.lazyPut(() => AuthRepo(remoteServices: Get.find()));
  Get.lazyPut(() => ProfileRepo(remoteServices: Get.find()));
  Get.lazyPut(() => UserRepo(remoteServices: Get.find()));

  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => ProfileController(profileRepo: Get.find()));
}
