

class Todo {
  int id;
  String title;
  String description;
  bool completed;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.completed = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      completed: json['completed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'completed': completed,
    };
  }
}

class TodoRepository {
  final List<Todo> _todos = [];
  int _nextId = 1;

  // Create
  Todo addTodo(String title, String description) {
    final todo = Todo(id: _nextId++, title: title, description: description);
    _todos.add(todo);
    return todo;
  }

  // Read
  List<Todo> getTodos() {
    return List.unmodifiable(_todos);
  }

  Todo? getTodoById(int id) {
    try {
      return _todos.firstWhere((todo) => todo.id == id);
    } catch (_) {
      return null;
    }
  }

  // Update
  bool updateTodo(
    int id, {
    String? title,
    String? description,
    bool? completed,
  }) {
    final todo = getTodoById(id);
    if (todo == null) return false;
    if (title != null) todo.title = title;
    if (description != null) todo.description = description;
    if (completed != null) todo.completed = completed;
    return true;
  }

  // Delete
  bool deleteTodo(int id) {
    final before = _todos.length;
    _todos.removeWhere((todo) => todo.id == id);
    return _todos.length < before;
  }
}
