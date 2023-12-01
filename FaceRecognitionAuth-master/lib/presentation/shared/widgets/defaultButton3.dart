
import 'package:flutter/material.dart';

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
          backgroundColor: Color(0xff191489),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: press,
        child: Container(
          child: Text(
            name!,
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Montserrat",
                fontSize: width *16),
          ),
        ),
      ),
    );
  }
}

