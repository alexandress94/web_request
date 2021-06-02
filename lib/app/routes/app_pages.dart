import 'package:get/get_navigation/get_navigation.dart';
import 'package:web_request/app/modules/home_page/home_binding.dart';
import 'package:web_request/app/modules/home_page/home_page.dart';

import 'routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME_PAGE,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
