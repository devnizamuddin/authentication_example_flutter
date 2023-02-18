import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/api_communication.dart';
import '../../../utils/snackbar.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailNameController;
  late TextEditingController userNameController;
  late TextEditingController passwordController;

  late FocusNode firstFnode;
  late FocusNode lastFnode;
  late FocusNode emailFnode;
  late FocusNode userFnode;
  late FocusNode passFnode;

  RxBool obscurePassField = true.obs;

  final ApiCommunication _apiCommunication = ApiCommunication();

  Future<void> signUp() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      final response = await _apiCommunication.doPostRequest(
        requestData: {
          'username': userNameController.text,
          'password': passwordController.text,
          'email': emailNameController.text,
          'profile': {
            'first_name': firstNameController.text,
            'last_name': lastNameController.text,
          }
        },
        endPoint: 'consumer/register',
      );
      if (response?.statusCode == 201) {
        successSnack('Signup Successfull');
        Get.offNamed(Routes.LOGIN);
      }
    }
  }

  Future<void> onObscureTap() async {
    obscurePassField.value = !obscurePassField.value;
  }

  @override
  void onInit() {
    firstFnode = FocusNode();
    lastFnode = FocusNode();
    emailFnode = FocusNode();
    userFnode = FocusNode();
    passFnode = FocusNode();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailNameController = TextEditingController();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailNameController.dispose();
    passwordController.dispose();
    userFnode.dispose();
    firstFnode.dispose();
    lastFnode.dispose();
    emailFnode.dispose();
    passFnode.dispose();
    super.onClose();
  }
}
