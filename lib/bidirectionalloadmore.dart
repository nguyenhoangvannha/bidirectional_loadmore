library bidirectionalloadmore;

import 'package:flutter/material.dart';

class BiDirectionalLoadMore extends StatelessWidget {
  final ScrollView child;
  final VoidCallback onLoadMoreAtTop;
  final VoidCallback onLoadMoreAtEnd;

  BiDirectionalLoadMore({
    Key key,
    @required this.child,
    this.onLoadMoreAtTop,
    this.onLoadMoreAtEnd,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      child: child,
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollEndNotification) {
          if (onLoadMoreAtEnd != null) {
            onLoadMoreAtEnd();
          }
        }
        return false;
      },
    );
  }
}
