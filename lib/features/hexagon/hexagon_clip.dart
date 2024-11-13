import 'package:flutter/material.dart';
import 'package:stem/features/hexagon/hexagon_drawer.dart';

/// A widget that clips its child using a Hexagon with its number of sides equal to [sides], rotated by [rotate] degrees.
///
/// To round the edges of the hexagon, pass the desired angle to [borderRadius].
/// There is a known issue where adding a [borderRadius] will reduce the size of the hexagon.
class ClipHexagon extends StatelessWidget {
  final Widget? child;
  final int sides;
  final double rotate;
  final double borderRadius;
  final List<HexagonBoxShadow> boxShadows;

  /// Creates a hexagon shaped clip with [sides] sides rotated [rotate] degrees.
  ///
  /// Provide a [borderRadius] to set the radius of the corners.
  ///
  /// The [sides] argument must be at least 3.
  const ClipHexagon(
      {
        super.key,
      required this.sides,
      this.rotate = 0.0,
      this.borderRadius = 0.0,
      this.boxShadows = const [],
      this.child})
      : assert(sides >= 3);

  @override
  Widget build(BuildContext context) {
    HexagonPathSpecs specs = HexagonPathSpecs(
      sides: sides < 3 ? 3 : sides,
      rotate: rotate,
      borderRadiusAngle: borderRadius,
    );

    return AspectRatio(
        aspectRatio: 1.0,
        child: CustomPaint(
            painter: HexagonBoxShadowPainter(specs, boxShadows),
            child: ClipPath(
              clipper: HexagonClipper(specs),
              child: child,
            )));
  }
}

/// Provides hexagon shaped clips based on [HexagonPathSpecs]
class HexagonClipper extends CustomClipper<Path> {
  final HexagonPathSpecs specs;

  /// Create a hexagon clipper with the provided specs.
  HexagonClipper(this.specs);

  @override
  Path getClip(Size size) {
    return HexagonPathDrawer(size: size, specs: specs).draw();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

/// A Hexagon shaped shadow
class HexagonBoxShadowPainter extends CustomPainter {
  final HexagonPathSpecs specs;
  final List<HexagonBoxShadow> boxShadows;

  /// Creates a Hexagon shaped shadow
  HexagonBoxShadowPainter(this.specs, this.boxShadows);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = HexagonPathDrawer(size: size, specs: specs).draw();

    for (var shadow in boxShadows) {
      canvas.drawShadow(path, shadow.color, shadow.elevation, false);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/// Specifications of a Hexagon box shadow
class HexagonBoxShadow {
  final Color color;
  final double elevation;

  /// Creates a Hexagon box shadow with the provided [color] and [elevation].
  HexagonBoxShadow({
    required this.color,
    required this.elevation,
  });
}