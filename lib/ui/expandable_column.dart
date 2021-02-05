import 'package:flutter/material.dart';


class ExpandableColumn extends StatelessWidget {
  final Widget child;
  final BoxConstraints constraints;
  const ExpandableColumn({
    Key key,
    this.constraints,
    @required this.child,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    BoxConstraints _constraints = BoxConstraints(
      minHeight: MediaQuery.of(context).size.height,
    );

    return ConstrainedBox(
      constraints: (constraints == null) ? _constraints : constraints,
      child: Container(
        child: IntrinsicHeight(
          child: child,
        ),
      ),
    );
  }
}
