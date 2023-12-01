import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaulButton3 extends StatelessWidget {
  DefaulButton3({
    Key? key,
    required this.height,
    required this.width,
    required this.name,
    required this.press,
  }) : super(key: key);
  String? name;
  final double height;
  final double width;
  Function()? press;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 56,
      width: width * 272,
      child: TextButton(
        style: TextButton.styleFrom(
          shadowColor: Colors.white,
          elevation: 1,
          foregroundColor: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: press,
        child: Container(
          child: Text(
            name!,
            style: TextStyle(
                color: Colors.green,
                fontFamily: "Montserrat",
                fontSize: width * 16),
          ),
        ),
      ),
    );
  }
}
