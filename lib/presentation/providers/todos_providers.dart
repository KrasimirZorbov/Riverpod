

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/helpers/random_generator.dart';
import 'package:riverpod_app/domain/entities/todo.dart';
import 'package:uuid/uuid.dart';

part 'todos_providers.g.dart';

const uuid = Uuid();
enum FilterType {
  all,
  completed,
  pending
}

@Riverpod(keepAlive: true)
class CurrentFilterType extends _$CurrentFilterType {
  @override
  FilterType build() {
    return FilterType.all;
  }

  void changeCurrentFilter(FilterType filterType){
    state = filterType;
  }
}

@Riverpod(keepAlive: true)
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    return [
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
      ];
  }

  createperson(){
    state = [
      ...state,
      Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null
      )
    ];
  }

  toggleTodo(String id){
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(completedAt: todo.done ? null : DateTime.now())
        else
          todo
    ];

  }
}

/// Filtrar los todos ///
@riverpod
  List<Todo> filteredTodos(FilteredTodosRef ref) {
    final currentFilter = ref.watch(currentFilterTypeProvider);
    final todos = ref.watch(todosProvider);

    switch (currentFilter) {
      case FilterType.completed:
        return todos.where((todo) => todo.done).toList();
      case FilterType.pending:
        return todos.where((todo) => !todo.done).toList();
      default:
        return todos;
    }
  }