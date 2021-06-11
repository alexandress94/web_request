import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web_request/app/core/theme/app_theme.dart';
import 'package:web_request/app/data/models/todo_model.dart';
import 'package:web_request/app/data/repository/home_repository.dart';

class HomeController extends GetxController with StateMixin<List<TodoModel>> {
  final HomeRepository repository;
  HomeController({required this.repository});
  RxList<TodoModel> _listTodos = <TodoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    find();
  }

  List<TodoModel> get getListTodos => _listTodos;

  // Get.
  Future<void> find() async {
    change([], status: RxStatus.loading());
    try {
      _listTodos.value = await repository.getAllTodo();
      change(_listTodos, status: RxStatus.success());
    } catch (error) {
      change(_listTodos, status: RxStatus.error());
      throw Exception('Erro durante carregamento: $error');
    }
  }

  // Patch.
  Future<void> patchTodo(TodoModel todo) async {
    repository.patchCompleted(todo).then(
          (value) => _showSnackbar(
            value: value,
            title: "PATCH: Alterado com sucesso!",
          ),
        );
    // update -> Atualiza o método ao ser chamado na view
    update(['patch']);
  }

  // Put.
  Future<void> putTodo(TodoModel todo) async {
    repository.putCompleted(todo).then(
          (value) => _showSnackbar(
            value: value,
            title: "PUT: Alterado com sucesso!",
          ),
        );
    // update -> Atualiza o método ao ser chamado na view
    update(['put']);
  }

  Future<void> deleteTodo(TodoModel todo) async {
    repository.deleteTodo(todo).then(
          (value) => _showSnackbar(
            value: value,
            title: "Deletado com sucesso!",
          ),
        );
    // update -> Atualiza o método ao ser chamado na view
    update(['delete']);
  }

  Future<void> postTodo(TodoModel todo) async {
    repository.postTodo(todo).then(
          (value) => _showSnackbar(
            value: value,
            title: "Inserido com sucesso!",
          ),
        );
    // update -> Atualiza o método ao ser chamado na view
    update(['post']);
  }
}

_showSnackbar({required String value, required String title}) {
  return Get.snackbar(
    title,
    value,
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.all(
      appDefaultPadding,
    ),
    padding: EdgeInsets.all(
      appDefaultPadding,
    ),
  );
}
