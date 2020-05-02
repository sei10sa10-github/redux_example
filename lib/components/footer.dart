import 'package:flutter/material.dart';
import 'package:redux_example/containers/filter_link.dart';
import 'package:redux_example/models.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          FilterLink(filter: VisibilityFilter.SHOW_ALL, text: 'All'),
          FilterLink(filter: VisibilityFilter.SHOW_ACTIVE, text: 'Active'),
          FilterLink(filter: VisibilityFilter.SHOP_COMPLETED, text: 'Completed'),
        ],
      ),
    );
  }
}