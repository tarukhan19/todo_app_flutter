class Todo {
  final int id;
  final String text;
  final bool isCompleted;

  // constructor
  Todo({required this.id, required this.text, this.isCompleted = false});

  // method which returns todos
  Todo toggleCompletion() {
    return Todo(id: id, text: text, isCompleted: !isCompleted);
  }
}
