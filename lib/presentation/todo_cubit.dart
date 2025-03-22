/*
to do cubit -> it is for our state management
Each cubit is a list of to dos
 */

import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/models/todo.dart';
import '../domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  // reference to do repo
  final TodoRepo todoRepo;

  // constructor to initialize with empty list
  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  // load
  Future<void> loadTodos() async {
    final todoList = await todoRepo.getTodos();

    // emit the list as new state
    emit(todoList);
  }

  // add
  Future<void> addTodo(String text) async {
    final newTodo = Todo(id: DateTime.now().millisecondsSinceEpoch, text: text);
    await todoRepo.addTodo(newTodo);
    loadTodos();
  }

  // delete
  Future<void> deleteTodo(Todo todo) async {
    // delete from repo
    await todoRepo.deleteTodo(todo);
    loadTodos();
  }

  // toggle
  Future<void> toggleCompletion(Todo todo) async {
    // toggle the completion status of provided todos
    final updatedTodo = todo.toggleCompletion();

    // update the to do in repo with new completion status
    await todoRepo.updateTodo(updatedTodo);
    loadTodos();
  }
}
