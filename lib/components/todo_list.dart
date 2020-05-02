import 'package:flutter/material.dart';
import 'package:redux_example/components/todo_title.dart';
import 'package:redux_example/models.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final TodoTapFunction onTodoTap;

  const TodoList({@required this.todos, @required this.onTodoTap});

  List<Widget> _buildListItems() {
    return todos.map(
      (todo) => TodoTile(
        key: Key(todo.id.toString()),
        todo: todo,
        onTap: onTodoTap,
      )
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildListItems(),
    );
  }
}