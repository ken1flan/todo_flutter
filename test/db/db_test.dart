import 'package:flutter_test/flutter_test.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:todo_flutter/lib/db/database.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('insert and query todo', () async {
    // Insert a todo
    final id = await db.into(db.todos).insert(
      TodosCompanion.insert(title: 'Test Todo'),
    );
    // Query todos
    final todos = await db.select(db.todos).get();
    expect(todos.length, 1);
    expect(todos.first.id, id);
    expect(todos.first.title, 'Test Todo');
    expect(todos.first.completed, false);
  });

  test('update todo', () async {
    final id = await db.into(db.todos).insert(
      TodosCompanion.insert(title: 'Update Todo'),
    );
    // Update
    await db.update(db.todos).replace(
      TodosData(id: id, title: 'Updated', completed: true),
    );
    final todo = (await db.select(db.todos).get()).first;
    expect(todo.title, 'Updated');
    expect(todo.completed, true);
  });

  test('delete todo', () async {
    final id = await db.into(db.todos).insert(
      TodosCompanion.insert(title: 'Delete Todo'),
    );
    // Delete
    await db.delete(db.todos).delete(TodosData(id: id, title: 'Delete Todo', completed: false));
    final todos = await db.select(db.todos).get();
    expect(todos.isEmpty, true);
  });
}
