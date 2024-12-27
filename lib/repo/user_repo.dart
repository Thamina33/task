import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task/services/remote_services.dart';
import 'package:task/utility/api_const.dart';

class UserRepo extends GetxController implements GetxService {
  RemoteServices remoteServices;

  UserRepo({required this.remoteServices});

  Future<http.Response> getUserList() async {
    var response = await remoteServices.getRequest(ApiConstants.users, true);

    return response;
  }
}
