import 'package:drift/drift.dart';
import 'database.dart';

part 'todo_dao.g.dart';

@DriftAccessor(tables: [Todos])
class TodoDao extends DatabaseAccessor<AppDatabase> with _$TodoDaoMixin {
  TodoDao(AppDatabase db) : super(db);

  Future<List<Todo>> getAllTodos() => select(todos).get();
  Stream<List<Todo>> watchAllTodos() => select(todos).watch();
  Future insertTodo(Insertable<Todo> todo) => into(todos).insert(todo);
  Future updateTodo(Insertable<Todo> todo) => update(todos).replace(todo);
  Future deleteTodo(Insertable<Todo> todo) => delete(todos).delete(todo);
}
