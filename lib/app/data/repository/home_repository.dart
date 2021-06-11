import 'package:web_request/app/data/models/todo_model.dart';
import 'package:web_request/app/data/provider/api_provider.dart';

class HomeRepository {
  final ApiProvider provider;
  HomeRepository({required this.provider});

  Future<List<TodoModel>> getAllTodo() async {
    return await provider.getAllTodo();
  }

  Future<String> patchCompleted(TodoModel todo) async {
    return await provider.patchCompleted(todo);
  }

  Future<String> putCompleted(TodoModel todo) async {
    return await provider.putCompleted(todo);
  }

  Future<String> deleteTodo(TodoModel todo) async {
    return await provider.deleteTodo(todo);
  }

  Future<String> postTodo(TodoModel todo) async {
    return await provider.postTodo(todo);
  }
}
