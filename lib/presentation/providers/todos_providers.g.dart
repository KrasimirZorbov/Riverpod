// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredTodosHash() => r'b2a1caaca049d3ad49a671736842919ab2803f03';

/// Filtrar los todos ///
///
/// Copied from [filteredTodos].
@ProviderFor(filteredTodos)
final filteredTodosProvider = AutoDisposeProvider<List<Todo>>.internal(
  filteredTodos,
  name: r'filteredTodosProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredTodosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredTodosRef = AutoDisposeProviderRef<List<Todo>>;
String _$currentFilterTypeHash() => r'bc6e5d0631949c4badb030cac84f5e7a82709069';

/// See also [CurrentFilterType].
@ProviderFor(CurrentFilterType)
final currentFilterTypeProvider =
    NotifierProvider<CurrentFilterType, FilterType>.internal(
  CurrentFilterType.new,
  name: r'currentFilterTypeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentFilterTypeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentFilterType = Notifier<FilterType>;
String _$todosHash() => r'826462b1e8cac55eb47f880cace774d1df7ce351';

/// See also [Todos].
@ProviderFor(Todos)
final todosProvider = NotifierProvider<Todos, List<Todo>>.internal(
  Todos.new,
  name: r'todosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Todos = Notifier<List<Todo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
