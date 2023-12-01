import 'package:flutter/material.dart';

class BorderIcon extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final double? width, height;
  final Color? color;

  BorderIcon({this.child, this.padding, this.width, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            border: Border.all(color: Colors.grey.withAlpha(40), width: 2)),
        padding: const EdgeInsets.all(8.0),
        margin: EdgeInsets.only(left: 250),
        child: Center(child: child));
  }
}
