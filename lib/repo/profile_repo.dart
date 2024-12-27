import 'package:get/get.dart';
import 'package:task/services/remote_services.dart';
import 'package:http/http.dart' as http;
import 'package:task/utility/api_const.dart';

class ProfileRepo extends GetxController implements GetxService {
  RemoteServices remoteServices;

  ProfileRepo({required this.remoteServices});

  Future<http.Response> getProfile() async {
    var response = await remoteServices.getRequest(ApiConstants.profile, true);

    return response;
  }
}
