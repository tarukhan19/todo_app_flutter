/*
ISAR TO DO model
convert to do model into isar to do model
 */

import 'package:isar/isar.dart';
import '../../domain/models/todo.dart';

// to generate isar to do object
// run:  dart run build_runner build
part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  // convert isar object -> to pure to do object (to display in our app)

  Todo toDomain() {
    return Todo(
        id: id,
        text: text,
        isCompleted: isCompleted
    );
  }

// convert pure to do object ->  to isar object (to store in isar db)

  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
    ..id = todo.id
    ..text = todo.text
    ..isCompleted = todo.isCompleted;
  }
}
