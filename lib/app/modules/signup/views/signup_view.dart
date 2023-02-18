import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/app_assets.dart';
import '../../../config/app_themes.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
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
              const SizedBox(height: 24),
              Image.asset(
                AppAssets.ASSET_YUMA_LOGO,
                fit: BoxFit.fitHeight,
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 40),
              Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      focusNode: controller.firstFnode,
                      keyboardType: TextInputType.name,
                      controller: controller.firstNameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.person),
                        labelText: 'Frist name',
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
                    TextFormField(
                      focusNode: controller.lastFnode,
                      keyboardType: TextInputType.name,
                      controller: controller.lastNameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.person),
                        labelText: 'Last name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter last name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      focusNode: controller.emailFnode,
                      keyboardType: TextInputType.name,
                      controller: controller.emailNameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      focusNode: controller.userFnode,
                      keyboardType: TextInputType.name,
                      controller: controller.userNameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
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
                      onPressed: controller.signUp,
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text('Sign Up'),
                      ),
                    ),
                    const SizedBox(height: 50),
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
