import 'package:flutter_test/flutter_test.dart';
import 'package:web_request/app/data/provider/api_provider.dart';
import 'package:web_request/app/data/repository/request_home_repository.dart';
import 'package:web_request/app/modules/home_page/home_controller.dart';

void main() {
  final homeController = new HomeController(
      requestHomeRepository: RequestHomeRepository(apiProvider: ApiProvider()));
  test('Adicionando fecth ao listTodos', () async {
    expect(homeController.state, HomeState.start);
    await homeController.initializeListTodos();
    expect(homeController.state, HomeState.success);
    expect(homeController.listTodos.isNotEmpty, true);
  });
}
