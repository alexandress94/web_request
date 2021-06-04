import 'package:get/get.dart';
import 'package:web_request/app/data/models/todo_model.dart';
import 'package:web_request/app/data/repository/request_home_repository.dart';

class HomeController extends GetxController {
  final RequestHomeRepository requestHomeRepository;
  HomeController({required this.requestHomeRepository});
  List<TodoModel> listTodos = <TodoModel>[].obs;
  HomeState state = HomeState.start;

  @override
  void onInit() {
    super.onInit();
    initializeListTodos();
  }

  Future<void> initializeListTodos() async {
    state = HomeState.loading;

    try {
      state = HomeState.success;
      listTodos = await requestHomeRepository.fetch();
    } catch (error) {
      state = HomeState.error;
      throw Exception('Erro durante carregamento, LOG: $error');
    }
  }

  Future request() async {
    final json = await requestHomeRepository.fetch();
    print(json[0]['title']);
    update(['requestKey']);
  }
}

enum HomeState { start, success, loading, error }
