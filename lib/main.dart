import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web_request/app/core/theme/app_theme.dart';
import 'package:web_request/app/routes/app_pages.dart';
import 'package:web_request/app/routes/routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.HOME_PAGE,
      theme: AppTheme().appThemeData,
    ),
  );
}
