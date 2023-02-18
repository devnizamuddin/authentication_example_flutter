import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_themes.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppThemes.bgColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(height: 32),
              Image.asset(
                AppAssets.ASSET_YUMA_LOGO,
                fit: BoxFit.fitHeight,
                width: 128,
                height: 128,
              ),
              const SizedBox(height: 50),
              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      focusNode: controller.userFnode,
                      keyboardType: TextInputType.name,
                      controller: controller.userNameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.person),
                        labelText: 'User name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter user name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    Obx(
                      () => TextFormField(
                        focusNode: controller.passFnode,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: controller.obscurePassField.value,
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(CupertinoIcons.lock),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                              onPressed: controller.onObscureTap,
                              icon: Icon(controller.obscurePassField.value
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: controller.signIn,
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text('Sign In'),
                      ),
                    ),
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                            value: controller.rememberPass.value,
                            onChanged: controller.onRememberPassTap,
                          ),
                        ),
                        const Text('Remember password',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don not have an account?'),
                        TextButton(
                            onPressed: controller.signUp,
                            child: const Text('SignUp'))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
