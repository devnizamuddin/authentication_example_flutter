import '../../../models/login_response.dart';
import '../../../service/api_communication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/app_getstorages.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/snackbar.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();

  late TextEditingController userNameController;
  late TextEditingController passwordController;

  late FocusNode userFnode;
  late FocusNode passFnode;

  RxBool rememberPass = false.obs;
  RxBool obscurePassField = true.obs;
  final _box = GetStorage();
  final ApiCommunication _apiCommunication = ApiCommunication();

  Future<void> onObscureTap() async {
    obscurePassField.value = !obscurePassField.value;
  }

  Future<void> onRememberPassTap(bool? v) async {
    if (v != null) {
      rememberPass.value = v;
      _box.write(AppGetStorages.KEY_REMEMBER_PASS_STATUS, v);
    }
  }

  Future<void> signIn() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      saveLoginInfo();
      final response = await _apiCommunication.doPostRequest(
        requestData: {
          'username': userNameController.text,
          'password': passwordController.text
        },
        endPoint: 'consumer/login',
      );
      if (response != null) {
        Map<String, dynamic> responseBody = response.data;
        if (responseBody['error_code'] == null) {
          _box.write(AppGetStorages.KEY_LOGIN_STATUS, true);
          _box.write(AppGetStorages.KEY_USER_DATA, responseBody);
          final loginResponse = LoginResponseModel.fromMap(responseBody);
          Get.offAllNamed(Routes.HOME, arguments: loginResponse);
        } else {
          errorSnack(responseBody['error_description']);
        }
      }
    }
  }

  saveLoginInfo() {
    _box.write(AppGetStorages.KEY_USERNAME, userNameController.text);
    _box.write(AppGetStorages.KEY_PASSWORD, passwordController.text);
  }

  Future<void> signUp() async {
    Get.toNamed(Routes.SIGNUP);
  }

  @override
  void onInit() {
    userFnode = FocusNode();
    passFnode = FocusNode();
    rememberPass.value =
        _box.read(AppGetStorages.KEY_REMEMBER_PASS_STATUS) ?? false;
    userNameController = TextEditingController(
        text: rememberPass.value ? _box.read(AppGetStorages.KEY_USERNAME) : '');
    passwordController = TextEditingController(
        text: rememberPass.value ? _box.read(AppGetStorages.KEY_PASSWORD) : '');
    super.onInit();
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    userFnode.dispose();
    passFnode.dispose();
    super.onClose();
  }
}
