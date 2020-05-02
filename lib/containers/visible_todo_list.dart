import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/components/todo_list.dart';
import 'package:redux_example/models.dart';
import 'package:redux_example/redux/actions.dart';

class _ViewModel extends Equatable {
  final List<Todo> todos;
  final TodoTapFunction onTodoTap;

  _ViewModel({@required this.todos, @required this.onTodoTap});

  @override
  List<Object> get props => [todos];
}

class VisibleTodoList extends StatelessWidget {
  List<Todo> _getVisibleTodos(List<Todo> todos, VisibilityFilter filter) {
    switch (filter) {
      case VisibilityFilter.SHOW_ALL:
        return todos;
      case VisibilityFilter.SHOP_COMPLETED:
        return todos.where((todo) => todo.completed).toList();
      case VisibilityFilter.SHOW_ACTIVE:
        return todos.where((todo) => !todo.completed).toList();
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<TodoState, _ViewModel>(
      converter: (store) => _ViewModel(
          todos:
              _getVisibleTodos(store.state.todos, store.state.visibilityFilter),
          onTodoTap: (id) => store.dispatch(ToggleTodoAction(id: id))),
      builder: (context, viewModel) => TodoList(
        todos: viewModel.todos,
        onTodoTap: viewModel.onTodoTap,
      ),
    );
  }
}
