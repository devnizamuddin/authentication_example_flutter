import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();

  late TextEditingController userNameController;
  late TextEditingController passwordController;

  late FocusNode userFnode;
  late FocusNode passFnode;

  RxBool rememberPass = false.obs;
  RxBool obscurePassField = true.obs;

  Future<void> onObscureTap() async {
    obscurePassField.value = !obscurePassField.value;
  }

  Future<void> onRememberPassTap(bool? v) async {
    if (v != null) {
      rememberPass.value = v;
    }
  }

  Future<void> signIn() async {}

  Future<void> signUp() async {}

  @override
  void onInit() {
    userFnode = FocusNode();
    passFnode = FocusNode();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
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
