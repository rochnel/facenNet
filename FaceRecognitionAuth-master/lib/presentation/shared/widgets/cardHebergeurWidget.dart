
import 'package:face_net_authentication/core/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/config/font_family.dart';

class CardHebergeur extends StatelessWidget {
  const CardHebergeur({
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 181,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                  width: width * 180.64,
                  height: height * 124.55,
                  child: Image.asset(
                    "assets/images/icons/home_img.png",
                    fit: BoxFit.fill,
                  )),

              Positioned(
                top: 6,
                left: 6,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '70.000 Fcfa',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.6,
                            fontFamily: AppFonts.clashDisplaySemibold),
                      ),
                      Text(
                        ' /Nuit',
                        style: TextStyle(
                            color: Colors.white, fontSize: 8.6),
                      ),
                    ],
                  ),
                ),
              ),
              // // Icône en haut à droite
              // Positioned(
              //     top: 0,
              //     right: 0,
              //     child: IconButton(
              //         onPressed: () {},
              //         icon: Icon(
              //           Icons.favorite,
              //           color: AppColors.grayColor,
              //         ))),
            ],
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Maison/appartement entier",
                        style: TextStyle(
                          fontSize: 10.6,
                          fontFamily: AppFonts.clashDisplayRegular,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/images/icons/star.svg"),
                        SvgPicture.asset("assets/images/icons/star.svg"),
                        SvgPicture.asset("assets/images/icons/star.svg"),
                        SvgPicture.asset("assets/images/icons/demistar.svg"),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Text(
             "Hilton hotel",
             style: TextStyle(
               fontSize: 12.6,
               fontFamily: AppFonts.clashDisplayBold,
             ),
           ),
           SizedBox(height: 3,),
              Row(
                  children: [
                    SvgPicture.asset("assets/images/icons/location.svg"),
                     SizedBox(width: 5,),
                    Flexible(
                      child: Text(
                        "0.2 km du centre",
                        style: TextStyle(
                          fontSize: 10.6,
                          fontFamily: AppFonts.clashDisplayRegular,
                        ),
                      ),
                    ),
                    
                  ],
                ),
           
              ],
            ),
          ),
           
        ],
      ),
    );
  }
}
