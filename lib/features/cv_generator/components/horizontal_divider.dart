import 'package:flutter/material.dart';
import 'package:stem/features/cv_generator/src/config.dart';

/// [SHDivider] is a section_horizontal_divider
/// That component separates sections in some
/// layout templates. Used to create uniformity
/// and consistency in design
class SHDivider extends StatelessWidget {
  const SHDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.twoPx,
      width: Config.largeWidth * 0.6,
      color: Theme.of(context).dividerColor,
    );
  }
}