import 'package:flutter/material.dart';
import 'package:stem/features/cv_generator/src/config.dart';

///[SBContainer] is a section biography container
/// This container helps create responsive spacing between
/// elements in the layout.
///
///
class SBContainer extends StatelessWidget {
  final Widget child;
  const SBContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      constraints: BoxConstraints(
        minHeight: Config.dynamicHeight(context) / Config.fortyPx,
        maxHeight: Config.dynamicHeight(context) / Config.twoPx,
        minWidth: Config.dynamicWidth(context) / Config.fourPx,
        maxWidth: Config.dynamicWidth(context) / Config.twoPx,
      ),
      child: child,
    );
  }
}