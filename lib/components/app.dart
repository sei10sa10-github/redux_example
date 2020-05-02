import 'package:flutter/material.dart';
import 'package:redux_example/components/footer.dart';
import 'package:redux_example/containers/add_todo.dart';
import 'package:redux_example/containers/visible_todo_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Todos')
      ),
      body: Container(
        child: Column(
          children: [
            AddTodo(),
            VisibleTodoList(),
            Footer()
          ],
        ),
      ),
    );
  }
}