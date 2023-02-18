import 'dart:async';

import '../../../config/app_getstorages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../models/login_response.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final _box = GetStorage();
  navigate() {
    Timer(const Duration(milliseconds: 2000), () {
      if (_box.read(AppGetStorages.KEY_LOGIN_STATUS) ?? false) {
        Map<String, dynamic> responseBody =
            _box.read(AppGetStorages.KEY_USER_DATA);
        final loginResponse = LoginResponseModel.fromMap(responseBody);
        Get.offNamed(Routes.HOME, arguments: loginResponse);
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    });
  }

  @override
  void onInit() {
    navigate();
    super.onInit();
  }
}
