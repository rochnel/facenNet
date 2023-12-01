
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';


class DefaulOutlineButton extends StatelessWidget {
   DefaulOutlineButton({
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
  width: width * 312,
  decoration: BoxDecoration(
    border: Border.all(
      color: AppColors.primaryColor, // Couleur de la bordure primaire
    ),
    borderRadius: BorderRadius.circular(10),
  ),
  child: TextButton(
    style: TextButton.styleFrom(
      backgroundColor: Colors.white, // Arrière-plan blanc
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: press,
    child: Container(
      child: Text(
        name!,
        style: TextStyle(
          color: AppColors.primaryColor, // Texte en couleur primaire
          fontFamily: "ClashDisplayMedium",
          fontSize: 16,
        ),
      ),
    ),
  ),
);

  }
}
