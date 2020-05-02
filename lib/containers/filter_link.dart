import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/components/link.dart';
import 'package:redux_example/models.dart';
import 'package:redux_example/redux/actions.dart';

class _ViewModel extends Equatable {
  final bool active;
  final VoidCallback onPressed;

  _ViewModel({@required this.active, @required this.onPressed});

  @override
  List<Object> get props => [active];
}

class FilterLink extends StatelessWidget {
  final VisibilityFilter filter;
  final String text;

  FilterLink({@required this.filter, @required this.text});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<TodoState, _ViewModel>(
      distinct: true,
      converter: (store) => _ViewModel(
          active: filter == store.state.visibilityFilter,
          onPressed: () =>
              store.dispatch(SetVisibilityFilterAction(filter: filter))),
      builder: (context, viewModel) => Link(
          active: viewModel.active, text: text, onPressed: viewModel.onPressed),
    );
  }
}
