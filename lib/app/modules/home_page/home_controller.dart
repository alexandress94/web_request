import 'package:get/get.dart';
import 'package:web_request/app/modules/home_page/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});

  Future request() async {
    final json = await homeRepository.fetch();
    print(json[0]['title']);
    update(['requestKey']);
  }
}
