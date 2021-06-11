import 'package:web_request/app/data/models/todo_model.dart';

abstract class ApiRepository {
  Future<List<TodoModel>> getAllTodo();
  // Get -> Obtem/Ler todos os registro.
  Future<String> patchCompleted(TodoModel todo);
  // Patch -> Atualização / Modificação parcial da entidade.
  Future<String> putCompleted(TodoModel todo);
  // Put -> Atualização completa da entidade.
  Future<String> deleteTodo(TodoModel todo);
  // Delete -> Deleta apenas um registro.
  Future<String> postTodo(TodoModel todo);
  // Post -> Cria/Inseri um novo registro.
}
