import '../../../models/login_response.dart';
import '../../../models/profile_response.dart';
import '../../../routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/app_getstorages.dart';
import '../../../service/api_communication.dart';
import '../../../utils/snackbar.dart';

class HomeController extends GetxController {
  final ApiCommunication _apiCommunication = ApiCommunication();

  Rx<ProfileResponseModel?> profileResponse = Rx(null);
  final _box = GetStorage();

  Future getProfileData(LoginResponseModel loginResponseModel) async {
    Map<String, dynamic> apiHeader = <String, String>{
      'Accept': '*/*',
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'consumersession': '${loginResponseModel.session_id}',
    };
    final response = await _apiCommunication.doGetRequest(
      header: apiHeader,
      endPoint: 'consumer/${loginResponseModel.consumer_uuid}',
    );

    if (response != null) {
      Map<String, dynamic> responseBody = response.data;
      if (responseBody['error_code'] == null) {
        profileResponse.value = ProfileResponseModel.fromMap(responseBody);
      } else {
        errorSnack(responseBody['error_description']);
      }
    }
  }

  logout() {
    _box.write(AppGetStorages.KEY_LOGIN_STATUS, false);
    _box.write(AppGetStorages.KEY_USER_DATA, null);
    Get.offAllNamed(Routes.LOGIN);
  }
}
