import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum VisibilityFilter { SHOW_ALL, SHOW_ACTIVE, SHOP_COMPLETED }

class Todo extends Equatable {
  final int id;
  final String text;
  final bool completed;

  Todo({@required this.id, @required this.text, this.completed = false});

  @override
  List<Object> get props => [id, text, completed];

  Todo copyWith({int id, String text, bool completed}) {
    return Todo(
        id: id ?? this.id,
        text: text ?? this.text,
        completed: completed ?? this.completed);
  }
}

class TodoState {
  final List<Todo> todos;
  final VisibilityFilter visibilityFilter;

  const TodoState({@required this.todos, @required this.visibilityFilter});

  TodoState.initialState()
      : todos = <Todo>[],
        visibilityFilter = VisibilityFilter.SHOW_ALL;
}

typedef void TodoTapFunction(int id);
typedef void AddTodoPressedFunction(String text);
typedef void SetVisibilityFilterFunction(VisibilityFilter filter);
