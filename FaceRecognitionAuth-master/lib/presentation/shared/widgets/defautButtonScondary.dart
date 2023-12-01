import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class ButtonScondaryWidget extends StatelessWidget {
   ButtonScondaryWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.name,
    required this.icone,
    required this.onPressed,
  }) : super(key: key);
String? name;
  final double height;
  final double width;
  String? icone;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 56,
      width: width * 305,
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed:onPressed,
        
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(icone!),
                SizedBox(
                          width: width * 9,
                        ),
                Text(
                  name!,
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontFamily: "Montserrat",
                      fontSize: width *16),
                      textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
    
    );
  }
}