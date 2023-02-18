import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/config/app_config.dart';
import 'app/config/app_themes.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: AppConfig.APP_NAME,
      defaultTransition: Transition.size,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
      theme: AppThemes.lightTheme(),
    ),
  );
}
