import 'package:http/http.dart' as http;
import 'package:web_request/app/data/models/todo_model.dart';
import 'package:web_request/app/data/repository/api_repository.dart';
import 'dart:convert';

class ApiProvider implements ApiRepository {
  String endPoint = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<TodoModel>> getAllTodo() async {
    var url = Uri.parse('$endPoint/todos');
    final response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        // convertendo json
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((model) => TodoModel.fromJson(model)).toList();
      } else {
        throw Exception('Não foi possível obter requisição.');
      }
    } catch (error) {
      throw Exception('Erro ao obter requisição, log: $error');
    }
  }

  @override
  Future<String> patchCompleted(TodoModel todo) async {
    var url = Uri.parse('$endPoint/todos/${todo.id}');
    String result = "";
    await http.patch(
      url,
      body: {"completed": (!todo.completed!).toString()},
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> data = json.decode(response.body);
      return result = data["completed"];
    });
    return result;
  }

  @override
  Future<String> postTodo(TodoModel todo) async {
    print(todo.toJson());
    var url = Uri.parse('$endPoint/todos/');
    var response = await http.post(url, body: todo.toJson());
    print(response.body);
    print(response.statusCode);
    return "true";
  }

  @override
  Future<String> putCompleted(TodoModel todo) async {
    var url = Uri.parse('$endPoint/todos/${todo.id}');
    String result = "";
    await http.put(
      url,
      body: {"completed": (!todo.completed!).toString()},
      headers: {'Authorization': 'your_token'},
    ).then((response) {
      Map<String, dynamic> data = json.decode(response.body);
      return result = data["completed"];
    });
    return result;
  }

  @override
  Future<String> deleteTodo(TodoModel todo) async {
    var url = Uri.parse('$endPoint/todos/${todo.id}');
    var result = "false";
    await http.delete(url).then((value) {
      result = "true";
    });
    return result;
  }
}
