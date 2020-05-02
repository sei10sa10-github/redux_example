import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/models.dart';
import 'package:redux_example/redux/actions.dart';

class _ViewModel extends Equatable {
  final AddTodoPressedFunction onAddPressed;

  _ViewModel({@required this.onAddPressed});

  @override
  List<Object> get props => [];
}

class AddTodo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<TodoState, _ViewModel>(
        distinct: true,
        converter: (store) => _ViewModel(
            onAddPressed: (todoText) =>
                store.dispatch(AddTodoAction(text: todoText))),
        builder: (context, viewModel) => TextField(
          controller: _controller,
          decoration: InputDecoration(labelText: 'Add Todo'),
          onSubmitted: (todoText) {
            viewModel.onAddPressed(todoText);
            _controller.text = '';
          },
        ));
  }
}
