import 'package:redux_example/models.dart';
import 'package:redux_example/redux/actions.dart';

List<Todo> todosReducer(List<Todo> state, TodoAction action) {
  if (action is AddTodoAction) {
    return <Todo>[]
      ..addAll(state)
      ..add(Todo(id: action.id, text: action.text));
  }

  if (action is ToggleTodoAction) {
    return state
        .map((todo) => todo.id == action.id
            ? todo.copyWith(completed: !todo.completed)
            : todo)
        .toList();
  }

  return state;
}

VisibilityFilter visibilityFilterReducler(
    VisibilityFilter state, TodoAction action) {
  if (action is SetVisibilityFilterAction) {
    return action.filter;
  }

  return state;
}

TodoState todoAppReducer(TodoState state, dynamic action) {
  return TodoState(
      todos: todosReducer(state.todos, action),
      visibilityFilter:
          visibilityFilterReducler(state.visibilityFilter, action));
}
