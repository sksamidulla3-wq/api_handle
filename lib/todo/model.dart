class DataTodoModel {
  int? limit;
  int? skip;
  int? total;
  List<TodoModel>? todos;

  DataTodoModel({
    required this.limit,
    required this.skip,
    required this.total,
    required this.todos,
  });

  factory DataTodoModel.fromJson(Map<String, dynamic> json) {
    List<TodoModel> listTodo = [];
    for (Map<String, dynamic> each in json["todos"]) {
      listTodo.add(TodoModel.fromJson(each));
    }
    return DataTodoModel(
      limit: json["limit"],
      skip: json["skip"],
      total: json["total"],
      todos: listTodo,
    );
  }
}

class TodoModel {
  bool? completed;
  String? todo;
  int? id;

  TodoModel({required this.completed, required this.todo, required this.id});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      completed: json["completed"],
      todo: json["todo"],
      id: json["id"],
    );
  }
}
