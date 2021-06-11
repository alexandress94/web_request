import 'package:get/get.dart';
import 'package:web_request/app/data/provider/api_provider.dart';
import 'package:web_request/app/data/repository/home_repository.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: HomeRepository(
          provider: ApiProvider(),
        ),
      ),
    );
  }
}
