import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/config/app_colors.dart';


class HeaderWidget extends StatelessWidget {

  HeaderWidget(
      {Key? key,
        this.isBack = false,
      this.child,
      this.actions,
      this.function,
      required this.titre
      }) : super(key: key);

  String titre;
  Widget? child;
  List<Widget>? actions;
  Function()? function;
  bool isBack;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: (isBack == true)? IconButton(
        splashRadius: 20,
        onPressed: (){
          Get.back();
          function;
          },
        icon: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(4)),
          
        ),
      ):null,
      title:child != null
          ? child
          : Text(
        titre,
        style: TextStyle(
            decoration: TextDecoration.none,
            color: Color(0xff1B2124),
            fontSize: 20,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold),
      ),
      actions:actions,
    );
  }
}
