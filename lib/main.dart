import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/components/app.dart';
import 'package:redux_example/models.dart';
import 'package:redux_example/redux/reducers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Store store =
      Store<TodoState>(todoAppReducer, initialState: TodoState.initialState());

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StoreProvider<TodoState>(
          store: store,
          child: App(),
        ),
    );
  }
}
