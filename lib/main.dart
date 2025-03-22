import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/presentation/todo_page.dart';
import 'data/model/isar_todo.dart';
import 'data/repository/isar_todo_repo.dart';
import 'domain/repository/todo_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // get directory path for storing data
  final dir  = await getApplicationDocumentsDirectory();

  // open ISAR database
  final isar = await Isar.open([TodoIsarSchema], directory : dir.path);

  // initialize repo with isar database
  final isarTodoRepo = IsarTodoRepo(isar);

  runApp(MyApp(todoRepo: isarTodoRepo));
}

class MyApp extends StatelessWidget {
  // database injection through app
  final TodoRepo todoRepo;

  const MyApp({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepo: todoRepo),
    );
  }
}