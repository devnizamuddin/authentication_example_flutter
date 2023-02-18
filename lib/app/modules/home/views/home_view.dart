import '../../../config/app_themes.dart';
import '../../../models/login_response.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LoginResponseModel responseModel = Get.arguments;
    controller.getProfileData(responseModel);
    TextStyle textStyle = const TextStyle(fontSize: 20);
    return Scaffold(
      backgroundColor: AppThemes.bgColor,
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          controller.profileResponse.value?.username ?? '',
                          style: textStyle,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          controller.profileResponse.value?.email ?? '',
                          style: textStyle,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          controller
                                  .profileResponse.value?.profile?.first_name ??
                              '',
                          style: textStyle,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          controller
                                  .profileResponse.value?.profile?.last_name ??
                              '',
                          style: textStyle,
                        ),
                        TextButton(
                            onPressed: controller.logout,
                            child: const Text('Logout'))
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
