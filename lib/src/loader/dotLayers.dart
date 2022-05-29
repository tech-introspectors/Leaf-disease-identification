import 'dart:math';

import 'package:flutter/material.dart';

class DotLayers extends StatefulWidget {
  final double radius;
  final double spaceBetweenDot;
  final double dotRadius;
  final Color dotColor;

  const DotLayers({
    required this.radius,
    required this.spaceBetweenDot,
    required this.dotRadius,
    required this.dotColor,
    Key? key,
  }) : super(key: key);

  @override
  State<DotLayers> createState() => _DotLayersState();
}

class _DotLayersState extends State<DotLayers> {
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(widget.radius * cos(widget.spaceBetweenDot * pi / 4),
          widget.radius * sin(widget.spaceBetweenDot * pi / 4)),
      child: Dot(
        radius: widget.dotRadius,
        color: widget.dotColor,
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  const Dot({
    required this.radius,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: this.radius,
        width: this.radius,
        decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
