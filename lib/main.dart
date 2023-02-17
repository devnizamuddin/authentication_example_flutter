import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/config/app_config.dart';
import 'app/config/app_themes.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: AppConfig.APP_NAME,
      defaultTransition: Transition.size,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppThemes.lightTheme(),
    ),
  );
}
