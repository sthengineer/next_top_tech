import 'package:flutter/material.dart';

abstract class MainCard {
  const MainCard(this.color, this.margin, this.child, this.radius);

  final Color color;
  final EdgeInsets margin;
  final Widget child;
  final double radius;

  Widget buildWidget();
}
