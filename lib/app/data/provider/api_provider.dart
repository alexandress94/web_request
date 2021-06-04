import 'package:dio/dio.dart';
import 'package:web_request/app/data/models/todo_model.dart';

class ApiProvider {
  final _dio = Dio();
  static final _url = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<TodoModel>> fetch() async {
    try {
      var response = await _dio.get(_url);
      if (response.statusCode == 200) {
        // response.data, formata o json.
        List jsonResponse = response.data;
        return jsonResponse
            .map((models) => TodoModel.fromJson(models))
            .toList();
      } else {
        throw Exception("Status da requisição json é diferente de 200");
      }
    } catch (error) {
      throw Exception("Falha na requisição: $error");
    }
  }
}
