
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';


class DefaulButton extends StatelessWidget {
   DefaulButton({
    Key? key,
    required this.name,
      required this.press,
         required this.height,
    required this.width,
  }) : super(key: key);
String? name;
Function()? press;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
     height: height * 48,
      width: width *312,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: press,
        child: Container(
          child: Text(
            name!,
            style: TextStyle(
                color: Colors.white,
                fontFamily: "ClashDisplayMedium",
                fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}
