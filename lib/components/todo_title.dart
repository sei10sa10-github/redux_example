import 'package:flutter/material.dart';
import 'package:redux_example/models.dart';

class TodoTile extends StatelessWidget {
  final Key key;
  final TodoTapFunction onTap;
  final Todo todo;

  final TextStyle completedTextStyle = TextStyle(
      decoration: TextDecoration.combine([TextDecoration.lineThrough]));

  TodoTile({@required this.key, @required this.onTap, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.text, style: todo.completed ? completedTextStyle : null),
      onTap: () => onTap(todo.id),
    );
  }
}
