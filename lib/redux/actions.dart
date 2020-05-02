import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:redux_example/models.dart';

abstract class TodoAction extends Equatable {
}

class AddTodoAction extends TodoAction {
  static int _id = 0;
  final String text;

  AddTodoAction({@required this.text}) {
    _id++;
  }

  int get id => _id;

  @override
  List<Object> get props => [text];
}

class SetVisibilityFilterAction extends TodoAction {
  final VisibilityFilter filter;
  
  SetVisibilityFilterAction({@required this.filter});

  @override
  List<Object> get props => [filter];
}

class ToggleTodoAction extends TodoAction {
  final int id;

  ToggleTodoAction({@required this.id});

  @override
  List<Object> get props => [id];
}