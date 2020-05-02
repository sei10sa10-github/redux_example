import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  final bool active;
  final String text;
  final VoidCallback onPressed;

  Link({@required this.active, @required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: active ? Theme.of(context).primaryColor : null,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
