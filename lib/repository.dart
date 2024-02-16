import 'dart:async';

class Repository {
  final StreamController<List<ToDoModel>> _controller =
      StreamController<List<ToDoModel>>();

  final List<ToDoModel> _todos = [];

  Stream<List<ToDoModel>> get stream async* {
    yield* _controller.stream;
  }

  Future<void> createToDo(String title, String desc) async {
    final newToDo = ToDoModel(
        id: _todos.lastOrNull == null ? 0 : _todos.last.id + 1,
        title: title,
        disc: desc);
    _todos.add(newToDo);
    _controller.add(_todos);
  }
}

class ToDoModel {
  final int id;
  final String title;
  final String disc;

  ToDoModel({required this.id, required this.title, required this.disc});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          disc == other.disc;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ disc.hashCode;
}
