
import '../models/todo.dart';

abstract class TodoRepo {
  //get list of todos
  Future<List<Todo>> getTodos();

  //add todos
  Future<void> addTodo(Todo newTodo);

  // update Todos
  Future<void> updateTodo(Todo todo);

  // delete todos
  Future<void> deleteTodo(Todo todo);
}
